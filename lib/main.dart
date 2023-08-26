import 'package:flutter/material.dart';
import 'package:mvvm_archeitechture/utils/routes/routes.dart';
import 'package:mvvm_archeitechture/utils/routes/routes_name.dart';
import 'package:mvvm_archeitechture/view_model/auth_view_model.dart';
import 'package:mvvm_archeitechture/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => AuthViewModel(),),
      ChangeNotifierProvider(create: (_) => UserViewModel(),),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),

      ),
      initialRoute: RoutesName.splash,
      onGenerateRoute: Routes.generateRoute,
    ),);
  }
}


