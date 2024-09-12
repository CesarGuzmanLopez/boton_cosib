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
    return false; // Si no hay datos, el botón no fue presionado
  }

  // Eliminar el estado del botón y la fecha
  Future<void> deleteBotonState() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyBotonPresionado);
    await prefs.remove(_keyFechaPresionado);
  }

  Future<bool> isUAM() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool? isUAM = prefs.getBool('isUAM');
    return isUAM ?? false;
  }
}
