import 'package:flutter/material.dart';
import 'package:practical_harsh/strings.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  int _value = 1;
  String value = " ";
  bool valuefirst = false;
  bool valuesecond = false;
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    clipBehavior: Clip.hardEdge,
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
                        TextField(
                          decoration: InputDecoration(
                              hintText: 'Please Enter Your Name',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16))),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text(
                          'Select Gender',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ), //Select Gender
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
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
                            const Text('Male'),
                            Radio(
                                value: 2,
                                groupValue: _value,
                                onChanged: (val) {
                                  setState(() {
                                    _value = val as int;
                                  });
                                }),
                            const Text('FeMale'),
                            Radio(
                                value: 3,
                                groupValue: _value,
                                onChanged: (val) {
                                  setState(() {
                                    _value = val as int;
                                  });
                                }),
                            const Text('other'),
                          ],
                        ), //Radio Button
                        const SizedBox(
                          height: 8,
                        ),
                        GestureDetector(
                          onTap: () async {
                            print('onTap');
                            await showDatePicker(context: context, initialDate: selectedDate==null ? DateTime.now() : selectedDate!, firstDate: DateTime(2001,1,1), lastDate: DateTime.now()).then((value){
                              if(value!=null){
                                setState(() {
                                  selectedDate = value;
                                });
                              }
                            });
                          },
                          child: const Text(
                            'Select Date',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                        ), //Select Date
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
                              hint: const Text('Select Language'),
                            ),
                            Text(
                              '$value',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueAccent),
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 118.0),
                                  child: Container(
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
                                        const Text(
                                            'Please Select Privacy & Policy'),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ), //checkbox
                            Container(
                              height: 100,
                              color: Colors.cyanAccent,
                            ),
                            Container(
                              height: 100,
                              color: Colors.teal,
                            )

                          ],
                        )
                      ],
                    ),

                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                      onPressed: () {}, child: const Text('Save')),
                ), //Button

              ],
            ),
          ),
        ),
      ),
    );
  }
}
