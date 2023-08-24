import 'package:flutter/material.dart';
import 'package:mvvm_archeitechture/utils/routes/routes.dart';
import 'package:mvvm_archeitechture/utils/routes/routes_name.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),

      ),
     initialRoute: RoutesName.login,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}


