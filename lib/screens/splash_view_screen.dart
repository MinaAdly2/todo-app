import 'package:flutter/material.dart';
import 'package:todo_mmd/app_localization.dart';
import 'package:todo_mmd/screens/home_screen.dart';

class SplashViewScreen extends StatefulWidget {
  const SplashViewScreen({Key? key}) : super(key: key);
  static String id = 'splashView';

  @override
  State<SplashViewScreen> createState() => _SplashViewScreenState();
}

class _SplashViewScreenState extends State<SplashViewScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushNamedAndRemoveUntil(
          context, HomeScreen.id, (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFF0000),
      body: Column(
        children: [
          const Center(
            child: Padding(
              padding: EdgeInsetsDirectional.only(
                top: 60,
              ),
              child: Text(
                'My Tasks',
                style: TextStyle(
                  color: Color(0xFFFFFFFF),
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Arial',
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsetsDirectional.only(
              top: 10,
            ),
            child: Text(
              'مهامي',
              style: TextStyle(
                color: Color(0xFFFFFFFF),
                fontSize: 32,
                fontWeight: FontWeight.w700,
                fontFamily: 'Arial',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(
              top: 30,
            ),
            child: Image.asset(
              'assets/images/Brazuca Planning.png',
              width: 343,
              height: 325,
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(
              top: 80,
            ),
            child: Image.asset(
              'assets/images/Line 2.png',
              width: 343,
              height: 50,
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(
              start: 60,
              top: 40,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Good'.translate(context),
                  style: TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'RobotoRegular',
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(
              start: 50,
              top: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Consistency'.translate(context),
                  style: TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'RobotoRegular',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
