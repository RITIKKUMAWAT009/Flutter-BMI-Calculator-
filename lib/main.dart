import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'BMI Calcultor'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();

  var result = "";
  var color;

  @override
  Widget build(BuildContext context) {
    var textColor = Colors.black;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Container(
        height: double.infinity,
        color: color,
        child: SingleChildScrollView(
          child: Container(
            height: 500,
            alignment: Alignment.topCenter,
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Image.asset('assets/image/homer.png'),
                const Text("BMI",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: wtController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.line_weight),
                    label: Text(
                      "Enter your weight(in kg)",
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  cursorColor: Colors.black,
                ),
                TextField(
                  controller: ftController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.height),
                    label: Text(
                      "Enter your Height in feet",
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  cursorColor: Colors.black,
                ),
                TextField(
                  controller: inController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.height),
                    label: Text(
                      "Enter your Height in inches",
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  cursorColor: Colors.black,
                ),
                FilledButton(
                    onPressed: () {
                      var wt = wtController.text.toString();
                      var ft = ftController.text.toString();
                      var inch = inController.text.toString();
                      if (wt != "" && ft != "" && inch != "") {
                        var iWt = int.parse(wt);
                        var iFt = int.parse(ft);
                        var iIn = int.parse(inch);
                        var totalInch = iFt * 12 + iIn;
                        var tMeter = totalInch * 2.54 / 100;
                        var bmi = iWt / (tMeter * tMeter);
                        setState(() {
                          result = "your bmi is ${bmi.toStringAsFixed(4)}";
                        });
                        if (bmi < 18.5) {
                          setState(() {
                            color = Colors.red;
                          });
                        } else if (bmi >= 18.5 && bmi < 25) {
                          setState(() {
                            color = Colors.green;
                          });
                        } else if (bmi >= 25 && bmi < 30) {
                          setState(() {
                            color = Colors.yellow;
                          });
                        }
                      } else {
                        setState(() {
                          result = "Please fill all the required fields";
                          color = Colors.white;
                          textColor = Colors.red;
                        });
                      }
                    },
                    child: Text("Calculate BMI")),
                Text(
                  result,
                  style: TextStyle(fontSize: 20, color: textColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
