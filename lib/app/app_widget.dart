import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: Modular.navigatorKey,
      title: 'Flutter Slidy',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "Poppins",
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Color(0xffE91E63)
        ),
        primaryColor: Color(0xffE91E63),
        accentColor: Color(0xff7C4DFF),
        appBarTheme: AppBarTheme(
          centerTitle: true,
          elevation: 0,
          textTheme: TextTheme(
            headline6: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w500
            ),
          )
        )
      ),
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
