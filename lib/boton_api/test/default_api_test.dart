import 'package:test/test.dart';
import 'package:boton_api/boton_api.dart';


/// tests for DefaultApi
void main() {
  final instance = BotonApi().getDefaultApi();

  group(DefaultApi, () {
    // Verificar la comunicación
    //
    // Endpoint para checar si hay comunicación con el servicio.
    //
    //Future<EnviarMensajePostRequest> checarComunicacionGet() async
    test('test checarComunicacionGet', () async {
      // TODO
    });

    // Enviar una alerta
    //
    // Envía una alerta con el `idDispositivo` y la `localizacion`, otros campos son opcionales.
    //
    //Future<EnviarAlertaPost200Response> enviarAlertaPost(EnviarAlertaPostRequest enviarAlertaPostRequest) async
    test('test enviarAlertaPost', () async {
      // TODO
    });

    // Enviar un audio
    //
    // Envía un archivo de audio al servicio de Telegram.
    //
    //Future<EnviarMensajePost200Response> enviarAudioPost(String authorization, MultipartFile body) async
    test('test enviarAudioPost', () async {
      // TODO
    });

    // Enviar una foto
    //
    // Envía una foto a través del servicio de Telegram.
    //
    //Future<EnviarMensajePost200Response> enviarFotoPost(String authorization, MultipartFile body) async
    test('test enviarFotoPost', () async {
      // TODO
    });

    // Enviar un mensaje
    //
    // Envía un mensaje de texto al servicio de Telegram.
    //
    //Future<EnviarMensajePost200Response> enviarMensajePost(String authorization, EnviarMensajePostRequest enviarMensajePostRequest) async
    test('test enviarMensajePost', () async {
      // TODO
    });

    // Enviar un video
    //
    // Envía un video a través del servicio de Telegram.
    //
    //Future<EnviarMensajePost200Response> enviarVideoPost(String authorization, MultipartFile body) async
    test('test enviarVideoPost', () async {
      // TODO
    });

    // Listar todos los reportes
    //
    // Devuelve una lista de todos los reportes.
    //
    //Future<BuiltList<ReportesListarGet200ResponseInner>> reportesListarGet() async
    test('test reportesListarGet', () async {
      // TODO
    });

    // Obtener un reporte por ID
    //
    // Devuelve un reporte específico basado en su ID.
    //
    //Future<ReportesListarGet200ResponseInner> reportesObtenerIdGet(String id) async
    test('test reportesObtenerIdGet', () async {
      // TODO
    });

  });
}
