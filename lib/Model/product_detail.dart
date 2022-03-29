import 'package:flutter/material.dart';

class ProductDetail extends StatefulWidget {
  final int? id;

  final String? name;

  const ProductDetail({Key? key, this.id, this.name}) : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState(id, name);
}

class _ProductDetailState extends State<ProductDetail> {
  final int? id;

 final String? name;

  _ProductDetailState(this.id, this.name);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final String? todo = id.toString();
    final String? todoo = name.toString();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text("Hello---- $todo + $todoo")],
      ),
    );
  }
}
