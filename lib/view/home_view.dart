import 'package:flutter/material.dart';
import 'package:mvvm_archeitechture/utils/routes/routes_name.dart';
import 'package:mvvm_archeitechture/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final userPrefrence = Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('abc'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell (
            onTap: (){
              userPrefrence.remove().then((value){
                Navigator.pushReplacementNamed(context, RoutesName.login);
              });
            },
              child: Center(child: Text('Log Out'))),
        ],
      ),
    );
  }
}
