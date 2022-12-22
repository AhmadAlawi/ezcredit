import 'package:flutter/material.dart';

class MaintenenceScreen extends StatelessWidget {
  static const String id = 'MaintenenceScreen';

  const MaintenenceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(child: Text('Application Under Maintenance')));
  }
}
