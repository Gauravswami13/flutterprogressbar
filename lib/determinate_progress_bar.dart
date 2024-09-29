import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterprogressbar/circular_progress_indicator.dart';
class DPB extends StatefulWidget {
  const DPB({Key? key}) : super(key: key);

  @override
  State<DPB> createState() => _DPBState();
}

class _DPBState extends State<DPB> {
  bool loading = false;
  double progressValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Flutter linear Progress Bar"),
        ),
        body: Center(
            child: Container(
              padding: EdgeInsets.all(12.0),
              child: loading ?
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LinearProgressIndicator(
                    backgroundColor: Colors.cyanAccent,
                    valueColor: new AlwaysStoppedAnimation<Color>(Colors.red),
                    value: progressValue,
                  ),
                  Text("${(progressValue * 100).round()}%"),
                ],
              )
                  : Text("Press button for downloading",
                style: TextStyle(fontSize: 25),),
            )
        ),
        floatingActionButton: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    loading = !loading;
                    updateProgress();
                  });
                },
                tooltip: "Download",
                child: Icon(Icons.cloud_download),
              ),
              SizedBox(height: 30,),


              FloatingActionButton.extended(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const CPI()));
                },
                icon: Icon(Icons.save),
                label: Text("Save"),
              ),
            ]
        )
    );
  }

  void updateProgress() {
    const oneSec = const Duration(seconds: 5);
    Timer.periodic(oneSec, (Timer t) {
      setState(() {
        progressValue += 0.1;
        if(progressValue.toStringAsFixed(1)=="1.0"){
        loading =false;
        t.cancel();
        return;
        }
      });
    });
  }
}