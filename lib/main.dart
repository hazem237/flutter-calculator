import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Calculator',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: CalculatorButtons(onButtonPressed: (p0) => {print("Pressed")}));
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
