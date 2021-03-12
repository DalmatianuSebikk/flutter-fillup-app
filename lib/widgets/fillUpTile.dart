import 'package:carList/models/fill-up-model.dart';
import 'package:carList/pages/fill-up-page-view.dart';
import 'package:carList/services/fill-up-data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FillUpTile extends StatelessWidget {
  final int tileIndex;

  const FillUpTile({this.tileIndex});

  @override
  Widget build(BuildContext context) {
    return Consumer<FillUpData>(
      builder: (context, fillUpData, child) {
        FillUpModel currentFillUp = fillUpData.getFillUp(tileIndex);

        return Container(
          decoration: BoxDecoration(
            color: tileIndex % 2 == 0 ? Colors.grey : Colors.white,
          ),
          child: ListTile(
            leading: Icon(Icons.car_repair),
            title: Text(
              currentFillUp?.nrMasina ?? "",
              style: TextStyle(
                color: Colors.black,
                fontSize: 17.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              (currentFillUp?.sumaAlimentata.toString() ?? "") + " RON",
              style: TextStyle(
                color: Colors.black,
                fontSize: 15.0,
              ),
            ),
            onTap: () {
              Provider.of<FillUpData>(context, listen: false)
                  .setActiveFillUp(currentFillUp.key);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return FillUpView();
                }),
              );
            },
          ),
        );
      },
    );
  }
}
