import 'package:easy_localization/easy_localization.dart';
import 'package:ezcredit/widgets/drawer/guest_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../lang/change_lang.dart';
import '../../lang/key_lang.dart';
import '../../style/assets.dart';
import '../../theme/app_colors.dart';

class EZDefaultScaffold extends StatefulWidget {
  final Widget body;
  final Widget title;
  final Widget? leading;
  final Widget? bottomSheet;
  const EZDefaultScaffold(
      {Key? key,
      required this.body,
      required this.title,
      this.leading,
      this.bottomSheet})
      : super(key: key);

  @override
  State<EZDefaultScaffold> createState() => _EZDefaultScaffoldState();
}

class _EZDefaultScaffoldState extends State<EZDefaultScaffold> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      bottomSheet: widget.bottomSheet,
      drawer: const GuestDrawer(),
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        elevation: 0,
        title: widget.title,
        centerTitle: true,
        leading: widget.leading ??
            IconButton(
              onPressed: () {
                scaffoldKey.currentState?.openDrawer();
              },
              icon: SvgPicture.asset(
                SvgAssets.drawer,
                color: AppColors.white,
              ),
            ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: GestureDetector(
                onTap: () {
                  changeLang(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(
                        color: AppColors.white,
                        width: 1.w,
                      )),
                  width: 30.w,
                  height: 30.w,
                  child: Center(
                    child: Text(
                      KeyLang.ar.tr(),
                      textAlign: TextAlign.center,
                      style: AppColors.fredoka.subtitle2!
                          .copyWith(color: AppColors.white),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(child: widget.body),
    );
  }
}
