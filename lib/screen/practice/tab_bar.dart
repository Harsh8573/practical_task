import 'package:flutter/material.dart';
import 'package:practical_harsh/main/strings.dart';

class tabbar extends StatefulWidget {
  @override
  _tabbarState createState() => _tabbarState();
}

class _tabbarState extends State<tabbar> {
  //Size get PreferredSize => Size.fromHeight(100);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: SafeArea(
            child: Container(
              color: Colors.purple[400],
              child: Column(
                children: <Widget>[
                  Expanded(child: Container()),
                  TabBar(
                    tabs: [
                      Tab(child: tabTextStyle(text: Strings.screen1)),
                      Tab(child: tabTextStyle(text: Strings.screen2)),
                      // Tab(child: tabTextStyle(text: Strings.screen3)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            centerTextView(text: Strings.screen1),
            centerTextView(text: Strings.screen2),
            centerTextView(text: Strings.screen3),
          ],
        ),
      ),
    );
  }
}

Widget centerTextView(
    {String text = "", FontWeight fontWeight = FontWeight.bold}) {
  return Center(
      child: Text(
    text,
    style: TextStyle(fontWeight: fontWeight, fontSize: 28),
  ));
}

Widget tabTextStyle(
    {String text = "",
    FontWeight fontWeight = FontWeight.bold,
    Color color = Colors.white,
    double fontSize = 16.0}) {
  return Text(
    text,
    style: TextStyle(fontWeight: fontWeight, color: color, fontSize: fontSize),
  );
}
