import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Shared_preference extends StatefulWidget {
  const Shared_preference({Key? key}) : super(key: key);

  @override
  State<Shared_preference> createState() => _Shared_preferenceState();
}

class _Shared_preferenceState extends State<Shared_preference> {
  TextEditingController _controller = TextEditingController();
  late SharedPreferences prefs;

  String name = " ";

  @override
  void initState() {
    super.initState();
    initalize();
  }

  void initalize() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                fillColor: Colors.blue,
                prefixIcon: Icon(Icons.archive_rounded),
                hintText: 'Enter data',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 200,
              child: TextField(
                readOnly: true,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.account_tree),
                    hintText: name,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5))),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                save();
              },
              child: Text("Save"),
            ),
            ElevatedButton(
              onPressed: () {
                retrive();
              },
              child: Text("Retrive"),
            ),
            ElevatedButton(
              onPressed: () {
                delete();
              },
              child: Text("Delete"),
            ),
          ],
        ),
      ),
    );
  }

  save() async {
    prefs.setString('text', _controller.text.toString());
  }

  retrive() async {
    setState(() {
      name = prefs.getString('text')!;
    });
  }

  delete() async {
    prefs.remove('text');
    name = "";
    setState(() {});
  }
}
