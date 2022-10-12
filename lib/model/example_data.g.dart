// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'example_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ExampleDataAdapter extends TypeAdapter<ExampleData> {
  @override
  final int typeId = 0;

  @override
  ExampleData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ExampleData(
      name: fields[0] as String,
      content: fields[1] as String,
      size: fields[2] as double,
    );
  }

  @override
  void write(BinaryWriter writer, ExampleData obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.content)
      ..writeByte(2)
      ..write(obj.size);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExampleDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
