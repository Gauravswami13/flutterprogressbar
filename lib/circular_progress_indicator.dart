import 'package:flutter/material.dart';
import 'package:flutterprogressbar/dererminate_circular.dart';
class CPI extends StatefulWidget {
  const CPI({Key? key}) : super(key: key);

  @override
  State<CPI> createState() => _CPIState();
}

class _CPIState extends State<CPI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Progress Bar Example"),
      ),
      body: Center(
        child: CircularProgressIndicatorApp(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const DCP()));

        },
        child:Icon(Icons.save,)
      ),
    );
  }
}
class CircularProgressIndicatorApp extends StatefulWidget {
  const CircularProgressIndicatorApp({Key? key}) : super(key: key);

  @override
  State<CircularProgressIndicatorApp> createState() => _CircularProgressIndicatorAppState();
}

class _CircularProgressIndicatorAppState extends State<CircularProgressIndicatorApp> {
  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      backgroundColor: Colors.red,
      strokeWidth: 8,
    );
  }
}
