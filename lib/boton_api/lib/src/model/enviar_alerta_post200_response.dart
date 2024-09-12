//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'enviar_alerta_post200_response.g.dart';

/// EnviarAlertaPost200Response
///
/// Properties:
/// * [token] 
/// * [contenido] 
@BuiltValue()
abstract class EnviarAlertaPost200Response implements Built<EnviarAlertaPost200Response, EnviarAlertaPost200ResponseBuilder> {
  @BuiltValueField(wireName: r'token')
  String? get token;

  @BuiltValueField(wireName: r'contenido')
  String? get contenido;

  EnviarAlertaPost200Response._();

  factory EnviarAlertaPost200Response([void updates(EnviarAlertaPost200ResponseBuilder b)]) = _$EnviarAlertaPost200Response;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(EnviarAlertaPost200ResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<EnviarAlertaPost200Response> get serializer => _$EnviarAlertaPost200ResponseSerializer();
}

class _$EnviarAlertaPost200ResponseSerializer implements PrimitiveSerializer<EnviarAlertaPost200Response> {
  @override
  final Iterable<Type> types = const [EnviarAlertaPost200Response, _$EnviarAlertaPost200Response];

  @override
  final String wireName = r'EnviarAlertaPost200Response';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    EnviarAlertaPost200Response object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.token != null) {
      yield r'token';
      yield serializers.serialize(
        object.token,
        specifiedType: const FullType(String),
      );
    }
    if (object.contenido != null) {
      yield r'contenido';
      yield serializers.serialize(
        object.contenido,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    EnviarAlertaPost200Response object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required EnviarAlertaPost200ResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'token':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.token = valueDes;
          break;
        case r'contenido':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.contenido = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  EnviarAlertaPost200Response deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = EnviarAlertaPost200ResponseBuilder();
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

