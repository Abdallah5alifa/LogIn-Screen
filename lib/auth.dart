import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/sceens/home_screen.dart';
import 'package:flutter_application_1/sceens/logis_screen.dart';

class Auth extends StatelessWidget {
  const Auth({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: ((contex,snapshot){
            if(snapshot.hasData){
              return HomeScreen();
            }else{
              return LogInScreen();
            }
          })),
    );
  }
}