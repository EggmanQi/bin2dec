import 'package:flutter/material.dart';
import 'View/InputView.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Binary 2 Decimal",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Binary 2 Decimal"),
        ),
        body: InputPage(),
      )
    )
  ); 
}
