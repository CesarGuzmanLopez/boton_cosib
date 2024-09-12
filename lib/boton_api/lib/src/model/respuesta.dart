//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'respuesta.g.dart';

/// Respuesta
///
/// Properties:
/// * [token] 
/// * [contenido] 
@BuiltValue()
abstract class Respuesta implements Built<Respuesta, RespuestaBuilder> {
  @BuiltValueField(wireName: r'token')
  String? get token;

  @BuiltValueField(wireName: r'contenido')
  String? get contenido;

  Respuesta._();

  factory Respuesta([void updates(RespuestaBuilder b)]) = _$Respuesta;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(RespuestaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<Respuesta> get serializer => _$RespuestaSerializer();
}

class _$RespuestaSerializer implements PrimitiveSerializer<Respuesta> {
  @override
  final Iterable<Type> types = const [Respuesta, _$Respuesta];

  @override
  final String wireName = r'Respuesta';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    Respuesta object, {
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
    Respuesta object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required RespuestaBuilder result,
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
  Respuesta deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = RespuestaBuilder();
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

