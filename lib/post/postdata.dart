import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:practical_harsh/post/postmodel.dart';

class PostData extends StatefulWidget {
  const PostData({Key? key}) : super(key: key);

  @override
  State<PostData> createState() => _PostDataState();
}
Future<Postmodel> submitdata(int userid,int id,String title)async{

  var response = await http.post(Uri.parse("https://jsonplaceholder.typicode.com/albums"),
  body: {"userid": userid, "id": id, "title": title} );
  var data = response.body;
  print(data);
  if(response.statusCode==201){
    String responseString = response.body;
    Pos
  }
}
class _PostDataState extends State<PostData> {
  final url = "https://reqres.in/api/login";

  // postdata() async {
  //   var response = await http.post(Uri.parse(url), body: {
  //     "id": 1.toString(),
  //     "name": "harsh",
  //   });
  //   print(response.body);
  // }
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
                    hintText: "Enter email",
                    border: OutlineInputBorder()
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Password",
                    border: OutlineInputBorder()
                  ),
                ), SizedBox(
                  height: 10,
                ),
Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [ElevatedButton(onPressed: (){}, child: Text("Press"))],
)

              ],
            ),
          ),
        ),
      ),
    );
  }
}
