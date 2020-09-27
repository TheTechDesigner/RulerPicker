import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ruler_picker/ruler_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xFFC41A3B),
        primaryColorLight: Color(0xFFFBE0E6),
        accentColor: Color(0xFF1B1F32),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String title = 'Ruler Picker';

  TextEditingController _controller;
  RulerPickerController _rulerPickerController;
  num _showVal = 0;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: '16');
    _rulerPickerController = RulerPickerController(value: 0);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RulerPicker(
              height: 100.0,
              width: 350.0,
              backgroundColor: Color(0xFFFBE0E6),
              fractionDigits: 2,
              controller: _rulerPickerController,
              onValueChange: (_val) {
                setState(() {
                  _controller.text = _val.toString();
                });
              },
            ),
            Container(
              margin: EdgeInsets.all(32.0),
              child: CupertinoTextField(
                controller: _controller,
                onChanged: (_value) {
                  _showVal = int.parse(_value);
                },
                onEditingComplete: () {
                  _rulerPickerController.value = _showVal;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
