
import 'package:flutter/material.dart';
import 'package:practical_harsh/strings.dart';



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
                      Tab(child: Text(Strings.screen1,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 16
                      ),)),
                      Tab(child: Text(Strings.screen2,style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 16
                      ),)),
                      Tab(child: Text(Strings.screen3,style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 16
                      ),)),

                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        body:  TabBarView(
          children: [
            centerTextView(text:"Screen 1",
                fontWeight:FontWeight.normal),
            centerTextView(text:"Screen 2"),
            centerTextView(text:"Screen 3"),

          ],),),);
  }
}
Widget centerTextView({String text = "", FontWeight fontWeight =FontWeight.bold}) {
  return Center(
      child:Text(text,
        style: TextStyle(
            fontWeight: fontWeight,
            fontSize: 28
        ),)
  );
}
