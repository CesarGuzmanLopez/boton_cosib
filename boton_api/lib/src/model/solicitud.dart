//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'solicitud.g.dart';

/// Solicitud
///
/// Properties:
/// * [contenido] 
@BuiltValue()
abstract class Solicitud implements Built<Solicitud, SolicitudBuilder> {
  @BuiltValueField(wireName: r'contenido')
  String? get contenido;

  Solicitud._();

  factory Solicitud([void updates(SolicitudBuilder b)]) = _$Solicitud;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SolicitudBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<Solicitud> get serializer => _$SolicitudSerializer();
}

class _$SolicitudSerializer implements PrimitiveSerializer<Solicitud> {
  @override
  final Iterable<Type> types = const [Solicitud, _$Solicitud];

  @override
  final String wireName = r'Solicitud';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    Solicitud object, {
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
    Solicitud object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required SolicitudBuilder result,
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
  Solicitud deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SolicitudBuilder();
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

