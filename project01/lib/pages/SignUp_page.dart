import 'package:flutter/material.dart';
import 'package:project01/pages/Welcome.dart';
import 'Login_page.dart';
import 'TodoTask.dart';
class signup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/welcome.jpeg'),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor: Color.fromARGB(131, 0, 0, 0),
        body: Container(
          margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
          alignment: Alignment.center,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Signup: ',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w800,
                      color: Color.fromARGB(255, 129, 129, 129),
                    )),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Enter your Name',
                    hintText: 'e.g. John Doe',
                    prefixIcon: Icon(Icons.person),
                    prefixIconColor: Colors.amber,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(3),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 160, 160, 160))),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    // Save the name value
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Enter your email',
                    hintText: 'eample@abc.com',
                    prefixIcon: Icon(Icons.email),
                    prefixIconColor: Colors.amber,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(3),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 160, 160, 160))),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    // Save the name value
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Enter Password',
                    prefixIcon: Icon(Icons.lock),
                    prefixIconColor: Colors.amber,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(3),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 160, 160, 160))),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    // Save the name value
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Task()),
                    );
                  },
                  child: Text('Sign Up'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.amber,
                    onPrimary: Colors.black,
                    padding: EdgeInsets.symmetric(
                        horizontal: 40, vertical: 20), // button's padding
                    textStyle: TextStyle(fontSize: 18), // button's text style
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(20)), // button's shape
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'If you already have an account then ',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => login()),
                        );
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 16,
                          decoration: TextDecoration.underline,
                          color: Colors.amber,
                        ),
                      ),
                    ),
                  ],
                ),
              ]),
        ),
      ),
    );
  }
}

