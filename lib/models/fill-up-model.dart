import 'package:hive/hive.dart';

part 'fill-up-model.g.dart';

@HiveType(typeId: 0)
class FillUpModel extends HiveObject {
  @HiveField(0)
  final String nrMasina;

  @HiveField(1)
  final String combustibil;

  @HiveField(2)
  final DateTime data;

  @HiveField(3)
  final String kmBord;

  @HiveField(4)
  final String sumaAlimentata;

  FillUpModel({
    this.nrMasina,
    this.combustibil,
    this.data,
    this.kmBord,
    this.sumaAlimentata,
  });
}
