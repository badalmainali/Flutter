import 'package:flutter/material.dart';
import 'package:form_text_field/form_field.dart';
import 'package:form_text_field/simple_interest.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FormClasses(),
    );
  }
}
