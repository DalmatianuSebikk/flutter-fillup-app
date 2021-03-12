// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fill-up-model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FillUpModelAdapter extends TypeAdapter<FillUpModel> {
  @override
  final int typeId = 0;

  @override
  FillUpModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FillUpModel(
      nrMasina: fields[0] as String,
      combustibil: fields[1] as String,
      data: fields[2] as DateTime,
      kmBord: fields[3] as String,
      sumaAlimentata: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, FillUpModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.nrMasina)
      ..writeByte(1)
      ..write(obj.combustibil)
      ..writeByte(2)
      ..write(obj.data)
      ..writeByte(3)
      ..write(obj.kmBord)
      ..writeByte(4)
      ..write(obj.sumaAlimentata);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FillUpModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
