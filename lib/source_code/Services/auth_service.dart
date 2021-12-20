import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:task_app/source_code/Screens/HomePage.dart';
import 'package:task_app/source_code/Screens/SignIn.dart';

userAuthState() {
  if (FirebaseAuth.instance.currentUser == null) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignIn(),
    );
  } else {
    var user = FirebaseAuth.instance.currentUser!.email;
    print(user);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePageView(),
    );
  }
}

signOut(context) async {
  await FirebaseAuth.instance.signOut();
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => SignIn()));
}
