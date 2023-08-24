

import 'package:flutter/material.dart';
import 'package:mvvm_archeitechture/utils/routes/routes_name.dart';
import 'package:mvvm_archeitechture/view/home_screen.dart';

import '../../view/login_screen.dart';

class Routes {

  static Route<dynamic> generateRoute(RouteSettings settings){

    switch(settings.name){
      case RoutesName.home:
        return MaterialPageRoute(builder: (BuildContext context) => HomeScreen());
      case RoutesName.login:
        return MaterialPageRoute(builder: (BuildContext context) => LoginScreen());
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