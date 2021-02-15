import 'package:click_to_eat/Helpers/Footer.dart';
import 'package:click_to_eat/Helpers/Headers.dart';
import 'package:click_to_eat/Helpers/MiddleBody.dart';
import 'package:click_to_eat/Services/ManageData.dart';
import 'package:click_to_eat/Views/HomePage.dart';
import 'package:click_to_eat/Views/SplashScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Headers()),
        ChangeNotifierProvider.value(value: MiddleHelpers()),
        ChangeNotifierProvider.value(value: ManageData()),
        ChangeNotifierProvider.value(value: Footers()),
      ],
      child: MaterialApp(
        title: 'Click to Eat',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.red,
          primaryColor: Colors.redAccent,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
