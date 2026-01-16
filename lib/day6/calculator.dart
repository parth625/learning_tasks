import 'dart:developer';
import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final TextEditingController _controllerOne = TextEditingController();
  final TextEditingController _controllerTwo = TextEditingController();
  var formKey = GlobalKey<FormState>();

  num? num1;
  num? num2;
  num result = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Calculator"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _controllerOne,
                keyboardType: TextInputType.number,

                decoration: InputDecoration(
                  hint: Text("Enter Number 1: "),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter number 1";
                  }
                  return null;
                },
              ),

              SizedBox(height: 50),
              TextFormField(
                controller: _controllerTwo,
                keyboardType: TextInputType.number,

                decoration: InputDecoration(
                  hint: Text("Enter Number 2: "),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter number 2";
                  }

                  return null;
                },
              ),

              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {}
                      setState(() {
                        num1 = double.parse(_controllerOne.text.toString());
                        num2 = double.parse(_controllerTwo.text.toString());

                        result = num1! + num2!;
                        log('$result');
                      });
                    },
                    child: Text('+', style: TextStyle(fontSize: 20)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        num1 = double.parse(_controllerOne.text.toString());
                        num2 = double.parse(_controllerTwo.text.toString());

                        result = num1! - num2!;
                        log('$result');
                      });
                    },
                    child: Text('-', style: TextStyle(fontSize: 20)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        num1 = double.parse(_controllerOne.text.toString());
                        num2 = double.parse(_controllerTwo.text.toString());

                        result = num1! * num2!;
                        log('$result');
                      });
                    },
                    child: Text('*', style: TextStyle(fontSize: 20)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        num1 = double.parse(_controllerOne.text.toString());
                        num2 = double.parse(_controllerTwo.text.toString());

                        if (num2 == 0) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "Cannot divide by zero",
                                style: TextStyle(fontSize: 20),
                              ),
                              duration: Duration(milliseconds: 1000),
                            ),
                          );
                        } else {
                          result = num1! / num2!;
                          log('$result');
                        }
                      });
                    },
                    child: Text('/', style: TextStyle(fontSize: 20)),
                  ),
                ],
              ),
              SizedBox(height: 50),

              Text(
                'Answer: ${result.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
