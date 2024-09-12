import 'dart:async';

import 'package:boton_cosib/src/model/alertType.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BotonPreferences {
  static const _keyBotonPresionado = 'boton_presionado';
  static const _keyFechaPresionado = 'fecha_presionado';
  static const _durationLimit = Duration(hours: 6); // Límite de 6 horas

  // Guardar el estado del botón junto con la fecha y hora actual
  Future<void> setBotonPresionado(
      {bool isPressed = true, bool isUAM = false}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyBotonPresionado, isPressed);
    await prefs.setBool('isUAM', isUAM);
    if (isPressed) {
      final int currentTime = DateTime.now().millisecondsSinceEpoch;
      await prefs.setInt(_keyFechaPresionado, currentTime);
    } else {
      await prefs.remove(_keyFechaPresionado);
    }
  }

  // Obtener el estado del botón, verificando si pasaron más de 6 horas
  Future<bool> isBotonPresionado() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool? isPressed = prefs.getBool(_keyBotonPresionado);
    final int? timestamp = prefs.getInt(_keyFechaPresionado);

    if (isPressed == true && timestamp != null) {
      // Calcular la diferencia de tiempo actual con la fecha guardada
      final DateTime presionadoFecha =
          DateTime.fromMillisecondsSinceEpoch(timestamp);
      final DateTime now = DateTime.now();

      if (now.difference(presionadoFecha) > _durationLimit) {
        // Si pasaron más de 6 horas, reiniciar el estado
        await deleteBotonState();
        return false;
      }
      return true;
    }
    return false; // Si no hay datos guardados, el botón no fue presionado
  }

  // Eliminar el estado del botón y la fecha
  Future<void> deleteBotonState() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyBotonPresionado);
    await prefs.remove(_keyFechaPresionado);
  }

  Future<void> setTipoAlerta(AlertButtonType? type) async {
    //si es null, no se guarda nada
    if (type == null) {
      return;
    }
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('tipo_alerta', type.toString());
  }

  Future<AlertButtonType?> getTipoAlerta() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? tipoAlerta = prefs.getString('tipo_alerta');
    if (tipoAlerta != null) {
      return AlertButtonType.values
          .firstWhere((element) => element.toString() == tipoAlerta);
    } else {
      return null;
    }
  }

  //Eliminar todos los datos menos el uuid
  Future<void> deleteAllData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyBotonPresionado);
    await prefs.remove(_keyFechaPresionado);
    await prefs.remove('isUAM');
    await prefs.remove('tipo_alerta');
  }

  setVideoPath(String filePath) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('video_path', filePath);
  }

  getVideoPath() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('video_path');
  }
}
