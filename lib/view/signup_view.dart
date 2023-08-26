import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../res/components/round_button.dart';
import '../utils/routes/routes_name.dart';
import '../utils/utils.dart';
import '../view_model/auth_view_model.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  @override
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
          title: const Text('Sign Up'),
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
              RoundButton(title: 'Sign Up',
                loading : authViewModel.signUpLoading,
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
                    print('api hit');
                    authViewModel.signUpApi(data , context);
                  }
                },),
              SizedBox(
                height: height * .015,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an Account? '),
                  InkWell(
                      onTap: (){
                        Navigator.pushReplacementNamed(context, RoutesName.login);
                      },
                      child: Text('Login',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.green,),)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
