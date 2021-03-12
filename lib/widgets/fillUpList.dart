import 'package:carList/services/fill-up-data.dart';
import 'package:carList/widgets/fillUpTile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FillUpList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return FillUpTile(
          tileIndex: index,
        );
      },
      itemCount: Provider.of<FillUpData>(context).fillUpCount,
      padding: EdgeInsets.fromLTRB(8.0, 6.0, 8.0, 4.0),
    );
  }
}
