import 'package:flutter/material.dart';
import 'package:practical_harsh/bell.dart';
import 'package:practical_harsh/practice.dart';
import 'package:practical_harsh/strings.dart';

class subscribtion extends StatefulWidget {
  const subscribtion({Key? key}) : super(key: key);

  @override
  State<subscribtion> createState() => _subscribtionState();
}

class _subscribtionState extends State<subscribtion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Align(
          alignment: Alignment.center,
          child: Stack(
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                child: Image.asset(Strings.image_layout,
               ),
              ),
              Positioned(

                bottom: 420,
                right: 135,
                child: TextButton(

                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> bell()));
                  },
                  child: Text(Strings.subscribe,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red[900]
                  ),)
                ),
              )
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

