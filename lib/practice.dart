import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:practical_harsh/pageview.dart';
import 'package:practical_harsh/strings.dart';
import 'package:practical_harsh/subscribtion.dart';

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
  String? language;
  List items = ['Hindi', 'Gujrati', 'English'];
  DateTime? selectedDate;
  TextEditingController dateinput = TextEditingController();

  //text editing controller for text field
  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
  }

  DateTime currentValue = DateTime.now();
  final formate = DateFormat('yyyy-MM-dd');

  //late DateTime _dateTime = DateTime.now();
  int val = 0;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Ragistration Form'),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
                margin: EdgeInsets.all(8),
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      child: Image.asset("image/login.png"),
                    ),
                    Text(
                      Strings.enter_name,
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ), //Enter Name
                    applyMarginTop(),
                    TextField(
                      decoration: InputDecoration(
                          hintText: Strings.please_enter_your_name,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16))),
                    ),
                    applyMarginTop(height: 14.0),
                    Text(
                      Strings.select_gender,
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ), //Select Gender
                    Transform.translate(
                      offset: Offset(-15, 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
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
                    ),
                    applyMarginTop(),
                    GestureDetector(
                      onTap: () async {
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

                    DropdownButton(
                      hint: Text('Select language'),
                      onChanged: (newvalue) {
                        setState(() {
                          language = newvalue as String?;
                        });
                      },
                      value: language,
                      isExpanded: true,
                      items: items.map((valueItem) {
                        return DropdownMenuItem(
                            value: valueItem, child: Text(valueItem));
                      }).toList(),
                    ),
                    applyMarginTop(height: 16.0),
                    Transform.translate(
                      offset: Offset(-13, 1),
                      child: Row(
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
                        //checkbox
                      ),
                    ),
                    applyMarginTop(height: 40),
                    SizedBox(
                      width: width,
                      child: ElevatedButton(
                          onPressed: () {
                            final snackBar = SnackBar(
                              content: Text('Ragistration success!'),
                              action: SnackBarAction(
                                label: 'View',
                                onPressed: () {},
                              ),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          },
                          child: const Text(Strings.save)),
                    ),
                  ],
                )),
          ),
        ),
        drawer: Drawer(
          child: SafeArea(
              child: ListView(
            children: [
              Container(
                color: Colors.green,
                child: ListTile(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => pageview()),
                    );
                  },
                  title: Text('PAGE VIEW'),
                  leading: Icon(Icons.home),
                  trailing: Icon(Icons.apps_outlined),
                  subtitle: Text('Pageview'),
                  dense: true,
                ),
              ),
              applyMarginTop(height: 6),
              Container(
                color: Colors.yellow[400],
                child: ListTile(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => subscribtion()),
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
              applyMarginTop(height: 6),
              Container(
                color: Colors.red[300],
                child: ListTile(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => image_picker1()),
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
              applyMarginTop(height: 6)
            ],
          )),
        ));
  }

  Widget applyMarginTop({double height = 8.0}) {
    return SizedBox(
      height: height,
    );
  }
}
