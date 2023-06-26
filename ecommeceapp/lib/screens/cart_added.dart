import 'package:ecommeceapp/screens/Home.dart';
import 'package:ecommeceapp/screens/liked.dart';
import 'package:ecommeceapp/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class cart_added extends StatefulWidget {
  @override
  _CartAddedState createState() => _CartAddedState();
}

class _CartAddedState extends State<cart_added> {
  final Box<dynamic> cartBox = Hive.box('cart');
  @override
  void initState() {
    super.initState();
  }

  void clearCart() {
    cartBox.clear();
    setState(() {});
  }

  void removeItemFromCart(int index) {
    cartBox.deleteAt(index);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          'My Cart',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              // Show a confirmation dialog before clearing the cart
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Confirm'),
                    content: Text('Are you sure you want to clear the cart?'),
                    actions: [
                      TextButton(
                        child: Text('Cancel'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: Text('Clear'),
                        onPressed: () {
                          clearCart();
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            cartBox.isNotEmpty
                ? ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: cartBox.length,
                    itemBuilder: (context, index) {
                      final item = cartBox.getAt(index);
                      final itemName = item['name'];
                      final itemPrice = item['price'];
                      final itemImage = item['image'];

                      return ListTile(
                        leading: Image.asset(
                          itemImage,
                          height: 80,
                          width: 80,
                        ),
                        title: Text(itemName),
                        subtitle: Text('Price: $itemPrice'),
                        trailing: IconButton(
                          icon: Icon(Icons.remove_circle),
                          onPressed: () {
                            // Show a confirmation dialog before deletion
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Confirm'),
                                  content: Text(
                                      'Are you sure you want to remove this item from the cart?'),
                                  actions: [
                                    TextButton(
                                      child: Text('Cancel'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    TextButton(
                                      child: Text('Remove'),
                                      onPressed: () {
                                        removeItemFromCart(index);
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      );
                    },
                  )
                : Text(
                    'Your cart is empty'), // Display a message for empty cart
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.yellow,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        currentIndex: 1, // Set the current index to 1 for the "Cart" tab
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
