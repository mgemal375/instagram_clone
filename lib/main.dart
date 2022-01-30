import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/Responsive/mobile_screen_layout.dart';
import 'package:instagram_clone/Responsive/responsive_layout_screen.dart';
import 'package:instagram_clone/Responsive/web_screen_layout.dart';
import 'package:instagram_clone/Screens/login_screen.dart';
import 'package:instagram_clone/Screens/signup_Screen.dart';
import 'package:instagram_clone/Utilities/Colors.dart';

void main()  async{
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb){
    await Firebase.initializeApp(
      options:FirebaseOptions(apiKey: 'AIzaSyB23OfPj1j4v_8oQqJD_p_cG9tvFCP4Dmk', 
      appId: "1:1090953619983:web:ed1feefcb330ebeb58917a", 
      messagingSenderId: "1090953619983", projectId: "instagram-clone-2a1de")
    );
  }
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram_clone',
      theme:ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor
      ),
          // home: ResponsiveLayout(mobileScreenLayout:MobileScreenLayout() ,webScreenLayout:WebScreenLayout() )
       home: StreamBuilder(
         stream:FirebaseAuth.instance.authStateChanges() ,
         builder:(context,snapshot){
           if(snapshot.connectionState==ConnectionState.active){
             if(snapshot.hasError){
               return ResponsiveLayout(
                 mobileScreenLayout:MobileScreenLayout(),
                 webScreenLayout:WebScreenLayout()
                  );
             }else if(snapshot.hasData){
               return Center(
                 child: Text('${snapshot.error}'),
               );
             }             
           }
           if(snapshot.connectionState==ConnectionState.waiting){
               return Center(
                 child: CircularProgressIndicator(
                   color: primaryColor,
                 ),
               );
             }
             return LoginScreen();
         },
         )  
      );
  }
}

