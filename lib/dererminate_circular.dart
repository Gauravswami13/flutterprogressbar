import 'package:flutter/material.dart';
import 'dart:async';
class DCP extends StatefulWidget {
  const DCP({Key? key}) : super(key: key);

  @override
  State<DCP> createState() => _DCPState();
}

class _DCPState extends State<DCP> {
  bool loading=false;
  double progressvalue=0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Circular Progress Bar"),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(14.0),
          child: loading?
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                strokeWidth: 10,
                backgroundColor: Colors.yellow,
                valueColor: new AlwaysStoppedAnimation<Color>(Colors.red),
                value: progressvalue,
              ),
              Text("${(progressvalue*100).round()}%"),
            ],
          )
              :Text("Press button for downloading",style: TextStyle(fontSize: 25),)
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            loading=!loading;
            updateProgress();
          });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.cloud_download),
            Text("Save",style: TextStyle(fontSize: 10),)
          ],
        ),
      ),
    );
  }
  void updateProgress(){
    const oneSec = const Duration(seconds: 1);
    Timer.periodic(oneSec, (Timer t) {
      setState(() {
        progressvalue +=0.2;
        if(progressvalue.toStringAsFixed(1)=="1.0"){
          loading=false;
          t.cancel();
          return;
        }
      });
    });
  }
}
