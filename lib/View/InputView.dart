import 'package:flutter/material.dart';
import 'dart:math';

class InputPage extends StatefulWidget {
  @override
  InputPageState createState() {
    return InputPageState();
  }
}

class InputPageState extends State<InputPage> {
  final _formKey = GlobalKey<FormState>();

  TextFormField   inputField;
  TextField       outputField;
  RaisedButton    submitButton;
  
  final _inputController = TextEditingController();
  final _outputController = TextEditingController();

  @override
  void initState(){
    super.initState();

    inputField = new TextFormField(
      controller: _inputController,
      keyboardType: TextInputType.number,
      autofocus: true,
      decoration: InputDecoration(
        labelText: "二进制",
        hintText: "输入 0 或 1 组成的二进制数字"),
      validator: (String value) {
        if (value.isEmpty) {
          return '请输入内容';
          }else {
            RegExp exp = new RegExp(r"[2-9]");
            if (exp.hasMatch(value)) {
              return '只能输入 0 或 1';
            }
          }
        },
      );

      outputField = new TextField(
        controller: _outputController,
        enabled: false,
        decoration: InputDecoration(
          labelText: "十进制",
          hintText: '显示计算结果'
        ),
      );

      submitButton = RaisedButton(
            child: Text("Submit"),
            onPressed: (){
              if (_formKey.currentState.validate()) {
                transferToDecimal();
              }
            },
          );
  }


  void transferToDecimal() {
    String inputStr = _inputController.text;
    var length = inputStr.length;
    var result = 0;

    for (int i=0; i<length; i++) {
      var num = inputStr[i];
      result = result + (int.parse(num)>0 ? (pow(2, length-i-1)):0);
    }
    
    _outputController.text = result.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment:CrossAxisAlignment.center,
        children: <Widget>[
          inputField,
          outputField,
          submitButton
        ],
      ),
    );
  }
}