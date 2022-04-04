import 'package:flutter/material.dart';
import 'package:practical_harsh/screen/practice/practice.dart';
import 'package:practical_harsh/main/strings.dart';
import 'package:practical_harsh/screen/practice/subscribtion.dart';

import 'image_picker.dart';

class bell extends StatefulWidget {
  const bell({Key? key}) : super(key: key);

  @override
  State<bell> createState() => _bellState();
}

class _bellState extends State<bell> {
  int _value = 1;
  String value = " ";
  String bar = Strings.bell;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Align(
          alignment: Alignment.center,
          child: Stack(

            children: [
                  Expanded(
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  child: Image.asset("image/login.png"),
                ),
              ),
              Positioned(

                bottom: 420,
                right: 135,
                child: TextButton(

                    onPressed: (){
                      Navigator.of(context).pop(MaterialPageRoute(builder: (context)=> subscribtion()));
                    },
                    child: Text(Strings.subscribed,
                      style: TextStyle(

                          color: Colors.grey[600]
                      ),)
                ),
              ),


              Positioned(

                bottom: 420,
                right: 88,
                child: DropdownButton<String>(
                  items:  const [
                    DropdownMenuItem<String>(
                        value: Strings.normal, child: Icon(Icons.access_time)),
                    DropdownMenuItem<String>(
                        value: Strings.vibrate, child: Icon(Icons.access_alarms)),
                    DropdownMenuItem<String>(
                        value: Strings.silent, child: Icon(Icons.add_alarm_outlined)),
                  ],
                  onChanged: (_value) {
                    setState(() {
                      value = _value!;
                    });
                  },
                  hint:  Icon(Icons.access_time),
                ),
              ),

              // FlatButton(
              //     color: Colors.red[600],
              //     onPressed: (){}, child: Text('Subscribe'))

            ],
          ),
        ),
      ),
    );
  }
}
