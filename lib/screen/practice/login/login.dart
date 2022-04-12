import 'package:flutter/material.dart';
import 'package:practical_harsh/screen/practice/login/t_c.dart';

import 'l_page.dart';

class TabbBar extends StatefulWidget {
  const TabbBar({Key? key}) : super(key: key);

  @override
  State<TabbBar> createState() => _TabbBarState();
}

class _TabbBarState extends State<TabbBar> {
  bool firstvalue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Login'),
      ),
      body: Stack(
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
                                  color: Colors.greenAccent[200], fontSize: 18),
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
                                  color: Colors.greenAccent[200], fontSize: 18),
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
                      ),
                    ),

                  ],
                ),
              ],
            ),
          ),

          Positioned(
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 140),
              child: Expanded(
                child: Card(
                  color: Colors.white70,
                  child: DefaultTabController(
                    length: 2,
                    child: Container(
                      height: 400,
                      child: Scaffold(
                        backgroundColor: Colors.white10,
                        appBar: PreferredSize(
                          preferredSize: Size.fromHeight(kToolbarHeight),
                          child: Container(
                            color: Colors.white30,
                            child: Column(
                              children: <Widget>[
                                TabBar(
                                  tabs: [
                                    Tab(child: Text('Sign Up')),
                                    Tab(child: Text('LogIn')),
                                    // Tab(child: tabTextStyle(text: Strings.screen3)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        body: TabBarView(
                          children: [
                            SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  child: Stack(children: [
                                    Column(
                                      children: [
                                        SizedBox(height: 15),
                                        TextFormField(
                                          decoration: InputDecoration(
                                              prefixIcon: Icon(
                                                  Icons.account_box_sharp),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      60 / 2))),
                                        ),
                                        SizedBox(height: 10),
                                        TextFormField(
                                          decoration: InputDecoration(
                                              prefixIcon: Icon(Icons.email),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      60 / 2))),
                                        ),
                                        SizedBox(height: 10),
                                        TextFormField(
                                          decoration: InputDecoration(
                                              prefixIcon:
                                              Icon(Icons.password),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      60 / 2))),
                                        ),
                                        SizedBox(height: 15),
                                        Row(
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
                                            CircleAvatar(
                                                child: Icon(Icons.female,
                                                    size: 25)),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text('Female'),
                                          ],
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          "by pressing 'submit' you agree to",
                                          style:
                                          TextStyle(color: Colors.grey),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'out',
                                              style: TextStyle(
                                                  color: Colors.grey),
                                            ),
                                            SizedBox(width: 3),
                                            GestureDetector(
                                                onTap: () {
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder:
                                                              (context) =>
                                                              T_C()));
                                                },
                                                child: Text(
                                                  'terms & conditions',
                                                  style: TextStyle(
                                                      color: Colors
                                                          .orangeAccent),
                                                )),
                                          ],
                                        )
                                      ],
                                    ),

                                  ],

                                  ),

                                ),
                              ), //sign up
                            ),
                            SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  child: Center(
                                    child: Column(
                                      children: [
                                        SizedBox(height: 15),
                                        TextFormField(
                                          decoration: InputDecoration(
                                            prefixIcon: Icon(Icons.email),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                              BorderRadius.circular(60 / 2),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        TextFormField(
                                          decoration: InputDecoration(
                                            prefixIcon: Icon(Icons.lock),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                              BorderRadius.circular(60 / 2),
                                            ),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Checkbox(
                                                value: firstvalue,
                                                onChanged: (bool? value) {
                                                  setState(() {
                                                    firstvalue = value!;
                                                  });
                                                }),
                                            Text('Remember me'),
                                            SizedBox(
                                              width: 25,
                                            ),
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              LoginPage()));
                                                },
                                                child: Text(
                                                  'Forgot password??',
                                                  style: TextStyle(
                                                      fontWeight:
                                                      FontWeight.bold),
                                                )),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ), // login
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 131,left: 150,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.yellow,
                border: Border.all(
                ),
                borderRadius: BorderRadius. all(Radius. circular(80)),

              ),

              height:60,
              width: 60,

              child: CircleAvatar(
                // backgroundColor: Colors.teal[200],
                child: IconButton(
                  icon: Icon(Icons.arrow_forward_ios), onPressed: () {  },

                ),
              ),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.white30,
      ),
    );
  }
}
