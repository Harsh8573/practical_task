import 'package:flutter/material.dart';



class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Login'),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        child: Image.asset("image/sunlight.jpeg"),
                      ),
                      Positioned(
                          left: 10.0,
                          bottom: 110.0,
                          child: Row(
                            children: [
                              Text(
                                'Welcome To',
                                style: TextStyle(
                                    color: Colors.greenAccent[200],
                                    fontSize: 18),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                'Goa',
                                style: TextStyle(
                                    color: Colors.greenAccent[200],
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                'Singam',
                                style: TextStyle(
                                    color: Colors.greenAccent[200],
                                    fontSize: 18),
                              ),
                            ],
                          )),
                      Positioned(
                          left: 10.0,
                          bottom: 90.0,
                          child: Text(
                            'sign up to Continue',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ))
                    ],
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.black12,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            child: Text(
                              'or Signup With',
                              style: TextStyle(fontSize: 13),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        color: Colors.blue[300],
                                        borderRadius:
                                        BorderRadius.circular(20)),
                                    child: Row(
                                      children: [
                                        Icon(Icons.facebook),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text('facebook'),
                                      ],
                                    )),
                                SizedBox(
                                  width: 20,
                                ),
                                Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        color: Colors.red[200],
                                        borderRadius:
                                        BorderRadius.circular(20)),
                                    child: Row(
                                      children: [
                                        Icon(Icons.facebook),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text('Google  '),
                                      ],
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 140),
                child: Card(

                  color: Colors.white,
                  child: Container(
                    height: 350,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding:  EdgeInsets.only(left: 70,right:10,top:20),
                              child: Text('Login',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22
                                  )),
                            ),
                            Padding(
                              padding:  EdgeInsets.only(right: 20,left: 60,top:20),
                              child: Text('Sign up',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20
                                  )),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 13.0, right: 13.0, top: 25),
                          child: TextFormField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.circular(60 / 2))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 13.0, right: 13.0, top: 10),
                          child: TextFormField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.circular(60 / 2))),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(
                              left: 18.0, right: 15.0, top: 15),
                          child: Row(
                            children: [
                              CircleAvatar(
                                child: Icon(
                                  Icons.male,
                                  size: 25,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text('Male'),
                              SizedBox(
                                width: 20,
                              ),
                              CircleAvatar(child: Icon(Icons.female, size: 25)),
                              SizedBox(
                                width: 5,
                              ),
                              Text('Female')
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.white30,
      ),
    );
  }
}
