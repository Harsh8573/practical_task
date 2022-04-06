import 'package:flutter/material.dart';
import '../../extra/getdataa/post_method.dart';
import '../getdata/user_list.dart';
import '../postdata/PostScreen.dart';
import 'Drawer/shared_preference.dart';
// import '../homescreen/home_screen.dart';
// import 'data_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        centerTitle: true,
        title: Text(
          "Suffle",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                applyMarginTop(),
                Text(
                  "Home",
                  style: TextStyle(
                      color: Colors.black26,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
                applyMarginTop(height: 35),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      hintText: "Enter email",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30))),
                ),
                applyMarginTop(height: 25.0),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      hintText: "Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30))),
                ),
                applyMarginTop(height: 25.0),
                ElevatedButton(onPressed: () {}, child: Text("Login")),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.cyan[500]),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        backgroundColor: Colors.greenAccent[400],
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              backgroundColor: Colors.black,
              tooltip: "home",
              label: 'home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_link),
              backgroundColor: Colors.black,
              tooltip: "Getdata",
              label: 'Getdata'),
          BottomNavigationBarItem(
              icon: Icon(Icons.perm_media_outlined),
              tooltip: "Folders",
              backgroundColor: Colors.black,
              label: 'Folder'),
        ],
      ),
      // drawer: Drawer(
      //   child: ListView(
      //     children: [
      //       DrawerHeader(
      //         decoration: BoxDecoration(
      //             color: Colors.blue,
      //             image: DecorationImage(
      //                 image: AssetImage("flutter.png"), fit: BoxFit.cover)),
      //         child: Center(
      //           child: Container(
      //             child: Text(
      //               'Welcome',
      //               style: TextStyle(
      //                 color: Colors.white,
      //                 fontSize: 30,
      //                 fontWeight: FontWeight.bold,
      //               ),
      //             ),
      //           ),
      //         ),
      //       ),
      //       ListTile(
      //         onTap: () {
      //           Navigator.of(context)
      //               .push(MaterialPageRoute(builder: (context) => UserList()));
      //         },
      //         title: Text(
      //           "Data",
      //           style: TextStyle(fontSize: 20),
      //         ),
      //         leading: Icon(
      //           Icons.add_link,
      //           size: 30,
      //         ),
      //       ),
      //       ListTile(
      //         onTap: () {
      //           Navigator.of(context).push(
      //               MaterialPageRoute(builder: (context) => PostMethod()));
      //         },
      //         title: Text(
      //           "PostMethod",
      //           style: TextStyle(fontSize: 20),
      //         ),
      //         leading: Icon(
      //           Icons.account_circle_rounded,
      //           size: 30,
      //         ),
      //       ),
      //       ListTile(
      //         onTap: () {
      //           Navigator.of(context).push(
      //               MaterialPageRoute(builder: (context) => HomeScreen()));
      //         },
      //         title: Text(
      //           "Post",
      //           style: TextStyle(fontSize: 20),
      //         ),
      //         leading: Icon(
      //           Icons.account_balance_wallet_outlined,
      //           size: 30,
      //         ),
      //       ),  ListTile(
      //         onTap: () {
      //           Navigator.of(context).push(
      //               MaterialPageRoute(builder: (context) => Shared_preference()));
      //         },
      //         title: Text(
      //           "Shared Preferences",
      //           style: TextStyle(fontSize: 20),
      //         ),
      //         leading: Icon(
      //           Icons.account_tree_outlined,
      //           size: 30,
      //         ),
      //       ),
      //       // ListTile(
      //       //   onTap: () {
      //       //     Navigator.of(context).push(
      //       //         MaterialPageRoute(builder: (context) => PostScreen()));
      //       //   },
      //       //   title: Text(
      //       //     "Login",
      //       //     style: TextStyle(fontSize: 20),
      //       //   ),
      //       //   leading: Icon(
      //       //     Icons.login,
      //       //     size: 30,
      //       //   ),
      //       // ),
      //     ],
      //   ),
      // ),
    );
  }
}

Widget applyMarginTop({double height = 12.0, double width = 12}) {
  return SizedBox(
    height: height,
    width: width,
  );
}
