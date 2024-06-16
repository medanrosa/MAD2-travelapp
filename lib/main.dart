import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:negombo/Themes/theme_provider.dart';
import 'package:provider/provider.dart';
import 'Logins/login.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb){
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCBLSJp8EnpPeQkwcCk8gV_GsspJ4GIZKI",
            authDomain: "fir-auth-95edc.firebaseapp.com",
            projectId: "fir-auth-95edc",
            storageBucket: "fir-auth-95edc.appspot.com",
            messagingSenderId: "31212545411",
            appId: "1:31212545411:web:5c5d4490156b4bacd442b6",
            measurementId: "G-GFJVE32TYG"
        ) );
  }else {
   await Firebase.initializeApp();
  }


  runApp(
    ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: LoginScreen(),
    );
  }
}