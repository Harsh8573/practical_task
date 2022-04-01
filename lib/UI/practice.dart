import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:practical_harsh/UI/pageview.dart';
import 'package:practical_harsh/main/strings.dart';
import 'package:practical_harsh/UI/subscribtion.dart';
import 'package:practical_harsh/UI/tabbar.dart';

// import ‘package:fluttertoast/fluttertoast.dart’;
import '../HomePage/Data/userList.dart';
import '../HomePage/HomeScreen.dart';
import '../api/passdata.dart';

import '../main/const.dart';
import '../post/postdata.dart';
import 'image_picker.dart';
import '../main/main.dart';
import '../Model/product_list.dart';
// import 'package:flutter_background_service/flutter_background_service.dart';

class practice extends StatefulWidget {
  @override
  State<practice> createState() => _practiceState();
}

class _practiceState extends State<practice> {
  int _value = 1;
  String value = " ";
  String bar = Strings.practice;
  var snackBar;
  var validator;
  bool valuefirst = false;

  String? language;
  final _formkey = GlobalKey<FormState>();
  List items = [Strings.hindi, Strings.gujrati, Strings.english];
  DateTime? selectedDate;
  TextEditingController dateinput = TextEditingController();

  //text editing controller for text field
  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
  }


  DateTime currentValue = DateTime.now();
  final formate = DateFormat(Constant.date_formate);

  //late DateTime _dateTime = DateTime.now();
  int val = 0;

  // void _showToastMsg() {
  //   Fluttertoast.showToast(
  //     msg: Strings.privacy_policy,
  //     backgroundColor: Colors.black,
  //     textColor: Colors.grey[400],
  //     fontSize: 20,
  //     gravity: ToastGravity.BOTTOM,
  //     toastLength: Toast.LENGTH_SHORT,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          // leading: Icon(Icons.account_balance),
          title: const Text(Strings.registration_form),
        ),
        body: SafeArea(
          child: Form(
            key: _formkey,
            child: SingleChildScrollView(
              child: Container(
                  margin: EdgeInsets.all(8),
                  padding: EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomeScreen()));
                            },
                            child: Container(
                              child: Row(
                                children: [Icon(Icons.account_balance),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text('Home',style: TextStyle(
                                      fontWeight: FontWeight.bold
                                  ),)],
                              ),
                            ),
                          ),

                        ],
                      ),
                      Container(
                        child: Image.asset(Strings.login_image),
                      ),
                      Text(
                        Strings.enter_name,
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ), //Enter Name
                      applyMarginTop(),
                      TextFormField(
                        keyboardType: TextInputType.name
                        ,
                        inputFormatters: [ FilteringTextInputFormatter.allow(RegExp(r'[A-Za-z]')),],
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return Strings.please_enter_your_name;
                          }
                          return null;
                        },
                        decoration: InputDecoration(

                            hintText: Strings.please_enter_your_name,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16))),
                      ),
                      applyMarginTop(height: 14.0),
                      Text(
                        Strings.select_gender,
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
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

                      Container(
                        child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return Strings.date_validator;
                              }
                              return null;
                            },
                            controller: dateinput,
                            decoration: const InputDecoration(
                                icon: Icon(Icons.calendar_today_rounded,
                                    color: Colors.blue),
                                labelText: Strings.select_date),
                            readOnly: true,
                            onTap: () async {
                              DateTime? pickeddate = await showDatePicker(
                                context: context,
                                initialDate: currentValue,
                                firstDate: DateTime(2001),
                                lastDate: DateTime.now(),
                              );
                              if (pickeddate != null) {
                                print(pickeddate);
                                currentValue = pickeddate;
                                String formattedDate =
                                    DateFormat(Constant.date_formate).format(pickeddate);
                                  dateinput.text = formattedDate;
                              } else {
                                print(Strings.not_select);
                              }
                            }),
                      ),

                      DropdownButtonFormField(
                        validator: (value) {
                          if (value == null ) {
                            return showAlertDialog(context);
                          }
                          return null;
                        },
                        hint: Text(Strings.select_language),
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
                        child: Builder(
                          builder: (context) {
                            return ElevatedButton(
                                onPressed: () {
                                  // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomeScreen()));
                                  if (_formkey.currentState!.validate()) {

                                    if (this.valuefirst == false) {
                                      // _showToastMsg();

                                      Fluttertoast.showToast(
                                          msg: Strings.privacy_policy,
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM, // also possible "TOP" and "CENTER"
                                          backgroundColor: Colors.grey,
                                          textColor: Colors.black,
                                      );
                                    } else {
                                      snackBar = SnackBar(
                                        key: _scaffoldKey,
                                        content: Text(Strings.registration_success),
                                        action: SnackBarAction(
                                          label: Strings.ok,
                                          onPressed: () {
                                            ScaffoldMessenger.of(context)
                                                .hideCurrentSnackBar();
                                          },
                                        ),
                                      );
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
                                    }
                                  }
                                },
                                child: const Text(Strings.save));
                          }
                        ),
                      ),
                    ],
                  )),
            ),
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
                  title: Text(Strings.pageview),
                  leading: Icon(Icons.home),
                  trailing: Icon(Icons.apps_outlined),
                  subtitle: Text(Strings.pagevieww),
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
                  title: Text(Strings.subscription),
                  leading: Icon(Icons.add_comment_outlined),
                  trailing: Icon(Icons.list),
                  subtitle: Text(Strings.by_page),
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
                  title: Text(Strings.image),
                  leading: Icon(Icons.camera),
                  trailing: Icon(Icons.account_box_rounded),
                  subtitle: Text(Strings.picker),
                  dense: true,
                  // enabled: false
                ),
              ),applyMarginTop(height: 6),
              Container(
                color: Colors.lightGreenAccent,
                child: ListTile(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ProductList()),
                    );
                  },
                  title: Text(Strings.fetch_data),
                  leading: Icon(Icons.amp_stories_rounded),
                  trailing: Icon(Icons.arrow_forward),
                  subtitle: Text(Strings.get_method),
                  dense: true,
                  // enabled: false
                ),
              ),
              applyMarginTop(height: 6),
              Container(
                color: Colors.blue[200],
                child: ListTile(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => tabbar()),
                    );
                  },
                  title: Text(Strings.tabbar),
                  leading: Icon(Icons.amp_stories_rounded),
                  trailing: Icon(Icons.arrow_forward),
                  subtitle: Text(Strings.tabs),
                  dense: true,
                  // enabled: false
                ),
              ),applyMarginTop(height: 6),
              // Container(
              //   color: Colors.orangeAccent[200],
              //   child: ListTile(
              //     onTap: () {
              //       Navigator.of(context).push(
              //         MaterialPageRoute(builder: (context) => UserList()),
              //       );
              //     },
              //     title: Text(Strings.pass_data),
              //     leading: Icon(Icons.amp_stories_rounded),
              //     trailing: Icon(Icons.arrow_forward),
              //     subtitle: Text(Strings.tabs),
              //     dense: true,
              //     // enabled: false
              //   ),
              // ),

              applyMarginTop(height: 6),
              Container(
                color: Colors.pink[200],
                child: ListTile(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ProductListapi()),
                    );
                  },
                  title: Text(Strings.pass_apidata),
                  leading: Icon(Icons.amp_stories_rounded),
                  trailing: Icon(Icons.arrow_forward),
                  subtitle: Text(Strings.api),
                  dense: true,
                  // enabled: false
                ),
              ),    applyMarginTop(height: 6),
              Container(
                color: Colors.indigoAccent[100],
                child: ListTile(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  },
                  title: Text(Strings.homescreen),
                  leading: Icon(Icons.amp_stories_rounded),
                  trailing: Icon(Icons.arrow_forward),
                  subtitle: Text(Strings.home),
                  dense: true,
                  // enabled: false
                ),
              ),
              applyMarginTop(height: 6),
              // Container(
              //   color: Colors.blueGrey[200],
              //   child: ListTile(
              //     onTap: () {
              //       Navigator.of(context).push(
              //         MaterialPageRoute(builder: (context) => PostData()),
              //       );
              //     },
              //     title: Text(Strings.pass_apidata),
              //     leading: Icon(Icons.amp_stories_rounded),
              //     trailing: Icon(Icons.arrow_forward),
              //     subtitle: Text(Strings.tabs),
              //     dense: true,
              //     // enabled: false
              //   ),
              // ),
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

showAlertDialog(BuildContext context) {

  Widget okButton = TextButton(
    child: Text(Strings.ok),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );


  AlertDialog alert = AlertDialog(
    title: Text(Strings.alert),
    content: Text(Strings.select_language_alert),
    actions: [
      okButton,
    ],
  );

  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
