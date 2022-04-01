import 'package:flutter/material.dart';

import '../Model/product_list.dart';
import 'Data/DataScreen.dart';
import 'Data/userList.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Dat Get"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Center(
                child: Text(
                  "Hash ",
                  style: TextStyle(
                      color: Colors.black26,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
              ),
              // Image.asset('flutter.jpeg')
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.black,
          backgroundColor: Colors.orangeAccent,
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
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                    color: Colors.blue,
                    image: DecorationImage(
                        image: AssetImage("flutter.png"), fit: BoxFit.cover)),
                child: Center(
                  child: Container(
                    child: Text(
                      'Welcome',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => UserList()));
                },
                title: Text(
                  "Data",
                  style: TextStyle(fontSize: 20),
                ),
                leading: Icon(
                  Icons.add_link,
                  size: 30,
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => DataScreen()));
                },
                title: Text(
                  "Setting",
                  style: TextStyle(fontSize: 20),
                ),
                leading: Icon(
                  Icons.account_circle_rounded,
                  size: 30,
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => DataScreen()));
                },
                title: Text(
                  "Privacy Policy",
                  style: TextStyle(fontSize: 20),
                ),
                leading: Icon(
                  Icons.account_balance_wallet_outlined,
                  size: 30,
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => DataScreen()));
                },
                title: Text(
                  "Logout",
                  style: TextStyle(fontSize: 20),
                ),
                leading: Icon(
                  Icons.login,
                  size: 30,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
