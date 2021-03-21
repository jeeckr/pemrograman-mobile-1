import 'package:flutter/material.dart';
import 'package:Tugas/main.dart';

class TugasKetiga extends StatefulWidget {
  @override
  _TugasKetigaState createState() => _TugasKetigaState();
}

class _TugasKetigaState extends State<TugasKetiga> {
  final textFieldOne = TextEditingController();
  final textFieldTwo = TextEditingController();

  double result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.pushReplacement(context, 
                MaterialPageRoute(builder: (context) {
              return MyApp();
            }));
          },
        ),
        title: Text('Kalkulator'),
      ),
      body: Container(
        child: SafeArea(
         child: Padding(
           padding: EdgeInsets.all(16.0),
            child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 35.0),
                    child: Text(
                      'Kalkulator', 
                      style: TextStyle(
                        fontSize: 40.0
                      )
                    ),
                  ),
                  Text(
                    '${result ?? ''}',
                    style: TextStyle(
                      fontSize: 50.0
                    ),
                  ),
                  Text('Hasil'),
                  Padding(
                    padding: EdgeInsets.only(top: 30.0),
                    child: Column(
                      children: [
                        Text('Angka Pertama'),
                        TextField(
                          controller: textFieldOne,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                        ),
                      ]
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: Column(
                      children: [
                        Text('Angka Kedua'),
                        TextField(
                          controller: textFieldTwo,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 50,
                        child:  
                        RaisedButton(
                          child: Text('+'),
                          onPressed: () => calculate('+'),
                        ),
                      ),
                      SizedBox(
                        width: 50,
                        child:  
                        RaisedButton(
                          child: Text('-'),
                          onPressed: () => calculate('-'),
                        ),
                      ),
                      SizedBox(
                        width: 50,
                        child:  
                        RaisedButton(
                          child: Text('x'),
                          onPressed: () => calculate('x'),
                        ),
                      ),
                      SizedBox(
                        width: 50,
                        child:  
                        RaisedButton(
                          child: Text('/'),
                          onPressed: () => calculate('/'),
                        ),
                      ),
                    ],
                  ),
                  RaisedButton(
                    child: Text('Reset'),
                    onPressed: () {
                      setState(() {
                        result = 0;
                      });
                    },
                  )
              ],),
           ),
        ),
      ),
    );
  }

  void calculate(String operation) {
    final firstNumber = double.parse(textFieldOne.value.text);
    final secondNumber = double.parse(textFieldTwo.value.text);

    switch (operation) {
      case '+':
        setState(() {
          result = firstNumber + secondNumber;
        });
        break;
      case '-':
        setState(() {
          result = firstNumber - secondNumber;
        });
        break;
      case 'x':
        setState(() {
          result = firstNumber * secondNumber;
        });
        break;
      case '/':
        setState(() {
          result = firstNumber / secondNumber;
        });
        break;
    }
  }
}
