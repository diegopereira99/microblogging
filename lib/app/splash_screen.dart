import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashScreen extends StatefulWidget {
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {

  AnimationController controller;
  Animation<double> animation;

  initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    controller.forward();
  }

  Widget build(BuildContext context) {
    Future.delayed(Duration(milliseconds: 2000))
    .then((value) => Modular.to.pushReplacementNamed('/login'));

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          color: Colors.white,
          child: FadeTransition(
            opacity: animation,
            child: Column(
              children: [
                Container(
                  height: 200,
                  margin: EdgeInsets.only(top: 50),
                  child: ClipOval(
                    child: Image.asset("assets/images/myself.jpg"),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Diego Marcelo",
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "Flutter Developer",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w600
                  ),
                ),
                SizedBox(height: 20),
                FlutterLogo(
                  size: 50,
                )
              ],
            )
          )
        ),
      ),
    );
  }
}