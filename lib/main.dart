import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //* Dumb calculation
  int dumbPercentageCalculation(int max, int val) {
    return (val / max * 100).truncate();
  }

  //* Smart calculation
  int smartPercentageCalculation(int initial, int target, int value) {
    //* Magic formula
    final double result = ((value - initial) * 100) / (target - initial);
    //* Cast to int
    final int resultAsInt = result.truncate().toInt();
    return resultAsInt;
  }

  //* Variables
  int dumbResult;
  TextEditingController _minDumbController = TextEditingController();
  TextEditingController _maxDumbController = TextEditingController();
  TextEditingController _valDumbController = TextEditingController();

  int smartResult;
  TextEditingController _minSmartController = TextEditingController();
  TextEditingController _maxSmartController = TextEditingController();
  TextEditingController _valSmartController = TextEditingController();

  bool showDumbFormula = false;
  bool showSmartFormula = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Percentage calculation'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 75,
                      child: TextFormField(
                        decoration: InputDecoration(labelText: 'Min'),
                        controller: _minDumbController,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: 75,
                      child: TextFormField(
                        decoration: InputDecoration(labelText: 'Max'),
                        controller: _maxDumbController,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: 75,
                      child: TextFormField(
                        decoration: InputDecoration(labelText: 'Current'),
                        controller: _valDumbController,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(' = '),
                    SizedBox(
                      width: 10,
                    ),
                    Text('$dumbResult %'),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                RaisedButton(
                  onPressed: () {
                    final int max = int.parse(_maxDumbController.text);
                    final int val = int.parse(_valDumbController.text);
                    setState(() {
                      dumbResult = dumbPercentageCalculation(max, val);
                    });
                  },
                  child: Text('Calculate progress dumb'),
                ),
                Row(
                  children: <Widget>[
                    Switch(
                        value: showDumbFormula,
                        onChanged: (newValue) {
                          setState(() {
                            showDumbFormula = newValue;
                          });
                        }),
                    Text(showDumbFormula == true
                        ? '( current / max ) * 100'
                        : ''),
                  ],
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 75,
                      child: TextFormField(
                        decoration: InputDecoration(labelText: 'Initial'),
                        controller: _minSmartController,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: 75,
                      child: TextFormField(
                        decoration: InputDecoration(labelText: 'Target'),
                        controller: _maxSmartController,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: 75,
                      child: TextFormField(
                        decoration: InputDecoration(labelText: 'Current'),
                        controller: _valSmartController,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(' = '),
                    SizedBox(
                      width: 10,
                    ),
                    Text('$smartResult %'),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                RaisedButton(
                  onPressed: () {
                    final int min = int.parse(_minSmartController.text);
                    final int max = int.parse(_maxSmartController.text);
                    final int val = int.parse(_valSmartController.text);
                    setState(() {
                      smartResult = smartPercentageCalculation(min, max, val);
                    });
                  },
                  child: Text('Calculate progress smart'),
                ),
                Row(
                  children: <Widget>[
                    Switch(
                        value: showSmartFormula,
                        onChanged: (newValue) {
                          setState(() {
                            showSmartFormula = newValue;
                          });
                        }),
                    Text(
                      showSmartFormula == true
                          ? '((value - initial) * 100) / (target - initial)'
                          : '',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.green),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
