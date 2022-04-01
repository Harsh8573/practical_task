import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

// Future<Postmodel> submitdata(int userid,int id,String title)async{
//
//   var response = await http.post(Uri.parse("https://jsonplaceholder.typicode.com/albums"),
//   body: {"userid": userid, "id": id, "title": title} );
//   var data = response.body;
//   print(data);
//   if(response.statusCode==201){
//     String responseString = response.body;
//     // Pos
//   }
// }
class _PostScreenState extends State<PostScreen> {
  final url = "https://reqres.in/api/login";

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: emailController,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(onPressed: () {}, child: Text("Press"))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
