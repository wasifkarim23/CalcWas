import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:math_expressions/math_expressions.dart';

void main () {
  runApp( MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
        home: CalcWas(),
        theme : ThemeData(
            primarySwatch: Colors.red
        )
    );
  }
}
class CalcWas extends StatefulWidget {
  @override
  _CalcWasState createState() => _CalcWasState();
}
class _CalcWasState extends State<CalcWas> {
  String equation = "0";
  String result = "= 0";
  String expression = "";
  autoUpdate(){
    expression = equation;
    expression = expression.replaceAll('x','*');
    expression = expression.replaceAll('÷','/');
    try {
      Parser p = Parser();
      Expression exp = p.parse(expression);
      ContextModel cm = ContextModel();
      result = '= ${exp.evaluate(EvaluationType.REAL, cm)}';
    }
    catch(e){
      result= "= Error";
    }
  }
  buttonPressed(String buttonText){
    setState(() {
      if (buttonText == "C") {
        equation = "0";
        result = "= 0";
      }
      else if(buttonText == "_") {
        equation = equation.substring(0, equation.length - 1);
        autoUpdate();
        if (equation == "") {
          equation = "0";
          result = "= 0";
        }
      }
      else if (buttonText == "="){
        autoUpdate();
      }
      else {
        if (equation == "0") {
          equation = buttonText;
        }
        else {
          equation += buttonText;
        }
        autoUpdate();
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomPadding: false ,
      appBar: AppBar(
        title: Text("CalcWas") ,
        centerTitle: true,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image(image: AssetImage("images/calcbackground.jpg")
            ,fit: BoxFit.cover, color: Colors.black87,
            colorBlendMode: BlendMode.darken,
          ),
          Theme(data: ThemeData(
              brightness: Brightness.dark, primarySwatch: Colors.teal,
              inputDecorationTheme: InputDecorationTheme(
                  labelStyle: TextStyle(
                      color: Colors.redAccent, fontSize: 20.0
                  )
              )
          ),
              child: ButtonTheme(
                minWidth: 85,
                buttonColor: Colors.white10,
                height: 66,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: EdgeInsets.only(right: 20),
                      alignment: Alignment.centerRight,
                      child: Text(equation,style: TextStyle(
                          color: Colors.white, fontSize: 22
                      ),),
                    ),
                    Padding(padding: EdgeInsets.only(top: 15)),
                    Container(
                      padding: EdgeInsets.only(right: 20),
                      alignment: Alignment.centerRight,
                      child: Container(
                        child: Text(result ,style: TextStyle(
                          color: Colors.white,  fontSize: 30,
                        ),),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 10)),
                    Row(
                      children: [
                        RaisedButton(
                          child: Text(("C"),style: TextStyle(fontSize: 30),),
                          color: Colors.red,
                          onPressed: (){buttonPressed("C");},),
                        Padding(padding: EdgeInsets.only(right: 6)),
                        RaisedButton(
                          child: Text("⌫",style: TextStyle(fontSize: 30),),
                          color: Colors.redAccent,
                          onPressed: () {buttonPressed("_");},),
                        Padding(padding: EdgeInsets.only(right: 6)),
                        RaisedButton(
                          child: Text("÷",style: TextStyle(fontSize: 40),),
                          color: Colors.white24,
                          onPressed: () {buttonPressed("÷");},),
                        Padding(padding: EdgeInsets.only(right:8 )),
                        RaisedButton(
                          child: Text("X",style: TextStyle(fontSize: 25),),
                          color: Colors.white24,
                          onPressed: () {buttonPressed("x");},),
                      ],),
                    Padding(padding: EdgeInsets.only(top: 6)),
                    Row(
                      children: [
                        RaisedButton(
                          child: Text("7",style: TextStyle(fontSize: 30),),
                          onPressed: () {buttonPressed("7");},),
                        Padding(padding: EdgeInsets.only(right: 6)),
                        RaisedButton(
                          child: Text("8",style: TextStyle(fontSize: 30),),
                          onPressed: () {buttonPressed("8");},),
                        Padding(padding: EdgeInsets.only(right:6 )),
                        RaisedButton(
                          child: Text("9",style: TextStyle(fontSize: 30),),
                          onPressed: () {buttonPressed("9");},),
                        Padding(padding: EdgeInsets.only(right:8 )),
                        RaisedButton(
                          child: Text("+",style: TextStyle(fontSize: 35),),
                          color: Colors.white24,
                          onPressed: () {buttonPressed("+");},)
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(top: 6)),
                    Row(
                      children: [
                        RaisedButton(
                          child: Text("4",style: TextStyle(fontSize: 30),),
                          onPressed: () {buttonPressed("4");},),
                        Padding(padding: EdgeInsets.only(right: 6)),
                        RaisedButton(
                          child: Text("5",style: TextStyle(fontSize: 30),),
                          onPressed: () {buttonPressed("5");},),
                        Padding(padding: EdgeInsets.only(right: 6)),
                        RaisedButton(
                          child: Text("6",style: TextStyle(fontSize: 30),),
                          onPressed: () {buttonPressed("6");},),
                        Padding(padding: EdgeInsets.only(right: 8)),
                        RaisedButton(
                          child: Text("−",style: TextStyle(fontSize: 40),),
                          color: Colors.white24,
                          onPressed: () {buttonPressed("-");},)
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(top: 6)),
                    Row(
                      children: [
                        RaisedButton(
                          child: Text("1",style: TextStyle(fontSize: 30),),
                          onPressed: () {buttonPressed("1");},),
                        Padding(padding: EdgeInsets.only(right: 6)),
                        RaisedButton(
                          child: Text("2",style: TextStyle(fontSize: 30),),
                          onPressed: () {buttonPressed("2");},),
                        Padding(padding: EdgeInsets.only(right: 6)),
                        RaisedButton(
                          child: Text("3",style: TextStyle(fontSize: 30),),
                          onPressed: () {buttonPressed("3");},),
                        Padding(padding: EdgeInsets.only(right: 8)),
                        RaisedButton(
                          child: Text(".",style: TextStyle(fontSize: 50),),
                          onPressed: () {buttonPressed(".");},)
                      ],
                    ),Padding(padding: EdgeInsets.only(top: 6)),
                    Row(
                      children: [
                        SizedBox(
                          width: 176,
                          child: RaisedButton(
                            child: Text("0",style: TextStyle(fontSize: 30),),
                            onPressed: () {buttonPressed("0");},),
                        ),
                        Padding(padding: EdgeInsets.only(right: 6)),
                        SizedBox(
                          width: 178,
                          child: RaisedButton(
                            child: Text("=",style: TextStyle(fontSize: 30),),
                            color: Colors.white38,
                            onPressed: () {buttonPressed("=");},),
                        ),
                      ],
                    )
                  ],
                ),
              )
          )
        ],

      ),
    );
  }
}
