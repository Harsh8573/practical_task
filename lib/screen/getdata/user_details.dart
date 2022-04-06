import 'package:flutter/material.dart';

class UserDetail extends StatefulWidget {
  final int? id;
  final String? name;
  final String? color;

  const UserDetail({Key? key, this.id, this.name, this.color})
      : super(key: key);

  @override
  State<UserDetail> createState() => _UserDetailState(id, name, color);
}

class _UserDetailState extends State<UserDetail> {
  final int? id;
  final String? color;
  final String? name;

  _UserDetailState(this.id, this.name, this.color);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final String? todo = id.toString();
    final String? todoo = name.toString();
    final String? todooo = color.toString();

    return Scaffold(
      body: Center(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("id: $todo"),
            SizedBox(
              height: 7,
            ),
            Text("Name: $todoo"),
            SizedBox(
              height: 7,
            ),
            Text("color: $todooo"),
          ],
        ),
      ),
    );
  }
}

