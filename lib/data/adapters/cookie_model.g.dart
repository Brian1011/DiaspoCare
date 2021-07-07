// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../models/cookie_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CookieModelAdapter extends TypeAdapter<CookieModel> {
  @override
  final int typeId = 2;

  @override
  CookieModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CookieModel(
      cookie: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CookieModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.cookie);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CookieModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
