import 'package:flutter/material.dart';

import 'package:practice_app/term_condition.dart';

import 'Extra/login_page.dart';


class TabbBar extends StatefulWidget {
  const TabbBar({Key? key}) : super(key: key);

  @override
  State<TabbBar> createState() => _TabbBarState();
}

class _TabbBarState extends State<TabbBar> {
  final _formkey = GlobalKey<FormState>();
  bool firstvalue = false;

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    bool hidepassword = true;
    final bool showFab = MediaQuery.of(context).viewInsets.bottom==0.0;
    return Scaffold(

      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Login'),
      ),
      body: Form(
        key: _formkey,
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
                                            validator: (input){
                                              if(input == null || input.isEmpty){
                                                return'please enter Username';
                                              }

                                            },
                                            decoration: InputDecoration(
                                                hintText: 'Please enter username',
                                                prefixIcon: Icon(
                                                    Icons.account_box_sharp),
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        60 / 2))),
                                          ),
                                          SizedBox(height: 10),
                                          TextFormField(
                                            validator: (input) =>
                                            !input!.contains("@") ? "email Id Should Be Valid" : null,


                                            // validator: (value) {
                                            //   if (value == null || value.isEmpty) {
                                            //     return 'please enter password';
                                            //   }
                                            //   return null;
                                            // },
                                            decoration: InputDecoration(
                                                hintText: 'Please enter email',
                                                prefixIcon: Icon(Icons.email),
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        60 / 2))),
                                          ),
                                          SizedBox(height: 10),
                                          TextFormField(
                                            validator: (value) {
                                              if (value == null || value.isEmpty) {
                                                return 'please enter password';
                                              }
                                              return null;
                                            },
                                            keyboardType: TextInputType.text,
                                            controller: passwordController,
                                            obscureText: hidepassword,
                                            decoration: InputDecoration(
                                                prefixIcon: Icon(Icons.lock),
                                                suffixIcon: IconButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      hidepassword = !hidepassword;
                                                    });
                                                  },
                                                  color: Colors.blue.withOpacity(0.6),
                                                  icon: Icon(hidepassword
                                                      ? Icons.visibility_off
                                                      : Icons.visibility),
                                                ),
                                                hintText: "Password",
                                                border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(30))),
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

                                            validator: (input) =>
                                            !input!.contains("@") ? "email Id Should Be Valid" : null,
                                            decoration: InputDecoration(
                                              hintText: 'Please enter email',
                                              prefixIcon: Icon(Icons.email),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.circular(60 / 2),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          TextFormField(
                                            validator: (value) {
                                              if (value == null || value.isEmpty) {
                                                return 'please enter password';
                                              }
                                              return null;
                                            },
                                            keyboardType: TextInputType.text,
                                            controller: passwordController,
                                            obscureText: hidepassword,
                                            decoration: InputDecoration(
                                                prefixIcon: Icon(Icons.lock),
                                                suffixIcon: IconButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      hidepassword = !hidepassword;
                                                    });
                                                  },
                                                  color: Colors.blue.withOpacity(0.6),
                                                  icon: Icon(hidepassword
                                                      ? Icons.visibility_off
                                                      : Icons.visibility),
                                                ),
                                                hintText: "Password",
                                                border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(30))),
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
                    width: 2,
                  ),
                  borderRadius: BorderRadius. all(Radius. circular(80)),
                ),
                height:60,
                width: 60,

                child: IconButton(
                  icon: Icon(Icons.arrow_forward_ios), onPressed: () { if (_formkey.currentState!.validate())
                  final String email = emailController.text;
                final String password = passwordController.text;{

                } },

                ),
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.white30,
      ),
      floatingActionButton: showFab?Icon(Icons.add):null,
    );
  }
}
