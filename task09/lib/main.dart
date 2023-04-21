import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MainPage(),
    theme: ThemeData.light(),
    debugShowCheckedModeBanner: false,
  ));
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  late Animation<double> fadeAnimation;
  late AnimationController fadeAnimationController;
  late Animation<Offset> slideAnimation;

  @override
  void initState() {
    super.initState();

    // Set up the animation controller with a duration of 2 seconds
    fadeAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    // Create a tween to fade in the image
    fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(fadeAnimationController);

    // Create a tween to slide in the container from the left
    slideAnimation = Tween<Offset>(
      begin: Offset(-1, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: fadeAnimationController,
      curve: Curves.easeInOut,
    ));

    // Start the animation
    fadeAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Email Marketing',
          style: TextStyle(fontSize: 16),
        ),
        backgroundColor: Color.fromRGBO(186, 148, 119, 1),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          color: Color.fromRGBO(251, 244, 239, 1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: FadeTransition(
                  opacity: fadeAnimation,
                  child: Text(
                    'Email Marketing',
                    style: TextStyle(
                      fontFamily: 'Sans',
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  'One of the most effective forms of marketing in business is email. It\'s not easy, but it\'s worth the effort. Studies consistently show that email marketing a subscriber base regularly results in revenue over time.',
                  style: TextStyle(
                    fontFamily: 'Public Sans',
                    fontSize: 14,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Row(
                children: [
                  Padding(padding: EdgeInsets.fromLTRB(40, 10, 40, 10)),
                  Text(
                    'DO\'S',
                    style: TextStyle(
                        fontFamily: 'Public Sans',
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                 Spacer(),
                  Text('DON\'TS',
                      style: TextStyle(
                          fontFamily: 'Public Sans',
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      textAlign: TextAlign.center),
                       SizedBox(
                    width: 100,
                  ),
                ],
              ),
              Container(
                  height: 100,
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: SlideTransition(
                    position: slideAnimation,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 100,
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(20),
                            margin: EdgeInsets.fromLTRB(20, 5, 0, 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Color.fromRGBO(220, 198, 180, 1),
                            ),
                            child: Text(
                              'SignUp forms that require subscribers to opt-in to receive your emails are the best way to build your email list',
                              style: TextStyle(
                                fontFamily: 'Public Sans',
                                color: Colors.black,
                                fontSize: 14,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 100,
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromRGBO(248, 221, 191, 1),
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              'images/image1.jpg',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Container(
                            height: 100,
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(20),
                            margin: EdgeInsets.fromLTRB(0, 5, 20, 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Color.fromRGBO(186, 148, 119, 1),
                            ),
                            child: Text(
                              'Buy an email list',
                              style: TextStyle(
                                fontFamily: 'Public Sans',
                                color: Colors.black,
                                fontSize: 14,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
              SizedBox(
                height: 20,
              ),
              Container(
                  height: 100,
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: SlideTransition(
                    position: slideAnimation,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 100,
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(20),
                            margin: EdgeInsets.fromLTRB(20, 5, 0, 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Color.fromRGBO(220, 198, 180, 1),
                            ),
                            child: Text(
                              'Send Your welcome mail right after they subscribe',
                              style: TextStyle(
                                fontFamily: 'Public Sans',
                                color: Colors.black,
                                fontSize: 14,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 100,
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromRGBO(248, 221, 191, 1),
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              'images/image2.jpg',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Container(
                            height: 100,
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(20),
                            margin: EdgeInsets.fromLTRB(0, 5, 20, 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Color.fromRGBO(186, 148, 119, 1),
                            ),
                            child: Text(
                              'After they have signed up ,make  new subscribers wait yo hear from you',
                              style: TextStyle(
                                fontFamily: 'Public Sans',
                                color: Colors.black,
                                fontSize: 14,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
              SizedBox(
                height: 20,
              ),
              Container(
                  height: 100,
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: SlideTransition(
                    position: slideAnimation,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 100,
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(20),
                            margin: EdgeInsets.fromLTRB(20, 5, 0, 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Color.fromRGBO(220, 198, 180, 1),
                            ),
                            child: Text(
                              'SignUp forms that require subscribers to opt-in to receive your emails are the best way to build your email list',
                              style: TextStyle(
                                fontFamily: 'Public Sans',
                                color: Colors.black,
                                fontSize: 14,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 100,
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromRGBO(248, 221, 191, 1),
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              'images/image5.jpg',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Container(
                            height: 100,
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(20),
                            margin: EdgeInsets.fromLTRB(0, 5, 20, 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Color.fromRGBO(186, 148, 119, 1),
                            ),
                            child: Text(
                              'Buy an email list',
                              style: TextStyle(
                                fontFamily: 'Public Sans',
                                color: Colors.black,
                                fontSize: 14,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
              SizedBox(
                height: 20,
              ),
              Container(
                  height: 100,
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: SlideTransition(
                    position: slideAnimation,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 100,
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(20),
                            margin: EdgeInsets.fromLTRB(20, 5, 0, 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Color.fromRGBO(220, 198, 180, 1),
                            ),
                            child: Text(
                              'SignUp forms that require subscribers to opt-in to receive your emails are the best way to build your email list',
                              style: TextStyle(
                                fontFamily: 'Public Sans',
                                color: Colors.black,
                                fontSize: 14,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 100,
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromRGBO(248, 221, 191, 1),
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              'images/image4.jpg',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Container(
                            height: 100,
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(20),
                            margin: EdgeInsets.fromLTRB(0, 5, 20, 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Color.fromRGBO(186, 148, 119, 1),
                            ),
                            child: Text(
                              'Buy an email list',
                              style: TextStyle(
                                fontFamily: 'Public Sans',
                                color: Colors.black,
                                fontSize: 14,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
              SizedBox(
                height: 20,
              ),
              Container(
                  height: 100,
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: SlideTransition(
                    position: slideAnimation,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 100,
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(20),
                            margin: EdgeInsets.fromLTRB(20, 5, 0, 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Color.fromRGBO(220, 198, 180, 1),
                            ),
                            child: Text(
                              'SignUp forms that require subscribers to opt-in to receive your emails are the best way to build your email list',
                              style: TextStyle(
                                fontFamily: 'Public Sans',
                                color: Colors.black,
                                fontSize: 14,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 100,
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromRGBO(248, 221, 191, 1),
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              'images/image3.jpg',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Container(
                            height: 100,
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(20),
                            margin: EdgeInsets.fromLTRB(0, 5, 20, 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Color.fromRGBO(186, 148, 119, 1),
                            ),
                            child: Text(
                              'Buy an email list',
                              style: TextStyle(
                                fontFamily: 'Public Sans',
                                color: Colors.black,
                                fontSize: 14,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
