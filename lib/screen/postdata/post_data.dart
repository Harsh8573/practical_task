import 'package:flutter/material.dart';
import 'package:http/http.dart';

class PostScreen extends StatefulWidget {
  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
    // final url1 = "https://reqres.in/api/login";
    final url = "https://jsonplaceholder.typicode.com/posts";

    void postdata() async {

        final response = await post(Uri.parse(url),
            body: {"title": "anything", "body": "post body", "userid": "1"});
        // var data = response.body;
        print(response.body);

    }

    return Scaffold(
      body: Center(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  // controller: emailController,
                  decoration: InputDecoration(
                      hintText: "Enter email", border: OutlineInputBorder()),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: InputDecoration(
                      hintText: "Password", border: OutlineInputBorder()),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(onPressed: postdata, child: Text("send Post"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
