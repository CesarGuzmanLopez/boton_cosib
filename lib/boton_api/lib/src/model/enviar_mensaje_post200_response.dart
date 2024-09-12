//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'enviar_mensaje_post200_response.g.dart';

/// EnviarMensajePost200Response
///
/// Properties:
/// * [mensaje] 
@BuiltValue()
abstract class EnviarMensajePost200Response implements Built<EnviarMensajePost200Response, EnviarMensajePost200ResponseBuilder> {
  @BuiltValueField(wireName: r'mensaje')
  String? get mensaje;

  EnviarMensajePost200Response._();

  factory EnviarMensajePost200Response([void updates(EnviarMensajePost200ResponseBuilder b)]) = _$EnviarMensajePost200Response;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(EnviarMensajePost200ResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<EnviarMensajePost200Response> get serializer => _$EnviarMensajePost200ResponseSerializer();
}

class _$EnviarMensajePost200ResponseSerializer implements PrimitiveSerializer<EnviarMensajePost200Response> {
  @override
  final Iterable<Type> types = const [EnviarMensajePost200Response, _$EnviarMensajePost200Response];

  @override
  final String wireName = r'EnviarMensajePost200Response';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    EnviarMensajePost200Response object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.mensaje != null) {
      yield r'mensaje';
      yield serializers.serialize(
        object.mensaje,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    EnviarMensajePost200Response object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required EnviarMensajePost200ResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'mensaje':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.mensaje = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  EnviarMensajePost200Response deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = EnviarMensajePost200ResponseBuilder();
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

