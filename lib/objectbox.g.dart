// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again:
// With a Flutter package, run `flutter pub run build_runner build`.
// With a Dart package, run `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types
// coverage:ignore-file

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'models/user_settings.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(1, 2878909862487457844),
      name: 'UserSettings',
      lastPropertyId: const IdUid(3, 4324966519225360133),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 2650006195364486941),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 867370614564014342),
            name: 'currentUnitOfMeasure',
            type: 8,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 4324966519225360133),
            name: 'lowestPlate',
            type: 8,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[])
];

/// Open an ObjectBox store with the model declared in this file.
Future<Store> openStore(
        {String? directory,
        int? maxDBSizeInKB,
        int? fileMode,
        int? maxReaders,
        bool queriesCaseSensitiveDefault = true,
        String? macosApplicationGroup}) async =>
    Store(getObjectBoxModel(),
        directory: directory ?? (await defaultStoreDirectory()).path,
        maxDBSizeInKB: maxDBSizeInKB,
        fileMode: fileMode,
        maxReaders: maxReaders,
        queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
        macosApplicationGroup: macosApplicationGroup);

/// ObjectBox model definition, pass it to [Store] - Store(getObjectBoxModel())
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(1, 2878909862487457844),
      lastIndexId: const IdUid(0, 0),
      lastRelationId: const IdUid(0, 0),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    UserSettings: EntityDefinition<UserSettings>(
        model: _entities[0],
        toOneRelations: (UserSettings object) => [],
        toManyRelations: (UserSettings object) => {},
        getId: (UserSettings object) => object.id,
        setId: (UserSettings object, int id) {
          object.id = id;
        },
        objectToFB: (UserSettings object, fb.Builder fbb) {
          fbb.startTable(4);
          fbb.addInt64(0, object.id);
          fbb.addFloat64(1, object.currentUnitOfMeasure);
          fbb.addFloat64(2, object.lowestPlate);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = UserSettings(
              id: const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0),
              currentUnitOfMeasure:
                  const fb.Float64Reader().vTableGet(buffer, rootOffset, 6, 0),
              lowestPlate:
                  const fb.Float64Reader().vTableGet(buffer, rootOffset, 8, 0));

          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [UserSettings] entity fields to define ObjectBox queries.
class UserSettings_ {
  /// see [UserSettings.id]
  static final id =
      QueryIntegerProperty<UserSettings>(_entities[0].properties[0]);

  /// see [UserSettings.currentUnitOfMeasure]
  static final currentUnitOfMeasure =
      QueryDoubleProperty<UserSettings>(_entities[0].properties[1]);

  /// see [UserSettings.lowestPlate]
  static final lowestPlate =
      QueryDoubleProperty<UserSettings>(_entities[0].properties[2]);
}