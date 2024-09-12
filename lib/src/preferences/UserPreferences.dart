import 'package:boton_cosib/src/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class UserPreferences {
  static const _keyNombreCompleto = 'user_nombreCompleto';
  static const _keyMatricula = 'user_matricula';
  static const _keyNumeroTelefono = 'user_numeroTelefono';
  static const _keyCorreoElectronico = 'user_correoElectronico';

  // Guardar los datos del usuario
  Future<void> saveUser(User user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyNombreCompleto, user.nombreCompleto ?? '');
    await prefs.setString(_keyMatricula, user.matricula ?? '');
    await prefs.setString(_keyNumeroTelefono, user.numeroTelefono ?? '');
    await prefs.setString(_keyCorreoElectronico, user.correoElectronico ?? '');
  }

  // Obtener los datos del usuario
  Future<User> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? nombreCompleto = prefs.getString(_keyNombreCompleto);
    final String? matricula = prefs.getString(_keyMatricula);
    final String? numeroTelefono = prefs.getString(_keyNumeroTelefono);
    final String? correoElectronico = prefs.getString(_keyCorreoElectronico);
    return User(
      nombreCompleto: nombreCompleto,
      matricula: matricula,
      numeroTelefono: numeroTelefono,
      correoElectronico: correoElectronico,
    );
  }

  // Eliminar los datos del usuario
  Future<void> deleteUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyNombreCompleto);
    await prefs.remove(_keyMatricula);
    await prefs.remove(_keyNumeroTelefono);
    await prefs.remove(_keyCorreoElectronico);
  }

  Future<void> estaEnLaUAM(bool isUam) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isUam', isUam);
  }

  Future<bool> getEstaEnLaUAM() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return Future.value(prefs.getBool('isUam') ?? false);
  }

  //guardo el bearer token
  Future<void> saveBearerToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('bearer_token', token);
  }

  //obtener el bearer token
  Future<String?> getBearerToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('bearer_token');
  }

  Future<void> deleteBearerToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('bearer_token');
  }

  Future<String> getIdDispositivo() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final idDispositivo = prefs.getString('id_dispositivo');
    if (idDispositivo == null) {
      final newId = const Uuid().v4();
      await prefs.setString('id_dispositivo', newId);
      return newId;
    }
    return idDispositivo;
  }
}
