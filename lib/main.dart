import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:task_app/source_code/Screens/HomePage.dart';

import 'package:task_app/source_code/Screens/SignIn.dart';
import 'package:task_app/source_code/Services/auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureBuilder(
          future: _initialization,
          builder: (context, snapshot) {
            return snapshot.hasError
                ? Container(
                    child: Text('Something went wrong!'),
                  )
                : snapshot.connectionState == ConnectionState.done
                    ? userAuthState()
                    : Center(child: CircularProgressIndicator());
          }),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  GlobalKey bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: HomePageView(),
    );
  }
}
