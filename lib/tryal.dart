import 'package:flutter/material.dart';

class tryal extends StatefulWidget {
  const tryal({Key? key}) : super(key: key);

  @override
  State<tryal> createState() => _tryalState();
}

class _tryalState extends State<tryal> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('app bar'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 300,
            color: Colors.yellow[600],
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'pike the date',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],

              ),
            ),
          ),
        ),
      ),
    );
  }
}
