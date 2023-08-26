

import 'package:flutter/material.dart';
import 'package:mvvm_archeitechture/utils/routes/routes_name.dart';
import 'package:mvvm_archeitechture/view/home_view.dart';
import 'package:mvvm_archeitechture/view/signup_view.dart';
import 'package:mvvm_archeitechture/view/splash_view.dart';

import '../../view/login_view.dart';

class Routes {

  static Route<dynamic> generateRoute(RouteSettings settings){

    switch(settings.name){
      case RoutesName.splash:
        return MaterialPageRoute(builder: (BuildContext context) => SplashView());
      case RoutesName.home:
        return MaterialPageRoute(builder: (BuildContext context) => HomeScreen());
      case RoutesName.login:
        return MaterialPageRoute(builder: (BuildContext context) => LoginView());
      case RoutesName.signUp:
        return MaterialPageRoute(builder: (BuildContext context) => SignUpView());
      default :
        return MaterialPageRoute(builder: (_){
          return Scaffold(
            body: Center(
              child: Text('no route defined'),
            ),
          );
        });

    }


  }


}