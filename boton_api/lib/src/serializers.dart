//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_import

import 'package:one_of_serializer/any_of_serializer.dart';
import 'package:one_of_serializer/one_of_serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:boton_api/src/date_serializer.dart';
import 'package:boton_api/src/model/date.dart';

import 'package:boton_api/src/model/enviar_alerta_post200_response.dart';
import 'package:boton_api/src/model/enviar_alerta_post_request.dart';
import 'package:boton_api/src/model/enviar_alerta_post_request_localizacion.dart';
import 'package:boton_api/src/model/enviar_mensaje_post200_response.dart';
import 'package:boton_api/src/model/enviar_mensaje_post_request.dart';
import 'package:boton_api/src/model/information.dart';
import 'package:boton_api/src/model/mensaje.dart';
import 'package:boton_api/src/model/messages.dart';
import 'package:boton_api/src/model/post_alerta.dart';
import 'package:boton_api/src/model/reporte.dart';
import 'package:boton_api/src/model/reportes_listar_get200_response_inner.dart';
import 'package:boton_api/src/model/respuesta.dart';
import 'package:boton_api/src/model/solicitud.dart';
import 'package:boton_api/src/model/solicitud_alerta.dart';

part 'serializers.g.dart';

@SerializersFor([
  EnviarAlertaPost200Response,
  EnviarAlertaPostRequest,
  EnviarAlertaPostRequestLocalizacion,
  EnviarMensajePost200Response,
  EnviarMensajePostRequest,
  Information,
  Mensaje,
  Messages,
  PostAlerta,
  Reporte,
  ReportesListarGet200ResponseInner,
  Respuesta,
  Solicitud,
  SolicitudAlerta,
])
Serializers serializers = (_$serializers.toBuilder()
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(ReportesListarGet200ResponseInner)]),
        () => ListBuilder<ReportesListarGet200ResponseInner>(),
      )
      ..add(const OneOfSerializer())
      ..add(const AnyOfSerializer())
      ..add(const DateSerializer())
      ..add(Iso8601DateTimeSerializer()))
    .build();

Serializers standardSerializers =
    (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
