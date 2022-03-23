import 'package:flutter/material.dart';
import 'package:practical_harsh/strings.dart';

class pageview extends StatefulWidget {
  const pageview({Key? key}) : super(key: key);


  @override
  State<pageview> createState() => _pageviewState();
}

class _pageviewState extends State<pageview> {

  final PageController _controller = PageController(
    initialPage: 0
  );
  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return PageView(
       controller:_controller,
      children: [
        pageview1(),
        pageview2(),
      ],
      scrollDirection: Axis.vertical,
    );
  }
}


class pageview1 extends StatefulWidget {

  @override
  State<pageview1> createState() => _pageview1State();
}

class _pageview1State extends State<pageview1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Center(
        child: Text(Strings.hello),
      ),
    );
  }
}

class pageview2 extends StatefulWidget {
  const pageview2({Key? key}) : super(key: key);

  @override
  State<pageview2> createState() => _pageview2State();
}

class _pageview2State extends State<pageview2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      child: Center(
        child: Text(Strings.hello),
      ),
    );
  }
}

