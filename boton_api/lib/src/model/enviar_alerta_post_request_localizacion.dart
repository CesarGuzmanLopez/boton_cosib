//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'enviar_alerta_post_request_localizacion.g.dart';

/// EnviarAlertaPostRequestLocalizacion
///
/// Properties:
/// * [latitude] 
/// * [longitude] 
/// * [altitude] 
/// * [accuracy] 
/// * [altitudeAccuracy] 
/// * [heading] 
/// * [speed] 
@BuiltValue()
abstract class EnviarAlertaPostRequestLocalizacion implements Built<EnviarAlertaPostRequestLocalizacion, EnviarAlertaPostRequestLocalizacionBuilder> {
  @BuiltValueField(wireName: r'latitude')
  num? get latitude;

  @BuiltValueField(wireName: r'longitude')
  num? get longitude;

  @BuiltValueField(wireName: r'altitude')
  num? get altitude;

  @BuiltValueField(wireName: r'accuracy')
  num? get accuracy;

  @BuiltValueField(wireName: r'altitudeAccuracy')
  num? get altitudeAccuracy;

  @BuiltValueField(wireName: r'heading')
  num? get heading;

  @BuiltValueField(wireName: r'speed')
  num? get speed;

  EnviarAlertaPostRequestLocalizacion._();

  factory EnviarAlertaPostRequestLocalizacion([void updates(EnviarAlertaPostRequestLocalizacionBuilder b)]) = _$EnviarAlertaPostRequestLocalizacion;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(EnviarAlertaPostRequestLocalizacionBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<EnviarAlertaPostRequestLocalizacion> get serializer => _$EnviarAlertaPostRequestLocalizacionSerializer();
}

class _$EnviarAlertaPostRequestLocalizacionSerializer implements PrimitiveSerializer<EnviarAlertaPostRequestLocalizacion> {
  @override
  final Iterable<Type> types = const [EnviarAlertaPostRequestLocalizacion, _$EnviarAlertaPostRequestLocalizacion];

  @override
  final String wireName = r'EnviarAlertaPostRequestLocalizacion';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    EnviarAlertaPostRequestLocalizacion object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.latitude != null) {
      yield r'latitude';
      yield serializers.serialize(
        object.latitude,
        specifiedType: const FullType(num),
      );
    }
    if (object.longitude != null) {
      yield r'longitude';
      yield serializers.serialize(
        object.longitude,
        specifiedType: const FullType(num),
      );
    }
    if (object.altitude != null) {
      yield r'altitude';
      yield serializers.serialize(
        object.altitude,
        specifiedType: const FullType(num),
      );
    }
    if (object.accuracy != null) {
      yield r'accuracy';
      yield serializers.serialize(
        object.accuracy,
        specifiedType: const FullType(num),
      );
    }
    if (object.altitudeAccuracy != null) {
      yield r'altitudeAccuracy';
      yield serializers.serialize(
        object.altitudeAccuracy,
        specifiedType: const FullType(num),
      );
    }
    if (object.heading != null) {
      yield r'heading';
      yield serializers.serialize(
        object.heading,
        specifiedType: const FullType(num),
      );
    }
    if (object.speed != null) {
      yield r'speed';
      yield serializers.serialize(
        object.speed,
        specifiedType: const FullType(num),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    EnviarAlertaPostRequestLocalizacion object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required EnviarAlertaPostRequestLocalizacionBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'latitude':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.latitude = valueDes;
          break;
        case r'longitude':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.longitude = valueDes;
          break;
        case r'altitude':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.altitude = valueDes;
          break;
        case r'accuracy':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.accuracy = valueDes;
          break;
        case r'altitudeAccuracy':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.altitudeAccuracy = valueDes;
          break;
        case r'heading':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.heading = valueDes;
          break;
        case r'speed':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.speed = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  EnviarAlertaPostRequestLocalizacion deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = EnviarAlertaPostRequestLocalizacionBuilder();
    final serializedList = (serialized as Iterable<Object?>).toList();
    final unhandled = <Object?>[];
    _deserializeProperties(
      serializers,
      serialized,
      specifiedType: specifiedType,
      serializedList: serializedList,
      unhandled: unhandled,
      result: result,
    );
    return result.build();
  }
}

