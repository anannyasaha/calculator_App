import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);



  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _output="0";
    double num1=0.0;
    double num2=0.0;
    String operand="";
    String output="0";
    String operandpressed="1";
    buttonpressed(String button){
      if (button=="CLEAR"){
        num1=0.0;
        num2=0.0;
        operand="";
        _output="0";
      }
      else if(button=="+"||button=="X"||button=="-"||button=="/"){
        num1=double.parse(_output);
        operand=button;
        _output="0";
        operandpressed="0";
      }
      else if(button=="."){
        if(_output.contains(".")){
          print("Already contains decimal");
        }
        else{
          _output=_output+button;
        }
      }
      else if(button=="="){
        num2=double.parse(output);
        if(operand=="+"){
          _output=(num1+num2).toString();
        }
        if(operand=="-"){
          _output=(num1-num2).toString();
        }
        if(operand=="X"){
          _output=(num1*num2).toString();
        }
        if(operand=="/"){
          _output=(num1/num2).toString();
        }
        num1=0.0;
        num2=0.0;
        operand="";}
        else {
        _output = _output + button;
      }
        setState(() {
          if(operandpressed=="0"){
            output=num1.toStringAsFixed(2)+operand;
            operandpressed="1";
          }else
          output=double.parse(_output).toStringAsFixed(2);
        });

    }
    Widget buildbutton(String button){
      return
      new Expanded(
        child: new OutlineButton(
          padding:new EdgeInsets.all(20),
          child:new Text(button,style:new TextStyle(fontSize: 28,fontWeight: FontWeight.bold)),
          onPressed: ()=>{
            buttonpressed(button)
          },
      borderSide: BorderSide(
      color: Colors.blue, //Color of the border
      style: BorderStyle.solid, //Style of the border
      width: 0.8),
          color:Colors.white,
          textColor: Colors.black,

        ),);
    }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: new Container(
        child: new Column(
            children: <Widget> [
          new Container(
        alignment:Alignment.centerRight,
            padding: EdgeInsets.only(top:30),
            child:new Text(output,style:new TextStyle(fontSize: 35,fontWeight: FontWeight.bold))),
        new Expanded(child: new Divider()),

        new Column(children: <Widget>[
         new Row(
             children:[buildbutton("7"),
             buildbutton("8"),
               buildbutton("9"),
               buildbutton("X")
             ]),
         new Row(
             children: [buildbutton("4"),
               buildbutton("5"),
               buildbutton("6"),
               buildbutton("/")],),
         new Row(
           children: [buildbutton("3"),
             buildbutton("2"),
             buildbutton("1"),
             buildbutton("+")],),
         new Row(
           children: [buildbutton("-"),
             buildbutton("."),
             buildbutton("0"),
             buildbutton("00")],),
         new Row(
           children: [buildbutton("CLEAR"),
             buildbutton("="),
       ])
      ])
      // This trailing comma makes auto-formatting nicer for build methods.
    ]))
    );
  }
}
