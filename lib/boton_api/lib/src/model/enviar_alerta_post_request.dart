//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:boton_api/src/model/enviar_alerta_post_request_localizacion.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'enviar_alerta_post_request.g.dart';

/// EnviarAlertaPostRequest
///
/// Properties:
/// * [idDispositivo] - El identificador único del dispositivo.
/// * [localizacion] 
/// * [nombreCompleto] - El nombre completo de la persona (opcional).
/// * [matricula] - La matrícula del usuario (opcional).
/// * [numeroTelefono] - Número de teléfono (opcional).
/// * [correoElectronico] - Correo electrónico del usuario (opcional).
@BuiltValue()
abstract class EnviarAlertaPostRequest implements Built<EnviarAlertaPostRequest, EnviarAlertaPostRequestBuilder> {
  /// El identificador único del dispositivo.
  @BuiltValueField(wireName: r'idDispositivo')
  String get idDispositivo;

  @BuiltValueField(wireName: r'localizacion')
  EnviarAlertaPostRequestLocalizacion get localizacion;

  /// El nombre completo de la persona (opcional).
  @BuiltValueField(wireName: r'nombreCompleto')
  String? get nombreCompleto;

  /// La matrícula del usuario (opcional).
  @BuiltValueField(wireName: r'matricula')
  String? get matricula;

  /// Número de teléfono (opcional).
  @BuiltValueField(wireName: r'numeroTelefono')
  String? get numeroTelefono;

  /// Correo electrónico del usuario (opcional).
  @BuiltValueField(wireName: r'correoElectronico')
  String? get correoElectronico;

  EnviarAlertaPostRequest._();

  factory EnviarAlertaPostRequest([void updates(EnviarAlertaPostRequestBuilder b)]) = _$EnviarAlertaPostRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(EnviarAlertaPostRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<EnviarAlertaPostRequest> get serializer => _$EnviarAlertaPostRequestSerializer();
}

class _$EnviarAlertaPostRequestSerializer implements PrimitiveSerializer<EnviarAlertaPostRequest> {
  @override
  final Iterable<Type> types = const [EnviarAlertaPostRequest, _$EnviarAlertaPostRequest];

  @override
  final String wireName = r'EnviarAlertaPostRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    EnviarAlertaPostRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'idDispositivo';
    yield serializers.serialize(
      object.idDispositivo,
      specifiedType: const FullType(String),
    );
    yield r'localizacion';
    yield serializers.serialize(
      object.localizacion,
      specifiedType: const FullType(EnviarAlertaPostRequestLocalizacion),
    );
    if (object.nombreCompleto != null) {
      yield r'nombreCompleto';
      yield serializers.serialize(
        object.nombreCompleto,
        specifiedType: const FullType(String),
      );
    }
    if (object.matricula != null) {
      yield r'matricula';
      yield serializers.serialize(
        object.matricula,
        specifiedType: const FullType(String),
      );
    }
    if (object.numeroTelefono != null) {
      yield r'numeroTelefono';
      yield serializers.serialize(
        object.numeroTelefono,
        specifiedType: const FullType(String),
      );
    }
    if (object.correoElectronico != null) {
      yield r'correoElectronico';
      yield serializers.serialize(
        object.correoElectronico,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    EnviarAlertaPostRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required EnviarAlertaPostRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'idDispositivo':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.idDispositivo = valueDes;
          break;
        case r'localizacion':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(EnviarAlertaPostRequestLocalizacion),
          ) as EnviarAlertaPostRequestLocalizacion;
          result.localizacion.replace(valueDes);
          break;
        case r'nombreCompleto':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.nombreCompleto = valueDes;
          break;
        case r'matricula':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.matricula = valueDes;
          break;
        case r'numeroTelefono':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.numeroTelefono = valueDes;
          break;
        case r'correoElectronico':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.correoElectronico = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  EnviarAlertaPostRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = EnviarAlertaPostRequestBuilder();
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

