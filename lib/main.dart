import 'package:flutter/material.dart';
import 'package:simple_calculator/my%20_button.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> buttons = [
    'C',
    'Del',
    '%',
    '/',
    '9',
    '8',
    '7',
    'x',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '.',
    '0',
    'Ans',
    '=',
  ];

  iscolor(String x) {
    if (x == '%' || x == '/' || x == 'x' || x == '-' || x == '+' || x == '=') {
      return true;
    }
    return false;
  }

  equalTo(){
    final finalQuestion= userQuestion.replaceAll('x', '*');
    Parser p=Parser();
    Expression exp=p.parse(finalQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
userAnswer=eval.toString();
  }

  String userQuestion = '';
  String userAnswer = '';

  TextStyle userTextStyle =
      TextStyle(fontWeight: FontWeight.bold, fontSize: 30);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.deepPurple.shade100,
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            title: Text('Simple Calculator'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            userQuestion,
                            style: userTextStyle,
                          )),
                      Container(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            userAnswer,
                            style: userTextStyle,
                          )),
                    ],
                  ),
                )),
                Expanded(
                  flex: 2,
                  child: GridView.builder(
                      itemCount: buttons.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4),
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return MyButton(
                            onTap: () {
                              setState(() {
                                userQuestion = '';
                              });
                            },
                            onLongPress: () {
                              setState(() {
                                userAnswer = '';
                              });
                            },
                            buttonText: buttons[index],
                            buttonTextColor: Colors.white,
                            containerColor: Colors.black54,
                          );
                        } else if (index == 1) {
                          return MyButton(
                            onTap: () {
                              setState(() {
                                userQuestion = userQuestion.substring(
                                    0, userQuestion.length - 1);
                              });
                            },
                            buttonText: buttons[index],
                            buttonTextColor: Colors.white,
                            containerColor: Colors.red.shade300,
                          );
                        } else if (index == 18) {
                          return MyButton(
                            onTap: () {
                              setState(() {
equalTo();
                              });
                            },
                            buttonText: buttons[index],
                            buttonTextColor: Colors.white,
                            containerColor: Colors.deepPurple,
                          );
                        } else if (index == 19) {
                          return MyButton(
                            onTap: () {
                              setState(() {
                                equalTo();
                              });
                            },
                            buttonText: buttons[index],
                            buttonTextColor: Colors.white,
                            containerColor: Colors.deepPurple,
                          );
                        } else {
                          return MyButton(
                            onTap: () {
                              setState(() {
                                userQuestion += buttons[index];
                              });
                            },
                            buttonText: buttons[index],
                            buttonTextColor: iscolor(buttons[index])
                                ? Colors.white
                                : Colors.deepPurple.shade400,
                            containerColor: iscolor(buttons[index])
                                ? Colors.deepPurple
                                : Colors.deepPurple.shade50,
                          );
                        }
                      }),
                ),
              ],
            ),
          )),
    );
  }
}
