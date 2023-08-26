
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm_archeitechture/utils/routes/routes_name.dart';
import 'package:mvvm_archeitechture/view_model/user_view_model.dart';

import '../../model/user_model.dart';

class SplashServices {


  Future<UserModel> getUserData() => UserViewModel().getUser();

  void checkAuthentication (BuildContext context) async {
   getUserData().then((value) async{
     if(value.token == 'null' || value.token == ''){
       await Future.delayed(Duration(seconds: 3));
       Navigator.pushReplacementNamed(context, RoutesName.login);
     }else{
       await Future.delayed(Duration(seconds: 3));
       Navigator.pushReplacementNamed(context, RoutesName.home);
     }
   }).onError((error, stackTrace){
     if(kDebugMode){
       print(error.toString());
     }
   });
  }

}