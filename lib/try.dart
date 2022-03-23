import 'package:flutter/material.dart';
import 'package:practical_harsh/strings.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({required this.title, Key? key}) : super(key: key);



  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.0,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(color: Colors.blue[500]),

      child: Row(

        children: [
          const IconButton(
            icon: Icon(Icons.menu),
            tooltip: Strings.navigatormenu,
            onPressed: null,
          ),

          Expanded(
            child: title,
          ),
          const IconButton(
            icon: Icon(Icons.search),
            tooltip: Strings.search,
            onPressed: null,
          ),
        ],
      ),
    );
  }
}

class MyScaffold extends StatelessWidget {
  const MyScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Material(

      child: Column(
        children: [
          MyAppBar(
            title: Text(
              Strings.example_title,
              style: Theme.of(context) //
                  .primaryTextTheme
                  .headline6,
            ),
          ),
          const Expanded(
            child: Center(
              child: Text(Strings.hello_word),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(
    const MaterialApp(
      title: Strings.myapp,
      home: SafeArea(
        child: MyScaffold(),
      ),
    ),
  );
}