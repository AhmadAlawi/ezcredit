import 'package:ezcredit/controller/main_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BodyMainScreen extends StatelessWidget {
  const BodyMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mainController =
        Provider.of<MainScreenController>(context, listen: true);

    return mainController.widgetOptions[mainController.pageIndex];
  }
}
