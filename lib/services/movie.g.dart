// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieAdapter extends TypeAdapter<Movie> {
  @override
  final int typeId = 1;

  @override
  Movie read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Movie(
      id: fields[1] as String,
      title: fields[2] as String,
      type: fields[3] as String,
      year: fields[4] as String,
      poster: fields[5] as String,
      status: fields[0] as String,
      rated: fields[6] as String?,
      runtime: fields[7] as String?,
      genre: fields[8] as String?,
      actors: fields[9] as String?,
      plot: fields[10] as String?,
      imdbRating: fields[11] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Movie obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.status)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.type)
      ..writeByte(4)
      ..write(obj.year)
      ..writeByte(5)
      ..write(obj.poster)
      ..writeByte(6)
      ..write(obj.rated)
      ..writeByte(7)
      ..write(obj.runtime)
      ..writeByte(8)
      ..write(obj.genre)
      ..writeByte(9)
      ..write(obj.actors)
      ..writeByte(10)
      ..write(obj.plot)
      ..writeByte(11)
      ..write(obj.imdbRating);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}
