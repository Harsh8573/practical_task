import 'package:flutter/material.dart';

class ProductDetail extends StatefulWidget {
  final int? id;

  final String? name;

  final String? color;

  const ProductDetail({Key? key, this.id, this.name, this.color})
      : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState(id, name, color);
}

class _ProductDetailState extends State<ProductDetail> {
  final int? id;
  final String? color;
  final String? name;

  _ProductDetailState(this.id, this.name, this.color);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final String? todo = id.toString();
    final String? todoo = name.toString();
    final String? todooo = color.toString();

    return Scaffold(
      body: Center(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("id: $todo"),
            SizedBox(
              height: 7,
            ),
            Text("Name: $todoo"),
            SizedBox(
              height: 7,
            ),
            Text("color: $todooo"),
          ],
        ),
      ),
    );
  }
}
// Widget Text(){
//   return Style
// }
