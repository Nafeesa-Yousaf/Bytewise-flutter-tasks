import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../screens/Home.dart';
import '../screens/cart_added.dart';
import '../screens/liked.dart';
import '../screens/profile.dart';

class sportItemWidget extends StatelessWidget {
    final Box<dynamic> cartBox = Hive.box('cart');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
          ),
          title: Text(
                "Sport Accessories",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
          actions: [
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => cart_added()),
              );
            };
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
        body: SingleChildScrollView(
          child: Container(
            child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 0.8,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: [
                for (int i = 1; i < 5; i++)
                  Container(
                    padding: EdgeInsets.all(15),
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 222, 173),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFF475269).withOpacity(0.3),
                          blurRadius: 5,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, "SportItemPage$i");
                          },
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Image.asset(
                              "assets/images/sport$i.png",
                              height: 150,
                              width: 150,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Sport Accessories",
                          style: TextStyle(
                            color: Color(0xFF475629),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Best Quality Accessories",
                          style: TextStyle(
                            color: Color(0xFF475629).withOpacity(0.7),
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "\$55",
                              style: TextStyle(
                                color: Colors.redAccent,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                final item = {
                                  'name': "Sport Accessories",
                                  'image': "assets/images/sport$i.png",
                                  'price': "55",
                                };
                                cartBox.add(item);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Item added to cart')),
                                );
                              },
                              child: Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Color(0xFF475269),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Icon(
                                  CupertinoIcons.cart_fill_badge_plus,
                                  color: Colors.white,
                                  size: 25,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.yellow,
          selectedItemColor: Colors.orange,
          unselectedItemColor: Colors.grey,
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
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
      ),
    );
  }
}
