import 'package:carList/models/fill-up-model.dart';
import 'package:carList/services/fill-up-data.dart';
import 'package:carList/widgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum Combustibil { benzina, motorina }

class FillUpAdd extends StatefulWidget {
  @override
  _FillUpAddState createState() => _FillUpAddState();
}

class _FillUpAddState extends State<FillUpAdd> {
  String _nrMasina;
  String _combustibil;
  String benzina = 'Benzina', motorina = 'Motorina'; // pentru pus in DB
  String _kmBord;
  String _sumaAlimentata;

  Combustibil _valoare = Combustibil.benzina;

  void setCombustibil(String comb) {
    _combustibil = comb;
  }

  void _addFillUp(context) {
    if (_nrMasina == null) {
      ToastWidget("Da un nume!");
      return;
    }
    if (_kmBord == null) {
      ToastWidget("Adauga Km Bord!");
      return;
    }
    if (_sumaAlimentata == null) {
      ToastWidget("Adauga suma!");
      return;
    }
    (_valoare == Combustibil.benzina)
        ? _combustibil = benzina
        : _combustibil = motorina;
    if (_combustibil == null) {
      ToastWidget("Alege Combustibilul!");
      return;
    }

    Provider.of<FillUpData>(context, listen: false).addFillUp(
      FillUpModel(
        nrMasina: _nrMasina ?? '',
        combustibil: _combustibil,
        data: DateTime.now(),
        kmBord: _kmBord ?? '0',
        sumaAlimentata: _sumaAlimentata ?? '0',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
          padding: EdgeInsets.all(16.0),
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  TextField(
                    autofocus: true,
                    decoration: InputDecoration(hintText: "Numar masina"),
                    onChanged: (v) {
                      setState(
                        () {
                          _nrMasina = v;
                        },
                      );
                    },
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  RadioListTile(
                    title: const Text('Benzina'),
                    value: Combustibil.benzina,
                    groupValue: _valoare,
                    onChanged: (Combustibil value) {
                      setState(() {
                        _valoare = value;
                      });
                    },
                  ),
                  RadioListTile(
                    title: const Text('Motorina'),
                    value: Combustibil.motorina,
                    groupValue: _valoare,
                    onChanged: (Combustibil value) {
                      setState(() {
                        _valoare = value;
                      });
                    },
                  ),
                  // TextField(
                  //   autofocus: true,
                  //   decoration: InputDecoration(hintText: "Combustibil"),
                  //   onChanged: (v) {
                  //     setState(
                  //       () {
                  //         combustibil = v;
                  //       },
                  //     );
                  //   },
                  // ),

                  SizedBox(
                    height: 10.0,
                  ),
                  TextField(
                    autofocus: true,
                    keyboardType: TextInputType.numberWithOptions(),
                    decoration: InputDecoration(hintText: "Kilometri Bord"),
                    onChanged: (v) {
                      setState(
                        () {
                          _kmBord = v;
                          print(_kmBord);
                        },
                      );
                    },
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextField(
                    autofocus: true,
                    keyboardType: TextInputType.numberWithOptions(),
                    decoration: InputDecoration(hintText: "Suma alimentata"),
                    onChanged: (v) {
                      setState(
                        () {
                          _sumaAlimentata = v;
                          print(_sumaAlimentata);
                        },
                      );
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.save,
                      color: Colors.blue,
                    ),
                    onPressed: () {
                      _addFillUp(context);
                    },
                  )
                ],
              ),
            ],
          )),
    );
  }
}
