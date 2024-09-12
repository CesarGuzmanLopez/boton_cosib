//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'mensaje.g.dart';

/// Mensaje
///
/// Properties:
/// * [contenido] 
@BuiltValue()
abstract class Mensaje implements Built<Mensaje, MensajeBuilder> {
  @BuiltValueField(wireName: r'contenido')
  String? get contenido;

  Mensaje._();

  factory Mensaje([void updates(MensajeBuilder b)]) = _$Mensaje;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(MensajeBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<Mensaje> get serializer => _$MensajeSerializer();
}

class _$MensajeSerializer implements PrimitiveSerializer<Mensaje> {
  @override
  final Iterable<Type> types = const [Mensaje, _$Mensaje];

  @override
  final String wireName = r'Mensaje';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    Mensaje object, {
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
    Mensaje object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required MensajeBuilder result,
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
  Mensaje deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = MensajeBuilder();
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

