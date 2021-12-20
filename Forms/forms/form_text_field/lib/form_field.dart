import 'package:flutter/material.dart';

class FormClass extends StatefulWidget {
  const FormClass({Key? key}) : super(key: key);

  @override
  _FormClassState createState() => _FormClassState();
}

class _FormClassState extends State<FormClass> {
  final _formkey = GlobalKey<FormState>();
  final _firstcontroller = TextEditingController();
  final _secondcontroller = TextEditingController();

  String result = "";
  //validation ko function lekheko
  String? myvalidation(value) {
    if (value == null || value.isEmpty) {
      return 'Field is empty';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blueAccent,
        title: const Text(
          'Form Examples',
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: 'Rajdhani'),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(35.0),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                const Text(
                  'Calculations',
                  style: TextStyle(
                      fontFamily: 'Rajdhani',
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                      backgroundColor: Colors.grey),
                ),
                TextFormField(
                  validator: myvalidation,
                  controller: _firstcontroller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'First Number',
                    labelText: 'First',
                    suffixIcon: IconButton(
                      onPressed: () {
                        _firstcontroller.clear();
                      },
                      icon: const Icon(Icons.clear),
                    ),
                  ),
                  style: const TextStyle(
                      fontFamily: 'Rajdhani',
                      fontWeight: FontWeight.bold,
                      fontSize: 23),
                ),
                const SizedBox(height: 25),
                TextFormField(
                  validator: myvalidation,
                  controller: _secondcontroller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Second Number',
                    labelText: 'Second',
                    suffixIcon: IconButton(
                      onPressed: () {
                        _secondcontroller.clear();
                      },
                      icon: const Icon(Icons.clear),
                    ),
                  ),
                  style: const TextStyle(
                      fontFamily: 'Rajdhani',
                      fontWeight: FontWeight.bold,
                      fontSize: 23),
                ),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      textStyle: const TextStyle(
                          fontFamily: 'Rajdhani',
                          fontWeight: FontWeight.bold,
                          fontSize: 29),
                      elevation: 10,
                      shadowColor: Colors.redAccent),
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      setState(() {
                        result = ((int.parse(_firstcontroller.text) +
                                int.parse(_secondcontroller.text))
                            .toString());
                      });
                    }
                  },
                  child: const Text('SUBMIT'),
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        // width: 120,
                        height: 70,
                        color: Colors.black,
                        child: const Center(
                          child: Text(
                            'Result:',
                            style: TextStyle(
                                fontFamily: 'Rajdhani',
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: 160,
                        height: 70,
                        color: Colors.redAccent,
                        child: Center(
                          child: Text(
                            result,
                            style: const TextStyle(
                                fontFamily: 'Rajdhani',
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
