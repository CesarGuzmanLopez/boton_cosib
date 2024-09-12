//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'enviar_mensaje_post_request.g.dart';

/// EnviarMensajePostRequest
///
/// Properties:
/// * [contenido] 
@BuiltValue()
abstract class EnviarMensajePostRequest implements Built<EnviarMensajePostRequest, EnviarMensajePostRequestBuilder> {
  @BuiltValueField(wireName: r'contenido')
  String? get contenido;

  EnviarMensajePostRequest._();

  factory EnviarMensajePostRequest([void updates(EnviarMensajePostRequestBuilder b)]) = _$EnviarMensajePostRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(EnviarMensajePostRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<EnviarMensajePostRequest> get serializer => _$EnviarMensajePostRequestSerializer();
}

class _$EnviarMensajePostRequestSerializer implements PrimitiveSerializer<EnviarMensajePostRequest> {
  @override
  final Iterable<Type> types = const [EnviarMensajePostRequest, _$EnviarMensajePostRequest];

  @override
  final String wireName = r'EnviarMensajePostRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    EnviarMensajePostRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
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
    EnviarMensajePostRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required EnviarMensajePostRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
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
  EnviarMensajePostRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = EnviarMensajePostRequestBuilder();
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

