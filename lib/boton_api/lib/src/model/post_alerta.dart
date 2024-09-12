//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'post_alerta.g.dart';

/// PostAlerta
///
/// Properties:
/// * [mensaje] 
@BuiltValue()
abstract class PostAlerta implements Built<PostAlerta, PostAlertaBuilder> {
  @BuiltValueField(wireName: r'mensaje')
  String? get mensaje;

  PostAlerta._();

  factory PostAlerta([void updates(PostAlertaBuilder b)]) = _$PostAlerta;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PostAlertaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PostAlerta> get serializer => _$PostAlertaSerializer();
}

class _$PostAlertaSerializer implements PrimitiveSerializer<PostAlerta> {
  @override
  final Iterable<Type> types = const [PostAlerta, _$PostAlerta];

  @override
  final String wireName = r'PostAlerta';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PostAlerta object, {
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
    PostAlerta object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PostAlertaBuilder result,
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
  PostAlerta deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PostAlertaBuilder();
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

