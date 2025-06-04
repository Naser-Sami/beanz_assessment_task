import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'source.g.dart';

@HiveType(typeId: 2)
class Source extends Equatable {
  @HiveField(0)
  final String? id;

  @HiveField(1)
  final String? name;

  const Source({required this.id, required this.name});

  static const empty = Source(id: '', name: '');

  Source copyWith({String? id, String? name}) =>
      Source(id: id ?? this.id, name: name ?? this.name);

  @override
  List<Object?> get props => [id, name];
}
