import 'package:carList/models/fill-up-model.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

import 'utils.dart';

class FillUpData extends ChangeNotifier {
  static const String _boxName = "fillup";

  List<FillUpModel> _fillUp = [];
  FillUpModel _activeFillUp;

  void getFillUps() async {
    var box = await Hive.openBox<FillUpModel>(_boxName);
    _fillUp = box.values.toList();
    notifyListeners();
  }

  FillUpModel getFillUp(int index) {
    return _fillUp[index];
  }

  void addFillUp(FillUpModel fillUp) async {
    var box = await Hive.openBox<FillUpModel>(_boxName);
    await box.add(fillUp);
    _fillUp = box.values.toList();

    notifyListeners();
  }

  void deleteFillUp(key) async {
    var box = await Hive.openBox<FillUpModel>(_boxName);
    await box.delete(key);
    _fillUp = box.values.toList();

    Log.i("Deleted member with key" + key.toString());
    notifyListeners();
  }

  void editFillUp({FillUpModel fillUp, int fillUpKey}) async {
    var box = await Hive.openBox<FillUpModel>(_boxName);
    await box.put(fillUpKey, fillUp);
    _fillUp = box.values.toList();
    _activeFillUp = box.get(fillUpKey);

    Log.i("Edited" + fillUp.nrMasina);

    notifyListeners();
  }

  void setActiveFillUp(key) async {
    var box = await Hive.openBox<FillUpModel>(_boxName);
    _activeFillUp = box.get(key);

    notifyListeners();
  }

  FillUpModel getActiveFillUp() {
    return _activeFillUp;
  }

  int get fillUpCount {
    return _fillUp.length;
  }
}
