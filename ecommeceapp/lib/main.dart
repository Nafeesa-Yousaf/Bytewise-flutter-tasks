import 'package:ecommeceapp/Profile/EditProfile.dart';
import 'package:ecommeceapp/Profile/ViewProfile.dart';
import 'package:ecommeceapp/Profile/profile_adapter.dart';
import 'package:ecommeceapp/Profile/proile_model.dart';
import 'package:ecommeceapp/WishBox.dart';
import 'package:ecommeceapp/bagItemPage/BagItemPage1.dart';
import 'package:ecommeceapp/bagItemPage/BagItemPage2.dart';
import 'package:ecommeceapp/bagItemPage/BagItemPage3.dart';
import 'package:ecommeceapp/bagItemPage/BagItemPage4.dart';
import 'package:ecommeceapp/bagItemPage/BagItemPage5.dart';
import 'package:ecommeceapp/bagItemPage/BagItemPage6.dart';
import 'package:ecommeceapp/cart/cartbox.dart';
import 'package:ecommeceapp/screens/login.dart';
import 'package:ecommeceapp/shoesItemPage/ItemPage1.dart';
import 'package:ecommeceapp/shoesItemPage/ItemPage2.dart';
import 'package:ecommeceapp/shoesItemPage/ItemPage3.dart';
import 'package:ecommeceapp/shoesItemPage/ItemPage4.dart';
import 'package:ecommeceapp/sportItemPage/SportItemPage1.dart';
import 'package:ecommeceapp/sportItemPage/SportItemPage2.dart';
import 'package:ecommeceapp/sportItemPage/SportItemPage3.dart';
import 'package:ecommeceapp/sportItemPage/SportItemPage4.dart';
import 'package:ecommeceapp/watchitempage/WatchItemPage1.dart';
import 'package:ecommeceapp/watchitempage/WathItemPage2.dart';
import 'package:ecommeceapp/watchitempage/WathItemPage3.dart';
import 'package:ecommeceapp/watchitempage/WathItemPage4.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';


void main() async{
  await Hive.initFlutter();
  Hive.registerAdapter(ProfileAdapter());
  openCartBox();
  openWishBox();
  await Hive.openBox<Profile>('profileBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ecommerce App',
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/editProfile': (context) => EditProfileScreen(),
        '/viewProfile': (context) => ViewProfileScreen(),
        "ItemPage1": (context) => ItemPage1(),
                "ItemPage2": (context) => ItemPage2(),

        "ItemPage3": (context) => ItemPage3(),

        "ItemPage4": (context) => ItemPage4(),

      },
      onGenerateRoute: (settings) {
        if (settings.name == 'BagItemPage1') {
          return MaterialPageRoute(
            builder: (context) => BagItemPage1(),
          );
        }
        if (settings.name == 'BagItemPage2') {
          return MaterialPageRoute(
            builder: (context) => BagItemPage2(),
          );
        }
        if (settings.name == 'BagItemPage3') {
          return MaterialPageRoute(
            builder: (context) => BagItemPage3(),
          );
        }
        if (settings.name == 'BagItemPage4') {
          return MaterialPageRoute(
            builder: (context) => BagItemPage4(),
          );
        }
        if (settings.name == 'BagItemPage5') {
          return MaterialPageRoute(
            builder: (context) => BagItemPage5(),
          );
        }
        if (settings.name == 'BagItemPage6') {
          return MaterialPageRoute(
            builder: (context) => BagItemPage6(),
          );
        }
        if (settings.name == 'WatchItemPage1') {
          return MaterialPageRoute(
            builder: (context) => WatchItemPage1(),
          );
        }
        if (settings.name == 'WatchItemPage2') {
          return MaterialPageRoute(
            builder: (context) => WatchItemPage2(),
          );
        }
        if (settings.name == 'WatchItemPage3') {
          return MaterialPageRoute(
            builder: (context) => WatchItemPage3(),
          );
        }
        if (settings.name == 'WatchItemPage4') {
          return MaterialPageRoute(
            builder: (context) => WatchItemPage4(),
          );
        }
        if (settings.name == 'SportItemPage1') {
          return MaterialPageRoute(
            builder: (context) => SportItemPage1(),
          );
        }
        if (settings.name == 'SportItemPage2') {
          return MaterialPageRoute(
            builder: (context) => SportItemPage2(),
          );
        }
        if (settings.name == 'SportItemPage3') {
          return MaterialPageRoute(
            builder: (context) => SportItemPage3(),
          );
        }
        if (settings.name == 'SportItemPage4') {
          return MaterialPageRoute(
            builder: (context) => SportItemPage4(),
          );
        }
        return null;
      },
    );
  }
}
