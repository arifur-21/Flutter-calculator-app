
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_claculator_app/components/rounded_button.dart';
import 'package:math_expressions/math_expressions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  var userInput = '';
  var answer = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [

              Expanded(

                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical:20.0),
                  child: Column(
                    children: [
                      Text(userInput.toString(), style: TextStyle(fontSize: 30, color: Colors.white),),
                      Text(answer.toString(), style: TextStyle(fontSize: 30, color: Colors.white),),
                    ],
                  ),
                ),
              ),

              Expanded(
                flex: 4,
                child: Column(
                  children: [
                    Row(
                      children: [
                        RoundedButton(title: "AC", onPress: (){
                          userInput = '';
                          answer = '';
                          setState(() {
                          });
                        },),
                        RoundedButton(title: "+/-", onPress:(){
                          userInput += '+/-';
                          setState(() {

                          });
                        },),
                        RoundedButton(title: "%", onPress: (){
                          userInput += '%';
                          setState(() {

                          });
                        },),
                        RoundedButton(title: "/", color: Colors.orange, onPress: (){
                          userInput += '/';
                          setState(() {

                          });
                        },),
                      ],
                    ),
                    Row(
                      children: [
                        RoundedButton(title: "7", onPress: (){
                          userInput += '7';
                          setState(() {

                          });
                        },),
                        RoundedButton(title: "8", onPress:(){
                          userInput += '8';
                          setState(() {

                          });
                        },),
                        RoundedButton(title: "9", onPress: (){
                          userInput += '9';
                          setState(() {

                          });
                        },),
                        RoundedButton(title: "x", color: Colors.orange, onPress: (){
                          userInput += 'x';
                          setState(() {

                          });
                        },),
                      ],
                    ),
                    Row(
                      children: [
                        RoundedButton(title: "4", onPress: (){
                          userInput += '4';
                          setState(() {

                          });
                        },),
                        RoundedButton(title: "5", onPress:(){
                          userInput += '5';
                          setState(() {

                          });
                        },),
                        RoundedButton(title: "6", onPress: (){
                          userInput += '6';
                          setState(() {

                          });
                        },),
                        RoundedButton(title: "-", color: Colors.orange, onPress: (){
                          userInput += '-';
                          setState(() {

                          });
                        },),
                      ],
                    ),
                    Row(
                      children: [
                        RoundedButton(title: "1", onPress: (){
                          userInput += '1';
                          setState(() {

                          });
                        },),
                        RoundedButton(title: "2", onPress:(){
                          userInput += '2';
                          setState(() {

                          });
                        },),
                        RoundedButton(title: "3", onPress: (){
                          userInput += '3';
                          setState(() {

                          });
                        },),
                        RoundedButton(title: "+", color: Colors.orange, onPress: (){
                          userInput += '+';
                          setState(() {

                          });
                        },),
                      ],
                    ),

                    Row(
                      children: [
                        RoundedButton(title: "0", onPress: (){
                          userInput += '0';
                          setState(() {

                          });
                        },),
                        RoundedButton(title: ".", onPress:(){
                          userInput += '.';
                          setState(() {

                          });
                        },),
                        RoundedButton(title: "DEL", onPress: (){
                          userInput = userInput.substring(0, userInput.length - 1);
                         setState(() {

                         });
                        },),
                        RoundedButton(title: "=", color: Colors.orange, onPress: (){
                      setState(() {
                        equalPress();
                      });
                        },),
                      ],
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  void equalPress(){
    String finalUserInput = userInput.replaceAll('x', '*');
    Parser parser = Parser();
    Expression expression = parser.parse(finalUserInput);
    ContextModel contextModel = ContextModel();

    double eval = expression.evaluate(EvaluationType.REAL, contextModel);
    answer = eval.toString();
  }

}



