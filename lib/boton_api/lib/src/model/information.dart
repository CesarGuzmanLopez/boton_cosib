//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'information.g.dart';

/// Information
///
/// Properties:
/// * [body] 
@BuiltValue()
abstract class Information implements Built<Information, InformationBuilder> {
  @BuiltValueField(wireName: r'body')
  String? get body;

  Information._();

  factory Information([void updates(InformationBuilder b)]) = _$Information;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(InformationBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<Information> get serializer => _$InformationSerializer();
}

class _$InformationSerializer implements PrimitiveSerializer<Information> {
  @override
  final Iterable<Type> types = const [Information, _$Information];

  @override
  final String wireName = r'Information';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    Information object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.body != null) {
      yield r'body';
      yield serializers.serialize(
        object.body,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    Information object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required InformationBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'body':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.body = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  Information deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = InformationBuilder();
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

