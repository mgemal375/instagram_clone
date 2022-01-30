import 'package:flutter/material.dart';
import 'package:instagram_clone/Screens/login_screen.dart';

class WebScreenLayout extends StatelessWidget {
  const WebScreenLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Center(child:Text("this is Web view "),)
        //  LoginScreen()
        ),
    );
  }
}