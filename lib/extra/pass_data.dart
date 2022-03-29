import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  const Detail({Key? key}) : super(key: key);

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _phone = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home : Material(
        child:Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _name,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "enter name"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _email,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "enter email"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _phone,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "enter phone"),
              
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(onPressed: (){
           Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Welcome(name: _name.text, email: _email.text, phone: _phone.text)));
          }, child: Icon(Icons.arrow_forward))
        ],
      ),
    ),);
  }
}

class Welcome extends StatelessWidget {

  String name, email, phone;

  Welcome({required this.name, required this.email, required this.phone});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("name: ${name}"),
            Text("email: ${email}"),
            Text("phone: ${phone}"),
          ],
        ),
      ),

    );
  }
}


