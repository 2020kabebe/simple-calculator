import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Simple Calculator',
      home: CalculatorPage(),
    );
  }
}

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  double? result;
  String? operator;
  String? firstNumber;

  void buttonPressed(String buttonText) {
    if (buttonText == 'C') {
      result = null;
      operator = null;
      firstNumber = null;
    } else if (buttonText == '+' ||
        buttonText == '-' ||
        buttonText == 'x' ||
        buttonText == '/') {
      firstNumber = result.toString();
      result = null;
      operator = buttonText;
    } else if (buttonText == '=') {
      if (operator == '+') {
        result = double.parse(firstNumber!) + double.parse(result.toString());
      } else if (operator == '-') {
        result = double.parse(firstNumber!) - double.parse(result.toString());
      } else if (operator == 'x') {
        result = double.parse(firstNumber!) * double.parse(result.toString());
      } else if (operator == '/') {
        result = double.parse(firstNumber!) / double.parse(result.toString());
      }
    } else {
      result = (result ?? 0) * 10 + double.parse(buttonText);
    }

    setState(() {});
  }

  Widget buildButton(String buttonText) {
    return Expanded(
      child: OutlinedButton(
        onPressed: () => buttonPressed(buttonText),
        child: Text(
          buttonText,
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Calculator'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.all(20),
              child: Text(
                (result ?? 0).toString(),
                style: const TextStyle(fontSize: 48),
              ),
            ),
          ),
          Row(
            children: [
              buildButton('7'),
              buildButton('8'),
              buildButton('9'),
              buildButton('/'),
            ],
          ),
          Row(
            children: [
              buildButton('4'),
              buildButton('5'),
              buildButton('6'),
              buildButton('x'),
            ],
          ),
          Row(
            children: [
              buildButton('1'),
              buildButton('2'),
              buildButton('3'),
              buildButton('-'),
            ],
          ),
          Row(
            children: [
              buildButton('C'),
              buildButton('0'),
              buildButton('='),
              buildButton('+'),
            ],
          ),
        ],
      ),
    );
  }
}