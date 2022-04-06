import 'package:flutter/material.dart';
class PageViewDemo extends StatefulWidget {
  @override
  _PageViewDemoState createState() => _PageViewDemoState();
}

class _PageViewDemoState extends State<PageViewDemo> {
  PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.vertical,
      controller: _controller,
      children: [
        Page1(),
        Page2(),
        Page3(),
      ],
    );
  }
}

class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[100],
      body : Center(
        child: Container(

          child: Text('Page 1'),
        ),
      ),
    );
  }
}
class Page2 extends StatefulWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Colors.teal[200],
      body : Center(
        child: Container(

          child: Text('Page 2'),
        ),
      ),
    );
  }
}
class Page3 extends StatefulWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[300],
      body : Center(
        child: Container(

          child: Text('Page 3'),
        ),
      ),
    );
  }
}




// import 'package:flutter/material.dart';
// import 'package:practical_harsh/main/strings.dart';
//
// class pageview extends StatefulWidget {
//   const pageview({Key? key}) : super(key: key);
//
//
//   @override
//   State<pageview> createState() => _pageviewState();
// }
//
// class _pageviewState extends State<pageview> {
//
//   final PageController _controller = PageController(
//     initialPage: 0,
//     viewportFraction: 1.2
//   );
//   @override
//   void dispose(){
//     _controller.dispose();
//     super.dispose();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return PageView.builder(
//        controller:_controller,
//       itemCount: 2,
//       scrollDirection: Axis.horizontal,
//       itemBuilder: (BuildContext context, int index) {
//          return Container(
//       color: Colors.blue,
//       child: Center(
//         child: Text('page 1'),
//       ),
//     );},
//     );
//   }
// }
//
//
// class pageview1 extends StatefulWidget {
//
//   @override
//   State<pageview1> createState() => _pageview1State();
// }
//
// class _pageview1State extends State<pageview1> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.blue,
//       child: Center(
//         child: Text('Page 1'),
//       ),
//     );
//   }
// }
//
// class pageview2 extends StatefulWidget {
//   const pageview2({Key? key}) : super(key: key);
//
//   @override
//   State<pageview2> createState() => _pageview2State();
// }
//
// class _pageview2State extends State<pageview2> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.yellow,
//       child: Center(
//         child: Text(Strings.hello),
//       ),
//     );
//   }
// }
//