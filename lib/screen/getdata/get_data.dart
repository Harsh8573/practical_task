import 'package:flutter/material.dart';
import 'package:practical_harsh/screen/getdata/user_details.dart';
import 'package:practical_harsh/screen/getdata/user_list.dart';
import 'package:practical_harsh/screen/getdata/user_preference.dart';
import 'package:practical_harsh/screen/getdata/user_profile.dart';

class GetData extends StatefulWidget {
  const GetData({Key? key}) : super(key: key);

  @override
  State<GetData> createState() => _GetDataState();
}

class _GetDataState extends State<GetData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => UserList()));
              },
              child: Text('userList'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => UserProfile()));
              },
              child: Text('Api send'),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => UserDetails()));
              },
              child: Text('Consructor send'),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => UserPreference()));
                },
                child: Text('Shared preferences')),
          ],
        ),
      ),
    );
  }
}
