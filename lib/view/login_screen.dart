import 'package:flutter/material.dart';
import 'package:mvvm_archeitechture/utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(onPressed: () {
          Utils.flushBarErrorMessage('No internet connections', context);
         // Utils.toastMessage('No Internet');
         // Utils.snakBar('No Internet',context);
        }, child: Text('Click'),),
      ),
    );
  }
}
