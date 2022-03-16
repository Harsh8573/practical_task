// import 'package:flutter/material.dart';
// import 'package:practical_harsh/pageview.dart';
// import 'package:practical_harsh/strings.dart';
//
// class login extends StatefulWidget {
//   @override
//   State<login> createState() => _loginState();
// }
//
// class _loginState extends State<login> {
//   int _value = 1;
//   String value = " ";
//   bool valuefirst = false;
//   bool valuesecond = false;
//   DateTime? selectedDate;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Ragistration Form'),
//       ),
//       body: SafeArea(
//         child: Form(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 8.0),
//             child: Column(
//               children: [
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisSize: MainAxisSize.max,
//                     children: [
//                       Image.asset("image/login.png"),
//                       const Text(
//                         Strings.enter_name,
//                         style: TextStyle(
//                             fontSize: 17, fontWeight: FontWeight.bold),
//                       ), //Enter Name
//                       const SizedBox(
//                         height: 8,
//                       ),
//                       TextField(
//                         decoration: InputDecoration(
//                             hintText: Strings.please_enter_your_name,
//                             border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(16))),
//                       ),
//                       const SizedBox(
//                         height: 8,
//                       ),
//                       const Text(
//                         Strings.select_gender,
//                         style: TextStyle(
//                             fontSize: 17, fontWeight: FontWeight.bold),
//                       ), //Select Gender
//                       const SizedBox(
//                         height: 8,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         mainAxisSize: MainAxisSize.max,
//                         children: [
//                           Radio(
//                               value: 1,
//                               groupValue: _value,
//                               onChanged: (val) {
//                                 setState(() {
//                                   _value = val as int;
//                                 });
//                               }),
//                           const Text(Strings.male),
//                           Radio(
//                               value: 2,
//                               groupValue: _value,
//                               onChanged: (val) {
//                                 setState(() {
//                                   _value = val as int;
//                                 });
//                               }),
//                           const Text(Strings.female),
//                           Radio(
//                               value: 3,
//                               groupValue: _value,
//                               onChanged: (val) {
//                                 setState(() {
//                                   _value = val as int;
//                                 });
//                               }),
//                           const Text(Strings.other),
//                         ],
//                       ), //Radio Button
//                       const SizedBox(
//                         height: 8,
//                       ),
//                       GestureDetector(
//                         onTap: () async {
//                           print('onTap');
//                           await showDatePicker(
//                                   context: context,
//                                   initialDate: selectedDate == null
//                                       ? DateTime.now()
//                                       : selectedDate!,
//                                   firstDate: DateTime(2001),
//                                   lastDate: DateTime.now())
//                               .then((value) {
//                             if (value != null) {
//                               setState(() {
//                                 selectedDate = value;
//                               });
//                             }
//                           });
//                         },
//                         child: const Text(
//                           Strings.select_date,
//                           style: TextStyle(
//                               fontSize: 17, fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                       Text('$selectedDate'),
//                       const SizedBox(
//                         height: 16,
//                       ),
//
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisSize: MainAxisSize.max,
//                         children: <Widget>[
//                           // Text(
//                           //   'Select Language',
//                           //   style: TextStyle(
//                           //       fontSize: 17, fontWeight: FontWeight.bold),
//                           // ), //Select language
//                           DropdownButton<String>(
//                             items: const [
//                               DropdownMenuItem<String>(
//                                   value: "Hindi", child: Text('Hindi')),
//                               DropdownMenuItem<String>(
//                                   value: "Gujarati", child: Text('Gujarati')),
//                               DropdownMenuItem<String>(
//                                   value: "English", child: Text('English'))
//                             ],
//                             onChanged: (_value) {
//                               setState(() {
//                                 value = _value!;
//                               });
//                             },
//                             hint: const Text(Strings.select_language),
//                           ),
//                           Text(
//                             '$value',
//                             style: const TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.blueAccent),
//                           ),
//                           Column(
//                             children: [
//                               Container(
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   children: [
//                                     Checkbox(
//                                         value: this.valuefirst,
//                                         onChanged: (bool? value) {
//                                           setState(() {
//                                             this.valuefirst = value!;
//                                           });
//                                         }),
//                                     const Text(Strings.privacy_policy),
//                                   ],
//                                 ), //checkbox
//                               ),
//                             ],
//                           ), // //checkbox
//                           // Column(children: [
//                           //   Container(
//                           //     height: 10,
//                           //     color: Colors.purple[900],
//                           //   ),
//                           //   Container(
//                           //     height: 14,
//                           //     color: Colors.teal[700],
//                           //   ),
//                           //   Container(
//                           //     height: 20,
//                           //     color: Colors.blue[600],
//                           //   ),
//                           //   Container(
//                           //     height: 27,
//                           //     color: Colors.green[500],
//                           //   ),
//                           //   Container(
//                           //     height: 35,
//                           //     color: Colors.yellow[500],
//                           //   ),
//                           //   Container(
//                           //     height: 40,
//                           //     color: Colors.yellow[900],
//                           //   ),
//                           //   Container(
//                           //     height: 47,
//                           //     color: Colors.brown[600],
//                           //   ),
//                           // ],) //Rainbow//rainbow
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//                 Align(
//                   alignment: Alignment.bottomCenter,
//                   child: ElevatedButton(
//                       onPressed: () {}, child: const Text(Strings.save)),
//                 ),
//                 //Button
//               ],
//             ),
//           ),
//         ),
//       ),
//
//       ////////////////
//       ////////////////
//
//       drawer: Drawer(
//         child: SafeArea(
//           child: Scaffold(
//             appBar: AppBar(
//               title: const Text('Drawer'),
//             ),
//             body: Container(
//               // padding: const EdgeInsets.only(top: 6),
//               color: Colors.cyan[200],
//               child: ListView(
//                 children: [
//                   Container(
//                     color: Colors.green,
//                     child: ListTile(
//                       onLongPress: () {
//                         Navigator.of(context).push(
//                           MaterialPageRoute(builder: (context) => pageview()),
//                         );
//                       },
//                       title: Text('List'),
//                       leading: Icon(Icons.home),
//                       trailing: Icon(Icons.apps_outlined),
//                       subtitle: Text('PAgeview'),
//                       dense: true,
//                       // enabled: false
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 6,
//                   ),
//                   Container(
//                     color: Colors.yellow[400],
//                     child: const ListTile(
//                       title: Text('subscribtion'),
//                       leading: Icon(Icons.add_comment_outlined),
//                       trailing: Icon(Icons.list),
//                       subtitle: Text('by Page'),
//                       dense: true,
//                       // enabled: false
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 6,
//                   ),
//                   Container(
//                     color: Colors.blueGrey[300],
//                     child: ListTile(
//                       onLongPress: () {
//                         Navigator.of(context).push(
//                           MaterialPageRoute(builder: (context) => pageview()),
//                         );
//                       },
//                       title: Text('image'),
//                       leading: Icon(Icons.camera),
//                       trailing: Icon(Icons.account_box_rounded),
//                       subtitle: Text('Piker'),
//                       dense: true,
//                       // enabled: false
//                     ),
//                   ),
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Container(
//                           decoration: BoxDecoration(
//                         color: Colors.yellow,
//                         //image:  DecorationImage(image: AssetImage('image/flutter.png')),
//                         borderRadius: BorderRadius.all(Radius.circular(15)),
//                       ))
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
