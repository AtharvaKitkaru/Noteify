import 'package:flutter/material.dart';
import 'package:noteify/views/ui/auth/forgot_password.dart';
import 'package:noteify/views/ui/auth/login.dart';
import 'package:noteify/views/ui/auth/register.dart';
import 'package:noteify/views/ui/main_app/home.dart';
import 'package:noteify/views/utils/routes/routes.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      //auth routes

      case Routes.login:
        return MaterialPageRoute(builder: (context) => Login());
      case Routes.register:
        return MaterialPageRoute(builder: (context) => Register());
      case Routes.forgot_password:
        return MaterialPageRoute(builder: (context) => ForgotPassword());

      //main app routes

      case Routes.home:
        return MaterialPageRoute(builder: (context) => Home());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
