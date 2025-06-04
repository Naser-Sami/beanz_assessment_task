import '/features/_features.dart' show Source, SourceModel;

class SourceMapper {
  SourceMapper._();

  /// Map a [SourceModel] instance to a [Source] instance
  static Source toDomain(SourceModel model) {
    return Source(id: model.id, name: model.name);
  }

  /// Map a [Source] instance to a [SourceModel] instance
  static SourceModel fromDomain(Source entity) {
    return SourceModel(id: entity.id, name: entity.name);
  }
}
