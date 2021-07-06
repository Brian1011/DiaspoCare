// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../models/auth_user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AuthUserModelAdapter extends TypeAdapter<AuthUserModel> {
  @override
  final int typeId = 0;

  @override
  AuthUserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AuthUserModel(
      email: fields[0] as String,
      name: fields[1] as String,
      supporters: (fields[2] as List)?.cast<String>(),
      vendors: (fields[3] as List)?.cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, AuthUserModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.email)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.supporters)
      ..writeByte(3)
      ..write(obj.vendors);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthUserModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
