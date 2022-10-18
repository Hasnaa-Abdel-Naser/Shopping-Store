import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shopping_apps/Auth/data/productData.dart';
import 'package:shopping_apps/feature/userNumber/presentation/phoneNumber.dart';
import 'feature/categoryPage/presentation/category.dart';
import 'feature/loading/loadingPage.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
      MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/home',
          routes:{
            '/home' : (context)=> Loading(),
            '/login': (context)=> userPhoneNumber(),
            '/category': (context)=> Category(),
          }
      )
  );

}

