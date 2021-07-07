import 'package:flutter/material.dart';

import 'package:inprodi/routes/routes.dart';
import 'package:inprodi/themes/theme.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
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