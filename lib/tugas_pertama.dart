import 'package:flutter/material.dart';
import 'package:Tugas/main.dart';

class TugasPertama extends StatefulWidget {
  @override
  _TugasPertamaState createState() => _TugasPertamaState();
}

class _TugasPertamaState extends State<TugasPertama> {
  String _valKota;
  List _listGender = ["Male", "Female"];
  List _kota = [
    "Surabaya",
    "Jakarta",
    "Sidoarjo",
    "Malang",
    "Madiun",
    "Jombang",
    "Gresik"
  ];

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () => Navigator.of(context).pop(true),
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      content: Text("Ingin menyimpan data?"),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

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
        title: Text('Form Input'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
          children: <Widget>[
            TextFormField(
              decoration: new InputDecoration(
                hintText: "Masukan Nama Lengkap Anda",
                labelText: "Nama Lengkap",
                icon: Icon(Icons.people)
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'kolom tidak boleh kosong';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: new InputDecoration(
                hintText: "Masukan Nama Lengkap Anda",
                labelText: "Alamat",
                icon: Icon(Icons.people)),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: DropdownButton<String>(
                  hint: Text("Pilih Kota"),
                  value: _valKota,
                  isExpanded: true,
                  items: _kota.map((value) {
                    return new DropdownMenuItem<String>(
                      value: value,
                      child: new Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _valKota = value;
                    });
                  },
              ),
            ),
            RaisedButton(
              child: Text('Simpan'),
              onPressed: () {
                showAlertDialog(context);
              },
            )
          ],),
        ),
      ),
    );
  }
}
