import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'LoginPage.dart';


void main() async{

  // initialize hive
  await Hive.initFlutter();

  // open a box
  await Hive.openBox('myBox');

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.indigo.shade900,
          foregroundColor: Colors.white,
          centerTitle: true,
          elevation: 0,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Colors.orange.shade600,
          showUnselectedLabels: true,
          unselectedItemColor: Colors.grey.shade800,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.indigo.shade900),
            foregroundColor: MaterialStateProperty.all(Colors.white),
            shape: MaterialStateProperty.all(
              BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(4.0),
              ),
            ),
            fixedSize: MaterialStateProperty.all(
              Size(screenWidth, 50),
            ),
          ),
        ),
      ),
    );
  }
}
