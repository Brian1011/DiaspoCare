// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../models/registration_step_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RegistrationStepAdapter extends TypeAdapter<RegistrationStep> {
  @override
  final int typeId = 1;

  @override
  RegistrationStep read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RegistrationStep(
      step: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, RegistrationStep obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.step);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RegistrationStepAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
