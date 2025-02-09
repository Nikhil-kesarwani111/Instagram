import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:instagram/MyApp/my_app.dart';
import 'package:instagram/Provider/BottomNavProvider.dart';
import 'package:instagram/Provider/SpecificLike.dart';
import 'package:instagram/Provider/ThemeProvider.dart';
import 'package:instagram/Provider/likeProvider.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  Platform.isAndroid?
  await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyAdSRIljgDeaiqBVwCt6kf5tBFb6B5T1eM",
        appId: "1:344647798599:android:e1cf2b1284145f87144662",
        messagingSenderId: "344647798599",
        projectId:"insta-82f64",
        storageBucket: "insta-82f64.firebasestorage.app",
      )
  )
      :await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => LikeProvider()),
      ChangeNotifierProvider(create: (context) => ThemeProvider()..detectSystemTheme()), // Detect system theme on startup
      ChangeNotifierProvider(create: (_) => BottomNavProvider()),
      ChangeNotifierProvider(create: (_) => SpecificLikeProvide()),


    ],
    child: MyApp(),
  ),
  );
}

