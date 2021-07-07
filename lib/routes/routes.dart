import 'package:flutter/material.dart';

import 'package:inprodi/views/home_view.dart';
import 'package:inprodi/views/loading_view.dart';
import 'package:inprodi/views/login_View.dart';
import 'package:inprodi/views/register_view.dart';

final Map<String,Widget Function(BuildContext)> appRoutes ={
  'login'     : (_) => LoginView(),
  'register'  : (_) => RegisterView(),
  'home'      : (_) => HomeView(),
  'loading'   : (_) => LoadingView(),

};