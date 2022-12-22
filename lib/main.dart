// ignore_for_file: unused_local_variable, unused_field

import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezcredit/Routers/router.dart';
import 'package:ezcredit/controller/address_controller.dart';
import 'package:ezcredit/controller/apply_controller.dart';
import 'package:ezcredit/controller/auth_controller.dart';
import 'package:ezcredit/controller/employment_controller.dart';
import 'package:ezcredit/controller/financial_controller.dart';
import 'package:ezcredit/controller/device_controler.dart';
import 'package:ezcredit/controller/forget_pass_controller.dart';
import 'package:ezcredit/controller/general_controller.dart';
import 'package:ezcredit/controller/home_data_controller.dart';
import 'package:ezcredit/controller/lenders_controller.dart';
import 'package:ezcredit/controller/main_screen_controller.dart';
import 'package:ezcredit/controller/notification_controller.dart';
import 'package:ezcredit/controller/profile_controller.dart';
import 'package:ezcredit/model/config_model.dart';
import 'package:ezcredit/screen/get_started_screen.dart';
import 'package:ezcredit/screen/main_screen_two.dart';
import 'package:ezcredit/screen/maintenance_screen.dart';
import 'package:ezcredit/screen/onboard_screen.dart';
import 'package:ezcredit/screen/services_screen.dart';
import 'package:ezcredit/service/generalServices/update_status.dart';
import 'package:ezcredit/widgets/generalWidgets/main_button.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uni_links/uni_links.dart';
import 'controller/offers_controller.dart';
import 'theme/custom_theme.dart';
import 'lang/config.dart';
import 'globals.dart';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description:
        'This channel is used for important notifications.', // description
    importance: Importance.high,
    playSound: true);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  late bool firstTime;
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await EasyLocalization.ensureInitialized();
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  await FirebaseDynamicLinks.instance.getInitialLink();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  final NotificationAppLaunchDetails? notificationAppLaunchDetails =
      await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  authToken = '${prefs.getString('token')}';
  userId = prefs.getInt('userId') ?? 0;
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
  if (prefs.getBool('firsttime') ?? true) {
    firstTime = true;
    await prefs.setBool('firsttime', false);
  } else {
    firstTime = false;
  }

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  ConfigModel? configModel = await GeneralController().configInfoHandler();

  bool? update = configModel?.optionalUpdate;

  String iniialRoute = configModel?.maintenance == true
      ? MaintenenceScreen.id
      : firstTime
          ? OnBoarding.id
          : authToken != 'null'
              ? MainScreenTwo.id
              : GetStartedScreen.id;

  runApp(
    EasyLocalization(
      supportedLocales: const [
        ConfigLanguage.arLocale,
        ConfigLanguage.enLocale
      ],
      path: ConfigLanguage.langPath,
      fallbackLocale: ConfigLanguage.enLocale,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyApp(
          token: authToken,
          firsttime: firstTime,
          configModel: configModel,
          update: update,
          initialRoute: iniialRoute,
        ),
      ),
    ),
  );
}

Future _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  if (message.notification != null) {
    debugPrint("title =  ${message.notification!.title}");
  }
}

class MyApp extends StatefulWidget {
  final String? token;
  final bool firsttime;
  final bool? update;
  final ConfigModel? configModel;
  final Widget? firstPage;
  final String? initialRoute;
  const MyApp({
    Key? key,
    this.token,
    required this.firsttime,
    required this.update,
    this.firstPage,
    required this.configModel,
    this.initialRoute,
  }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Uri? _latestUri;
  Object? _err;
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  late StreamSubscription _sub;
  String? payload;

  void getNotification() async {
    final NotificationAppLaunchDetails? notificationAppLaunchDetails =
        await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
    payload = notificationAppLaunchDetails!.payload;

    var initializationSettingsAndroid =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettingsIOs = const IOSInitializationSettings();

    var initSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOs);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.initialize(initSettings,
            onSelectNotification: (pay) {
          pay = message.data['type'];
          switch (pay) {
            case "services":
              navigatorKey.currentState?.push(
                  MaterialPageRoute(builder: (context) => ServicesScreen()));
              selectedServicesIndex = 0;
              break;
          }
        });
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channelDescription: channel.description,
                color: Colors.blue,
                playSound: true,
                icon: '@mipmap/ic_launcher',
              ),
            ));
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        setState(() {
          payload = message.data['type'];
          debugPrint("payload == $payload");
          if (payload == "services") {
            navigatorKey.currentState?.push(
                MaterialPageRoute(builder: (context) => ServicesScreen()));
            selectedServicesIndex = 0;
          }
        });
      }
    });

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  void _handleIncomingLinks() {
    _sub = uriLinkStream.listen((Uri? uri) {
      if (!mounted) return;
      debugPrint('got uri: $uri');
      setState(() {
        _latestUri = uri;
        _err = null;

        navigatorKey.currentState
            ?.push(MaterialPageRoute(builder: (context) => ServicesScreen()));
        selectedServicesIndex = 0;
      });
    }, onError: (Object err) {
      debugPrint("error = $err");
    });
  }

  @override
  void initState() {
    _handleIncomingLinks();
    if (widget.update == true) {
      Future.delayed(Duration.zero, () => showAlert(context));
    }
    getNotification();
    super.initState();
  }

  void showAlert(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: const Text("New Update Available"),
              title: const Text("Ez Credit"),
              actions: [
                MainButton(
                    text: "update",
                    onPressed: () {
                      print("yes");
                    })
              ],
            ));
  }

  @override
  void dispose() {
    _sub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 813),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext c, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => ClickStatus(click: 1)),
            ChangeNotifierProvider(create: (context) => Authcontroller()),
            ChangeNotifierProvider(create: (context) => GeneralController()),
            ChangeNotifierProvider(create: (context) => ProfileController()),
            ChangeNotifierProvider(create: (context) => EmploymentController()),
            ChangeNotifierProvider(create: (context) => FinancialController()),
            ChangeNotifierProvider(create: (context) => AddressController()),
            ChangeNotifierProvider(create: (context) => DeviceinfoController()),
            ChangeNotifierProvider(create: (context) => ApplyController()),
            ChangeNotifierProvider(create: (context) => MainScreenController()),
            ChangeNotifierProvider(create: (context) => OffersController()),
            ChangeNotifierProvider(create: (context) => HomeDataController()),
            ChangeNotifierProvider(create: (context) => ForgetPassController()),
            ChangeNotifierProvider(
                create: (context) => NotificationController()),
            ChangeNotifierProvider(create: (context) => LendersController()),
          ],
          child: MaterialApp(
            navigatorKey: navigatorKey,
            title: 'EZ credit',
            debugShowCheckedModeBanner: false,
            theme: CustomTheme.lightTheme(context),
            darkTheme: CustomTheme.lightTheme(context),
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            routes: AppRoutes().routes,
            initialRoute: widget.initialRoute,
          ),
        );
      },
    );
  }
}
