//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'reportes_listar_get200_response_inner.g.dart';

/// ReportesListarGet200ResponseInner
///
/// Properties:
/// * [id] 
/// * [descripcion] 
@BuiltValue()
abstract class ReportesListarGet200ResponseInner implements Built<ReportesListarGet200ResponseInner, ReportesListarGet200ResponseInnerBuilder> {
  @BuiltValueField(wireName: r'id')
  String? get id;

  @BuiltValueField(wireName: r'descripcion')
  String? get descripcion;

  ReportesListarGet200ResponseInner._();

  factory ReportesListarGet200ResponseInner([void updates(ReportesListarGet200ResponseInnerBuilder b)]) = _$ReportesListarGet200ResponseInner;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ReportesListarGet200ResponseInnerBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ReportesListarGet200ResponseInner> get serializer => _$ReportesListarGet200ResponseInnerSerializer();
}

class _$ReportesListarGet200ResponseInnerSerializer implements PrimitiveSerializer<ReportesListarGet200ResponseInner> {
  @override
  final Iterable<Type> types = const [ReportesListarGet200ResponseInner, _$ReportesListarGet200ResponseInner];

  @override
  final String wireName = r'ReportesListarGet200ResponseInner';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ReportesListarGet200ResponseInner object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(String),
      );
    }
    if (object.descripcion != null) {
      yield r'descripcion';
      yield serializers.serialize(
        object.descripcion,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ReportesListarGet200ResponseInner object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ReportesListarGet200ResponseInnerBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.id = valueDes;
          break;
        case r'descripcion':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.descripcion = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ReportesListarGet200ResponseInner deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ReportesListarGet200ResponseInnerBuilder();
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

