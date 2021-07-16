import "package:flutter/material.dart";
import 'package:inprodi/views/routes.dart';
import 'package:inprodi/themes/theme.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'InprodiApp',
      initialRoute: 'login',
      routes: appRoutes,
      theme: mainTheme,
    );
  }
}
