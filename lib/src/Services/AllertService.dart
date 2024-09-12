import 'package:boton_cosib/boton_api/lib/src/api.dart';
import 'package:boton_cosib/boton_api/lib/src/api/default_api.dart';
import 'package:boton_cosib/boton_api/lib/src/model/enviar_mensaje_post_request.dart';
import 'package:dio/dio.dart';

class Alertservice {
  Alertservice({required this.botonApi});
  final BotonApi botonApi;
  // Método para verificar la conexión a Internet
  Future<bool> verificarConexion() async {
    DefaultApi api = botonApi.getDefaultApi();
    Response<EnviarMensajePostRequest> respuesta =
        await api.checarComunicacionGet();
    return respuesta.statusCode == 200;
  }

  void enviarAlerta() {}
  void enviarAlertaFueraUAM() {}
  void cancelarAlerta() {}
  //funcion que verifica si esta adentro de la UAM
  Future<bool> verificarUbicacionUAM() async {
    return true;
  }
}
