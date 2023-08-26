import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_archeitechture/res/components/round_button.dart';
import 'package:mvvm_archeitechture/utils/routes/routes_name.dart';
import 'package:mvvm_archeitechture/utils/utils.dart';
import 'package:mvvm_archeitechture/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  final ValueNotifier<bool> _obscurePassword = ValueNotifier<bool>(true);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _passwordController;
    _emailController;
    _obscurePassword;
    emailFocusNode;
    passwordFocusNode;
  }
  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    final height = MediaQuery.of(context).size.height * 1;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _emailController,
                focusNode: emailFocusNode,
                onFieldSubmitted: (value){
                  Utils.feildFocusChange(context, emailFocusNode, passwordFocusNode);
                },
                decoration: const InputDecoration(
                  labelText: 'Email',
                  hintText: 'Email',
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              const SizedBox(height: 10,),
              ValueListenableBuilder(
                valueListenable: _obscurePassword,
                builder: (BuildContext context, value,  child) {
                  return TextFormField(
                    controller: _passwordController,
                    focusNode: passwordFocusNode,
                    obscureText: _obscurePassword.value,
                    obscuringCharacter: '*',
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: 'Password',
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: InkWell(
                        onTap: (){
                          _obscurePassword.value = !_obscurePassword.value;
                        },
                          child: Icon(
                              _obscurePassword.value ?Icons.visibility_off : Icons.visibility)),
                    ),
                  );
                },
              ),
              SizedBox(height: height * .055,),
              RoundButton(title: 'Login',
                loading : authViewModel.loading,
                onPress: () {
                if(_emailController.text.isEmpty){
                  Utils.flushBarErrorMessage('Please Enter Email', context);
                }else if(_passwordController.text.isEmpty){
                  Utils.flushBarErrorMessage('Please Enter Password', context);
                }else if(_passwordController.text.length < 8){
                  Utils.flushBarErrorMessage('Please Enter 8 digit password', context);
                }else{
                  Map data = {
                    'email' : _emailController.text.toString(),
                    'password' : _passwordController.text.toString(),
                  };
                  if (kDebugMode) {
                    print('api hit');
                  }
                  authViewModel.loginApi(data , context);
                }
                },),
              SizedBox(
                height: height * .015,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Dont have an Account? '),
                  InkWell(
                    onTap: (){
                      Navigator.pushReplacementNamed(context, RoutesName.signUp);
                    },
                      child: Text('Sign Up',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.green,),)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
