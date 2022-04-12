import 'package:flutter/material.dart';

class T_C extends StatefulWidget {
  const T_C({Key? key}) : super(key: key);

  @override
  State<T_C> createState() => _T_CState();
}

class _T_CState extends State<T_C> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            child:Center(
              child: Text("""   \$\$\$      Terms & Conditions      \$\$\$

          If you want to host your customized Terms & Conditions on your site, you can just download the Terms & Conditions and give them the use you want.

          We will create your customized Terms & Conditions in a variety of formats: PDF, DOCX, TXT & HTML files. """,style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                  ,
                  color: Colors.redAccent
              ),),
            )
        ),
      ),
    );
  }
}
