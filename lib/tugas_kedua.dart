import 'package:flutter/material.dart';
import 'package:Tugas/main.dart';

class TugasKedua extends StatefulWidget {
  @override
  _TugasKeduaState createState() => _TugasKeduaState();
}

class _TugasKeduaState extends State<TugasKedua> {
  Icon fab = Icon(
    Icons.refresh,
    size: 100.0,
  );
  
  bool status = false;

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
        title: Text('Change Mode'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: fab,
            ),
            RaisedButton( 
              child: Text('Ganti'),
              onPressed: () {
              setState(() {
                if (status == false) {
                  fab = Icon(
                    Icons.stop,
                    size: 100.0,
                  );
                  status = true;
                } else {
                  fab = Icon(
                    Icons.refresh,
                    size: 100.0,
                  );
                  status = false;
                }
              });
            },)
        ],),
      ),
    );
  }
}
