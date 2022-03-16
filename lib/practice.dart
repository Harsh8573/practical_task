import 'package:flutter/material.dart';
import 'package:practical_harsh/pageview.dart';
import 'package:practical_harsh/strings.dart';
import 'package:practical_harsh/subscribtion.dart';
import 'package:practical_harsh/try.dart';
import 'package:practical_harsh/tryal.dart';

import 'image_picker.dart';

class practice extends StatefulWidget {
  @override
  State<practice> createState() => _practiceState();
}

class _practiceState extends State<practice> {
  int _value = 1;
  String value = " ";
  String bar = "practice";

  bool valuefirst = false;
  bool valuesecond = false;
  DateTime? selectedDate;

  @override
  void _onItemTapped(int Index) {
    if(Index==0){
      bar = "pageview";
    }
    if(Index==1){
      bar = "subscribtion";
    }
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ragistration Form'),
      ),
      body: SafeArea(
        child: Form(
          child: Container(

            margin: EdgeInsets.all(8),
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Image.asset("image/login.png"),
                      const Text(
                        Strings.enter_name,
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ), //Enter Name
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        width: 345,
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: Strings.please_enter_your_name,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16))),
                        ),
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      const Text(
                        Strings.select_gender,
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ), //Select Gender

                      Transform.translate(
                        offset: Offset(-15, 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Radio(
                                value: 1,
                                groupValue: _value,
                                onChanged: (val) {
                                  setState(() {
                                    _value = val as int;
                                  });
                                }),
                            const Text(Strings.male),
                            Radio(
                                value: 2,
                                groupValue: _value,
                                onChanged: (val) {
                                  setState(() {
                                    _value = val as int;
                                  });
                                }),
                            const Text(Strings.female),
                            Radio(
                                value: 3,
                                groupValue: _value,
                                onChanged: (val) {
                                  setState(() {
                                    _value = val as int;
                                  });
                                }),
                            const Text(Strings.other),
                          ],
                        ),
                      ), //Radio Button
                      const SizedBox(
                        height: 8,
                      ),
                      GestureDetector(
                        onTap: () async {
                          print('onTap');
                          await showDatePicker(
                                  context: context,
                                  initialDate: selectedDate == null
                                      ? DateTime.now()
                                      : selectedDate!,
                                  firstDate: DateTime(2001),
                                  lastDate: DateTime.now())
                              .then((value) {
                            if (value != null) {
                              setState(() {
                                selectedDate = value;
                              });
                            }
                          });
                        },
                        child: const Text(
                          Strings.select_date,
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text('$selectedDate'),
                      const SizedBox(
                        height: 16,
                      ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          // Text(
                          //   'Select Language',
                          //   style: TextStyle(
                          //       fontSize: 17, fontWeight: FontWeight.bold),
                          // ), //Select language
                          DropdownButton<String>(
                            items: const [
                              DropdownMenuItem<String>(
                                  value: "Hindi", child: Text('Hindi')),
                              DropdownMenuItem<String>(
                                  value: "Gujarati", child: Text('Gujarati')),
                              DropdownMenuItem<String>(
                                  value: "English", child: Text('English'))
                            ],
                            onChanged: (_value) {
                              setState(() {
                                value = _value!;
                              });
                            },
                            hint: const Text(Strings.select_language),
                          ),
                          Text(
                            '$value',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blueAccent),
                          ),
                          Column(
                            children: [
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Checkbox(
                                        value: this.valuefirst,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            this.valuefirst = value!;
                                          });
                                        }),
                                    const Text(Strings.privacy_policy),
                                  ],
                                ), //checkbox
                              ),
                            ],
                          ), // //checkbox
                          // Column(children: [
                          //   Container(
                          //     height: 10,
                          //     color: Colors.purple[900],
                          //   ),
                          //   Container(
                          //     height: 14,
                          //     color: Colors.teal[700],
                          //   ),
                          //   Container(
                          //     height: 20,
                          //     color: Colors.blue[600],
                          //   ),
                          //   Container(
                          //     height: 27,
                          //     color: Colors.green[500],
                          //   ),
                          //   Container(
                          //     height: 35,
                          //     color: Colors.yellow[500],
                          //   ),
                          //   Container(
                          //     height: 40,
                          //     color: Colors.yellow[900],
                          //   ),
                          //   Container(
                          //     height: 47,
                          //     color: Colors.brown[600],
                          //   ),
                          // ],) //Rainbow//rainbow
                        ],
                      )
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text(Strings.save)),
                  ),
                ),
                //Button
              ],
            ),
          ),
        ),
      ),

      ////////////////
      ////////////////

      drawer: Drawer(
        child: SafeArea(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            child: Stack(
              children: [
                Container(
                  // padding: const EdgeInsets.only(top: 6),
                  color: Colors.cyan[200],
                  child: ListView(
                    children: [
                      Container(
                        color: Colors.green,
                        child: ListTile(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => pageview()),
                            );
                          },
                          title: Text('PAGE VIEW'),
                          leading: Icon(Icons.home),
                          trailing: Icon(Icons.apps_outlined),
                          subtitle: Text('PAgeview'),
                          dense: true,
                          // enabled: false
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Container(
                        color: Colors.yellow[400],
                        child: ListTile(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => subscribtion()),
                            );
                          },
                          title: Text('SUBSCRIBTION'),
                          leading: Icon(Icons.add_comment_outlined),
                          trailing: Icon(Icons.list),
                          subtitle: Text('by Page'),
                          dense: true,
                          // enabled: false
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Container(
                        color: Colors.red[300],
                        child: ListTile(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => image_picker1()),
                            );
                          },
                          title: Text('IMAGE'),
                          leading: Icon(Icons.camera),
                          trailing: Icon(Icons.account_box_rounded),
                          subtitle: Text('Piker'),
                          dense: true,
                          // enabled: false
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Container(
                        color: Colors.blueGrey[400],
                        child: ListTile(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => tryal()),
                            );
                          },
                          title: Text('TRYAL'),
                          leading: Icon(Icons.add_comment_outlined),
                          trailing: Icon(Icons.list),
                          subtitle: Text('simple'),
                          dense: true,
                          // enabled: false
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),

                      Container(

                        // decoration: BoxDecoration(
                        //   border: Border.all(color: Colors.black45, width: 5),
                        //   borderRadius: const BorderRadius.all(
                        //     Radius.circular(10),
                        //   ),
                        // ),
                        // margin: EdgeInsets.only(top: 300),
                        margin: EdgeInsets.only(top: 255),
                        child: Image.asset(
                          'image/drawer.png',
                        ),
                      ), //dAWERimage
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
