// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cached_news.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CachedNewsAdapter extends TypeAdapter<CachedNews> {
  @override
  final int typeId = 100;

  @override
  CachedNews read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CachedNews(
      fields[0] as News,
    );
  }

  @override
  void write(BinaryWriter writer, CachedNews obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.data)
      ..writeByte(1)
      ..write(obj.cachedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CachedNewsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
