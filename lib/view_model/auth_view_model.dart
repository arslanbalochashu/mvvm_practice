
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm_archeitechture/repository/auth_repository.dart';
import 'package:mvvm_archeitechture/utils/utils.dart';

import '../utils/routes/routes_name.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();

  bool _loading = false ;
  bool get loading => _loading;
  bool _signUploading = false ;
  bool get signUpLoading => _signUploading;

  setLoading(bool value){
    _loading = value;
    notifyListeners();
  }

  setSignUpLoading(bool value){
    _signUploading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data , BuildContext context) async {
    setLoading(true);
    _myRepo.loginApi(data).then((value){
      setLoading(false);
      Utils.snackBar('Logged In Successfully', context);
      Navigator.pushNamed(context, RoutesName.home);
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace){
      Utils.flushBarErrorMessage(error.toString(), context);
      setLoading(false);
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }

  Future<void> signUpApi(dynamic data , BuildContext context) async {
    setSignUpLoading(true);
    _myRepo.loginApi(data).then((value){
      setSignUpLoading(false);
      Utils.snackBar('Sign up Successfully', context);
      Navigator.pushNamed(context, RoutesName.home);
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace){
      Utils.flushBarErrorMessage(error.toString(), context);
      setSignUpLoading(false);
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}