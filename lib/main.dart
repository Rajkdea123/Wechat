import 'package:chatapp/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'theme.dart';
import '/routes.dart';
import '/screen/home/home.dart';
import 'screen/sign_in/sign_in_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Platform.isAndroid
  // ?await Firebase.initializeApp(
  // options: const FirebaseOptions(
  // apiKey: 'AIzaSyDU2llc2PnPjVzx5xs48x8oYekCTc4q-Ws',
  // appId: '1:666717100020:android:69abe1b6976193f0388ba1',
  // messagingSenderId: '666717100020',
  // projectId: 'chatapp-d9229'
  // ))
   await Firebase.initializeApp(
     // options: DefaultFirebaseOptions.currentPlatform,
   );
  
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat App',
      debugShowCheckedModeBanner: false,
      theme: theme(),
      routes: routes,
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const HomeScreen();
          }
          return const SignInScreen();
        },
      ),
    );
  }
}