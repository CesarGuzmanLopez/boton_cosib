import 'package:boton_api/boton_api.dart';
import 'package:boton_cosib/src/model/alertType.dart';
import 'package:boton_cosib/src/model/user.dart';
import 'package:boton_cosib/src/preferences/BotonPreferences.dart';
import 'package:boton_cosib/src/preferences/UserPreferences.dart';
import 'package:geolocator/geolocator.dart';

class Alertservice {
  Alertservice({required this.botonApi}) {
    apiService = botonApi.getDefaultApi();
  }

  final BotonApi botonApi;
  final BotonPreferences _botonPreferences = BotonPreferences();
  final UserPreferences _userPreferences = UserPreferences();
  late DefaultApi apiService;

  /// Verifica si hay conexión a internet mediante una llamada a la API.
  Future<bool> verificarConexion() async {
    try {
      final respuesta = await apiService.checarComunicacionGet();
      // Se verifica si la respuesta tiene éxito.
      return respuesta.statusCode == 200;
    } catch (e) {
      // En caso de error, se retorna `false`.
      return false;
    }
  }

  /// Enviar alerta con la información del usuario y su localización.
  Future<void> enviarAlerta() async {
    try {
      final User user = await _userPreferences.getUser();
      _botonPreferences.setBotonPresionado(isPressed: true);

      final Position position = await _getLocation();

      final localizacion = EnviarAlertaPostRequestLocalizacion((b) => b
        ..latitude = position.latitude
        ..longitude = position.longitude
        ..altitude = position.altitude
        ..accuracy = position.accuracy
        ..altitudeAccuracy = position.altitudeAccuracy
        ..heading = position.heading
        ..speed = position.speed);

      final String id = await _userPreferences.getIdDispositivo();

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
      _botonPreferences.setBotonPresionado(isPressed: false);
      throw Exception("Error al enviar la alerta: $e");
    }
  }

  /// Verifica si el usuario se encuentra en la UAM.
  Future<bool> isUAM() async {
    return await _userPreferences.getEstaEnLaUAM();
  }

  /// Cancelar una alerta activa y eliminar el token.
  Future<void> cancelarAlerta() async {
    try {
      final String? authorization = await _userPreferences.getBearerToken();
      if (authorization == null) {
        throw Exception("No se ha guardado el token de autorización.");
      }

      final enviarMensajePostRequest = EnviarMensajePostRequest((b) =>
          b..contenido = "Solicitud de cancelación de alerta de emergencia");

      await apiService.enviarMensajePost(
        authorization: authorization,
        enviarMensajePostRequest: enviarMensajePostRequest,
      );

      await _userPreferences.deleteBearerToken();
      await _botonPreferences.deleteAllData();
      _botonPreferences.setBotonPresionado(isPressed: false);
    } catch (e) {
      throw Exception("Error al cancelar la alerta: $e");
    }
  }

  /// Envía la ubicación manualmente.
  Future<void> enviarUbicacion(String ubicacion) async {
    try {
      final String? authorization = await _userPreferences.getBearerToken();
      if (authorization == null) {
        throw Exception("No se ha guardado el token de autorización.");
      }

      final enviarMensajePostRequest = EnviarMensajePostRequest(
        (b) => b..contenido = "Actualización de ubicación manual: $ubicacion",
      );

      await apiService.enviarMensajePost(
        authorization: authorization,
        enviarMensajePostRequest: enviarMensajePostRequest,
      );
    } catch (e) {
      throw Exception("Error al enviar la ubicación: $e");
    }
  }

  /// Define el tipo de alerta seleccionado por el usuario.
  Future<void> tipoAlerta(AlertButtonType type) async {
    try {
      final String? authorization = await _userPreferences.getBearerToken();
      if (authorization == null) {
        throw Exception("No se ha guardado el token de autorización.");
      }

      _botonPreferences.setTipoAlerta(type);

      final enviarMensajePostRequest = EnviarMensajePostRequest(
        (b) => b..contenido = "Alerta de tipo: ${type.label}",
      );

      await apiService.enviarMensajePost(
        authorization: authorization,
        enviarMensajePostRequest: enviarMensajePostRequest,
      );
    } catch (e) {
      throw Exception("Error al enviar el tipo de alerta: $e");
    }
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
}
