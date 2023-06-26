import 'package:ecommeceapp/screens/login.dart';
import 'package:ecommeceapp/widgets/begItemWidget.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../widgets/AllItemWidget.dart';
import '../widgets/RowItemWidget.dart';
import 'liked.dart';
import 'profile.dart';
import 'cart_added.dart';
import 'package:ecommeceapp/widgets/watchItemWidget.dart';
import 'package:ecommeceapp/widgets/sportItemWidget.dart';

class HomeScreen extends StatelessWidget {
  final Box<dynamic> cartBox = Hive.box('cart');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                    
          },
        ),
        title: Text("Ecommerce Website"),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => cart_added()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Handle notification button press
              // Add your logic here
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 70,
            color: Colors.orange,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: Column(
                    children: [
                      Icon(
                        Icons.shopping_bag,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => bagItemWidget()),
                    );
                  },
                ),
                IconButton(
                  icon: Column(
                    children: [
                      Icon(
                        Icons.directions_walk,
                        color: Colors.yellow,
                      ),
                    ],
                  ),
                  onPressed: () {
                    // Handle directions walk button press
                    // Add your logic here
                  },
                ),
                IconButton(
                  icon: Column(
                    children: [
                      Icon(
                        Icons.watch,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => watchItemWidget()),
                    );
                  },
                ),
                IconButton(
                  icon: Column(
                    children: [
                      Icon(
                        Icons.sports_cricket,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => sportItemWidget()),
                    );
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 30),
                  RowItemWidget(),
                  SizedBox(height: 20),
                  AllItemWidget(),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.yellow,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        currentIndex: 0, // Set the current index to 0
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.orange,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.orange,
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
              color: Colors.orange,
            ),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
              color: Colors.orange,
            ),
            label: 'Profile',
          ),
        ],
        onTap: (int index) {
          // Handle item press based on the index
          switch (index) {
            case 0:
              // Already on the home screen, no need to navigate
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => cart_added()),
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Liked()),
              );
              break;
            case 3:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => profile()),
              );
              break;
          }
        },
      ),
    );
  }
}
