import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:math_expressions/math_expressions.dart';

class calcularor extends StatefulWidget {
  const calcularor({super.key});

  @override
  State<calcularor> createState() => _calcularorState();
}

class _calcularorState extends State<calcularor> {
  String userInput = "";

  String result = "0";

  List<String> buttonlist = [
    'AC',
    '(',
    ')',
    '/',
    '7',
    '8',
    '9',
    '*',
    '4',
    '5',
    '6',
    '+',
    '1',
    '2',
    '3',
    '-',
    'C',
    '0',
    '=',
    '.',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(64, 0, 8, 7),
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.centerRight,
                    child: Text(
                      userInput,
                      style: TextStyle(fontSize: 32, color: Colors.white),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.centerRight,
                    child: Text(
                      result,
                      style: TextStyle(
                          fontSize: 48,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.white,
              thickness: 3,
            ),
            Expanded(
                child: Container(
              child: GridView.builder(
                itemCount: buttonlist.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemBuilder: (BuildContext context, int index) {
                  return CustomButton(buttonlist[index]);
                },
              ),
            ))
          ],
        ),
      ),
    );
  }

  Widget CustomButton(String text) {
    return InkWell(
      splashColor: Color(0xFF1d2630),
      onTap: () {
          setState(() {
            handleButtons(text);
          });

      },
      child: Ink(
          decoration: BoxDecoration(
              color: getBgColor(text),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Color.fromARGB(255, 255, 255, 255).withOpacity(0.1),
                    blurRadius: 4,
                    spreadRadius: 0.5,
                    offset: Offset(-3, -3))
              ]),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: getColor(text),
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          )),
    );
  }

  getColor(String text) {
    if (text == "/" ||
        text == "*" ||
        text == "+" ||
        text == "/" ||
        text == "-" ||
        text == "C") {
      return Color.fromARGB(255, 252, 100, 100);
    }
    return Color.fromARGB(255, 242, 240, 240);
  }

  getBgColor(String text) {
    if (text == "AC") {
      return Colors.red;
    } 
    if (text == "=") {
      return Colors.green;
      
    }
    return Color.fromARGB(169, 95, 43, 130);
  }
  handleButtons (String text ){
    if (text == "AC") {
      userInput = "";
      result = "0";
      return ;
      
    }
    if (text == "C") {

      if (userInput.isNotEmpty) {
        userInput = userInput.substring(0,userInput.length -1);
        return;
      }
      else {
        return null;
      }
      
    }
    if (text == "=") {
      return  calculate();
    userInput = result ;

    if (userInput.endsWith(".0")) {
      userInput = userInput.replaceAll(".0","");
      
    }


      if (result.endsWith(".0")
      ) {
        result = result.replaceAll(".0", "");
    return ;
      }

      
    }
    userInput = userInput + text;
  }
  String calculate(){
    try {
      var exp = Parser().parse(userInput);
      dynamic evaluation = exp.evaluate(EvaluationType.REAL, ContextModel());
      return evaluation.toString();
    } catch (e) {
      return "errorrrr";
    }
  }
}
