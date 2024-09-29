import 'package:flutter/material.dart';
import 'package:flutterprogressbar/determinate_progress_bar.dart';

void main() => runApp(MaterialApp(home: MyApp(),));

class MyApp extends StatefulWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();

}

class _MyAppState extends State<MyApp> {
  bool loading=false;
  @override
  void intState(){
    super.initState();
    // loading =false;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("flutter Linear Progress Bar"),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(12.0),
          child: loading? LinearProgressIndicator():Text(
              "Press button for downloading",
          style: TextStyle(fontSize: 25)),
        ),
      ),
      floatingActionButton: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
      FloatingActionButton(
          onPressed: (){
    setState(() {
    loading=!loading;
    });
    },
      tooltip: "Download",
      child: Icon(Icons.cloud_download),
    ),
    SizedBox(height: 30,),


    FloatingActionButton.extended(
    onPressed: (){
    Navigator.push(context, MaterialPageRoute(builder: (context)=> const DPB()));

    },
    icon: Icon(Icons.save),
    label: Text("Save"),
    ),
    ]
    )
    );
  }
}
