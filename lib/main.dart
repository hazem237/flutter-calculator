import 'package:flutter/material.dart';
import 'calculator_logic.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});

  @override
  CalculatorAppState createState() => CalculatorAppState();
}

class CalculatorAppState extends State<CalculatorApp> {
  String output = "0";
  double num1 = 0;
  double num2 = 0;
  String operand = "";

void buttonPressed(String buttonText) {
  final result = calculateResult(buttonText, output, num1, num2, operand);

  setState(() {
    output = result['output'];
    num1 = result['num1'];
    num2 = result['num2'];
    operand = result['operand'];
  });
}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Calculator"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Text(
                output,
                style: const TextStyle(
                    fontSize: 48.0, fontWeight: FontWeight.bold),
              ),
              CalculatorButtons(onButtonPressed: buttonPressed),
            ],
          ),
        ),
      ),
    );
  }
}

class CalculatorButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  const CalculatorButton(
      {super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(text),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey[300],
        foregroundColor: Colors.black,
        padding: const EdgeInsets.all(16.0),
        textStyle: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
      ),
      child: Text(text),
    );
  }
}

class CalculatorButtons extends StatelessWidget {
  final Function(String) onButtonPressed;

  CalculatorButtons({super.key, required this.onButtonPressed});

  final List<List<String>> buttonRows = [
    ["7", "8", "9", "/"],
    ["4", "5", "6", "*"],
    ["1", "2", "3", "-"],
    [".", "0", "C", "+"],
    ["="],
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: buttonRows.map((row) {
        return Row(
          children: row.map((text) {
            return CalculatorButton(
              text: text,
              onPressed: onButtonPressed,
            );
          }).toList(),
        );
      }).toList(),
    );
  }
}
