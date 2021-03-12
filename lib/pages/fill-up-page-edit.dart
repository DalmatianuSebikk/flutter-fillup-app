import 'package:carList/models/fill-up-model.dart';
import 'package:carList/services/fill-up-data.dart';
import 'package:carList/widgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FillUpEdit extends StatefulWidget {
  final FillUpModel currentFillUp;

  const FillUpEdit({@required this.currentFillUp});

  @override
  _FillUpEditState createState() => _FillUpEditState();
}

class _FillUpEditState extends State<FillUpEdit> {
  String nrMasinaNou;
  String combustibilNou;
  DateTime dataNoua;
  String kmBordNoi;
  String sumaAlimentataNoua;

  void _editFillUp(context) {
    if (nrMasinaNou == null) {
      ToastWidget("Da un nume!");
      return;
    }

    Provider.of<FillUpData>(context, listen: false).editFillUp(
      fillUp: FillUpModel(
        nrMasina: nrMasinaNou ?? '',
        combustibil: combustibilNou ?? '',
        kmBord: kmBordNoi ?? '0',
        data: DateTime.now(),
        sumaAlimentata: sumaAlimentataNoua ?? '0',
      ),
      fillUpKey: widget.currentFillUp.key,
    );

    Navigator.pop(context);
  }

  final TextEditingController _nrMasinaController = TextEditingController();
  final TextEditingController _combustibilController = TextEditingController();
  final TextEditingController _kmBordController = TextEditingController();
  final TextEditingController _sumaAlimentataController =
      TextEditingController();

  @override
  void initState() {
    _nrMasinaController.text = widget.currentFillUp.nrMasina;
    nrMasinaNou = widget.currentFillUp.nrMasina;

    _combustibilController.text = widget.currentFillUp.combustibil;
    combustibilNou = widget.currentFillUp.combustibil;

    _kmBordController.text = widget.currentFillUp.kmBord.toString();
    kmBordNoi = widget.currentFillUp.kmBord;

    _sumaAlimentataController.text =
        widget.currentFillUp.sumaAlimentata.toString();
    sumaAlimentataNoua = widget.currentFillUp.sumaAlimentata;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 16.0,
        title: Text(
          "Edit ${widget.currentFillUp.nrMasina}",
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.save),
              iconSize: 24.0,
              color: Colors.white,
              tooltip: "save",
              onPressed: () {
                _editFillUp(context);
              }),
        ],
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              TextField(
                autofocus: true,
                controller: _nrMasinaController,
                decoration: InputDecoration(hintText: "Numar masina"),
                onChanged: (v) {
                  setState(
                    () {
                      nrMasinaNou = v;
                    },
                  );
                },
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                autofocus: true,
                controller: _combustibilController,
                decoration: InputDecoration(hintText: "Combustibil"),
                onChanged: (v) {
                  setState(
                    () {
                      combustibilNou = v;
                    },
                  );
                },
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                autofocus: true,
                controller: _kmBordController,
                keyboardType: TextInputType.numberWithOptions(),
                decoration: InputDecoration(hintText: "Kilometri Bord Noi"),
                onChanged: (v) {
                  setState(
                    () {
                      kmBordNoi = v;
                    },
                  );
                },
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                autofocus: true,
                controller: _sumaAlimentataController,
                keyboardType: TextInputType.numberWithOptions(),
                decoration: InputDecoration(hintText: "Suma Alimentata Noua"),
                onChanged: (v) {
                  setState(
                    () {
                      sumaAlimentataNoua = v;
                    },
                  );
                },
              ),
              // Row(children: <Widget>[
              //   Text(
              //     "Data",
              //     style: TextStyle(
              //       fontWeight: FontWeight.bold,
              //       fontSize: 16.0,
              //     ),
              //   ),
              //   IconButton(
              //       icon: Icon(Icons.calendar_today),
              //       tooltip: "Apasa ca sa deschizi",
              //       onPressed: () async {
              //         final DateTime d = await showDatePicker(
              //           context: context,
              //           initialDate: DateTime.now(),
              //           firstDate: DateTime(2016),
              //           lastDate: DateTime(2100),
              //         );
              //       })
              // ])
            ],
          ),
        ),
      ),
    );
  }
}
