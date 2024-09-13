import 'package:boton_api/boton_api.dart';
import 'package:boton_cosib/src/model/alertType.dart';
import 'package:boton_cosib/src/preferences/BotonPreferences.dart';
import 'package:boton_cosib/src/preferences/UserPreferences.dart';
import 'package:cross_file/cross_file.dart' as cross_file;
import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';

class AlertService {
  AlertService({required this.botonApi}) {
    apiService = botonApi.getDefaultApi();
  }

  final BotonApi botonApi;
  final BotonPreferences _botonPreferences = BotonPreferences();
  final UserPreferences _userPreferences = UserPreferences();
  late DefaultApi apiService;

  static const int successStatusCode = 200;

  /// Verifica la conexión a internet mediante una llamada a la API.
  Future<bool> verificarConexion() async {
    try {
      final respuesta = await apiService.checarComunicacionGet();
      //obtengo la localizacion
      await _getLocation();
      return respuesta.statusCode == successStatusCode;
    } catch (e) {
      return false;
    }
  }

  /// Enviar alerta con la información del usuario y su localización.
  Future<void> enviarAlerta() async {
    try {
      final user = await _userPreferences.getUser();
      _botonPreferences.setBotonPresionado(isPressed: true);

      final position = await _getLocation();

      final localizacion = EnviarAlertaPostRequestLocalizacion((b) => b
        ..latitude = position.latitude
        ..longitude = position.longitude
        ..altitude = position.altitude
        ..accuracy = position.accuracy
        ..altitudeAccuracy = position.altitudeAccuracy
        ..heading = position.heading
        ..speed = position.speed);

      final id = await _userPreferences.getIdDispositivo();

      final alerta = EnviarAlertaPostRequest((b) => b
        ..idDispositivo = id
        ..localizacion = localizacion.toBuilder()
        ..nombreCompleto = user.nombreCompleto
        ..matricula = user.matricula
        ..numeroTelefono = user.numeroTelefono
        ..correoElectronico = user.correoElectronico);

      final respuesta =
          await apiService.enviarAlertaPost(enviarAlertaPostRequest: alerta);

      if (respuesta.data != null) {
        await _userPreferences.saveBearerToken(respuesta.data!.token ?? "");
        await _userPreferences.estaEnLaUAM(respuesta.data!.uam ?? false);
      } else {
        throw Exception("El token es nulo");
      }
    } catch (e) {
      await _handleError(e);
      throw Exception("Error al enviar la alerta: $e");
    }
  }

  /// Verifica si el usuario se encuentra en la UAM.
  Future<bool> isUAM() async {
    return await _userPreferences.getEstaEnLaUAM();
  }

  /// Cancela una alerta activa y elimina el token.
  Future<void> cancelarAlerta() async {
    try {
      final authorization = await _userPreferences.getBearerToken();
      if (authorization == null) {
        throw Exception("No se ha guardado el token de autorización.");
      }

      final enviarMensajePostRequest = EnviarMensajePostRequest((b) =>
          b..contenido = "Solicitud de cancelación de alerta de emergencia");

      await apiService.enviarMensajePost(
        authorization: authorization,
        enviarMensajePostRequest: enviarMensajePostRequest,
      );

      _botonPreferences.setBotonPresionado(isPressed: false);
    } catch (e) {
      throw Exception("Error al cancelar la alerta: $e");
    } finally {
      await _clearData();
      //redirect to home
    }
  }

  /// Envía la ubicación manualmente.
  Future<void> enviarUbicacion(String ubicacion) async {
    await _enviarMensaje("Actualización de ubicación manual: $ubicacion");
  }

  /// Define el tipo de alerta seleccionado por el usuario.
  Future<void> tipoAlerta(AlertButtonType type) async {
    _botonPreferences.setTipoAlerta(type);
    await _enviarMensaje("Alerta de tipo: ${type.label}");
  }

  /// Obtiene la ubicación actual del dispositivo.
  Future<Position> _getLocation() async {
    if (!await Geolocator.isLocationServiceEnabled()) {
      throw Exception("Los servicios de ubicación están deshabilitados.");
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception("Permisos de ubicación denegados.");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception(
          "Permisos de ubicación denegados permanentemente. Habilítalos desde la configuración.");
    }

    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future<void> sendAlertaFoto(cross_file.XFile photo) async {
    await _sendFile(photo, apiService.enviarFotoPost);
  }

  Future<void> sendAlertaVideo(cross_file.XFile video) async {
    await _sendFile(video, apiService.enviarVideoPost);
  }

  Future<void> sendMoreInfo(String text) async {
    await _enviarMensaje(text);
  }

  Future<void> _enviarMensaje(String contenido) async {
    try {
      final authorization = await _userPreferences.getBearerToken();
      if (authorization == null) {
        throw Exception("No se ha guardado el token de autorización.");
      }

      final enviarMensajePostRequest = EnviarMensajePostRequest(
        (b) => b..contenido = contenido,
      );

      await apiService.enviarMensajePost(
        authorization: authorization,
        enviarMensajePostRequest: enviarMensajePostRequest,
      );
    } catch (e) {
      throw Exception("Error al enviar el mensaje: $e");
    }
  }

  Future<void> _sendFile(
      cross_file.XFile file,
      Future<Response> Function(
              {required String authorization, required MultipartFile body})
          apiMethod) async {
    try {
      final authorization = await _userPreferences.getBearerToken();
      if (authorization == null) {
        throw Exception("No se ha guardado el token de autorización.");
      }

      final multipartFile =
          await MultipartFile.fromFile(file.path, filename: file.name);
      await apiMethod(authorization: authorization, body: multipartFile);
    } catch (e) {
      await _handleError(e);
      throw Exception("Error al enviar el archivo: $e");
    }
  }

  Future<void> _handleError(Object e) async {
    await _clearData();
    // Log the error if needed
  }

  Future<void> _clearData() async {
    _botonPreferences.setBotonPresionado(isPressed: false);
    await _userPreferences.deleteBearerToken();
    await _botonPreferences.deleteAllData();
  }
}
