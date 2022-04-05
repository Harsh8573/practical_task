import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../postdata/PostData.dart';
import 'PostData.dart';

class PostScreen extends StatefulWidget {
  @override
  _PostScreenState createState() => _PostScreenState();
}

Future<PostData> postAlbum(String email, String password) async {
  final String apilink = "https://reqres.in/api/login";
  final response = await http.post(Uri.parse(apilink),
      // headers: <String, String>{
      //   'Content-Type': 'application/json; charset=UTF-8',
      // },
      body: {"email": email, "password": password});
  if (response.statusCode == 200) {
    final String res = response.body;
    return postDataFromJson(res);
  } else {
    throw Exception("failed_to_load");
  }
}

class _PostScreenState extends State<PostScreen>{
  PostData? _post;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool hidepassword = true;
  final _formkey = GlobalKey<FormState>();

  // bool? get input => null;

  @override
  Widget build(BuildContext context) {
    // var width = MediaQuery.of(context).size.width;
    final GlobalKey<ScaffoldState> _scaffoldKey =
    new GlobalKey<ScaffoldState>();

    return Form(
      key: _formkey,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 25,
              ),
              Text(
                "Login",
                style: TextStyle(
                    color: Colors.black26,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              SizedBox(
                height: 25,
              ),
              TextFormField(

                keyboardType: TextInputType.emailAddress,
                validator: (input) => !input!.contains("@")
                    ? "email Id Should Be Valid"
                    : null,
                controller: emailController,
                decoration: InputDecoration(

                    prefixIcon: Icon(Icons.email),
                    hintText: "Email Address",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30))),
              ),
              SizedBox(
                height: 25,
              ),
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
              SizedBox(
                height: 25,
              ),
              ElevatedButton(
                  onPressed: () async {
                    if (_formkey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                    }
                    ;
                    final String email = emailController.text;
                    final String password = passwordController.text;

                    final PostData post = await postAlbum(email, password);
                    setState(() {
                      _post = post;
                    });
                  },
                  child: Text("Get Token")),
              // _post == null ? Container() :
              Text("Token is ${_post?.token} and Error is${_post?.error}"),
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
    );
  }

}