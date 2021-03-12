import 'package:carList/models/fill-up-model.dart';
import 'package:carList/pages/fill-up-page-edit.dart';
import 'package:carList/services/fill-up-data.dart';
import 'package:carList/services/utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class FillUpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void _deleteConfirmation(currentFillUp) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'Esti sigur ca vrei sa stergi?',
              style: TextStyle(),
            ),
            //---

            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(
                      'Stergi ${currentFillUp.nrMasina} de la data de ${currentFillUp.data}'),
                  SizedBox(
                    height: 16.0,
                  ),
                ],
              ),
            ),
            //---

            actions: <Widget>[
              //-- butonul de stergere
              FlatButton(
                child: Text(
                  "STERGE",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  Log.d("Deleting ${currentFillUp.nrMasina}");
                  Provider.of<FillUpData>(context, listen: false)
                      .deleteFillUp(currentFillUp.key);

                  Navigator.popUntil(
                    context,
                    ModalRoute.withName(Navigator.defaultRouteName),
                  );
                },
              ),
              //-- butonul de cancel
              FlatButton(
                child: Text(
                  "Inchide",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  Log.d("cancelling");
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    return Consumer<FillUpData>(builder: (context, fillUpData, child) {
      FillUpModel currentFillUp = fillUpData.getActiveFillUp();
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          elevation: 12.0,
          title: Text(
            currentFillUp?.nrMasina ?? "",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17.0,
            ),
          ),
          actions: <Widget>[
            //butonul de edit
            // IconButton(
            //   icon: Icon(Icons.create),
            //   iconSize: 24.0,
            //   color: Colors.white,
            //   tooltip: 'Edit',
            //   onPressed: () {
            //     Log.d("Selected edit");
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) {
            //         return FillUpEdit(currentFillUp: currentFillUp);
            //       }),
            //     );
            //   },
            // ),
            //butonul de stergere
            IconButton(
              icon: Icon(Icons.delete),
              iconSize: 24.0,
              color: Colors.white,
              tooltip: 'Delete',
              onPressed: () {
                Log.d("Selected delete");
                _deleteConfirmation(currentFillUp);
              },
            )
          ],
        ),
        //---

        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              children: <Widget>[
                Container(
                  height: 36.0,
                  color: Colors.grey[300],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Numar masina:",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        currentFillUp.nrMasina,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 36.0,
                  color: Colors.white54,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Combustibil:",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        currentFillUp.combustibil,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 36.0,
                  color: Colors.grey[300],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Km bord:",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        currentFillUp.kmBord.toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 36.0,
                  color: Colors.white54,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Data:",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        DateFormat('yyyy-MM-dd').format(currentFillUp.data),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 36.0,
                  color: Colors.grey[300],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Suma alimentata:",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        currentFillUp.sumaAlimentata.toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
