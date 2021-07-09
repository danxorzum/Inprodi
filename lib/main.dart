// @dart=2.9
import 'package:flutter/material.dart';
import 'package:inprodi/providers/clients_provider.dart';
import 'package:inprodi/providers/user_provider.dart';

import 'package:provider/provider.dart';

import 'package:inprodi/routes/routes.dart';
import 'package:inprodi/themes/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ClientsProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'InprodiApp',
        initialRoute: 'login',
        routes: appRoutes,
        theme: mainTheme,
      ),
    );
  }
}
