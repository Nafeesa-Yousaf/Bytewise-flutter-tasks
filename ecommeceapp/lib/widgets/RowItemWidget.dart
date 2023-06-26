import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class RowItemWidget extends StatelessWidget {
  final Box<dynamic> cartBox = Hive.box('cart');


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (int i = 1; i < 5; i++)
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 10),
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              height: 180,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 222, 173),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF475269).withOpacity(0.3),
                      blurRadius: 5,
                      spreadRadius: 1,
                    )
                  ]),
              child: Row(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20, right: 70),
                        height: 110,
                        width: 120,
                        decoration: BoxDecoration(
                          color: Colors.orangeAccent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      Image.asset(
                        "images/image$i.png",
                        height: 150,
                        width: 150,
                        fit: BoxFit.contain,
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Nike Shoe",
                          style: TextStyle(
                            color: Color(0xFF475629),
                            fontSize: 23,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Men's Shoe",
                            style: TextStyle(
                              color: Color(0xFF475629).withOpacity(0.8),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            )),
                        Spacer(),
                        Row(
                          children: [
                            Text("\$150",
                                style: TextStyle(
                                  color: Colors.redAccent,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                )),
                            SizedBox(
                              width: 70,
                            ),
                            InkWell(
                              onTap: () {
                                final item = {
                                  'name': "Nike Shoes",
                                  'image': "assets/images/image$i.png",
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
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
