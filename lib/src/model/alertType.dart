import 'package:flutter/material.dart';

enum AlertButtonType {
  Medica,
  Seguridad,
  ViolenciaGenero,
  Otra,
}

extension AlertButtonTypeExtension on AlertButtonType {
  String get label {
    switch (this) {
      case AlertButtonType.Medica:
        return 'Médica';
      case AlertButtonType.Seguridad:
        return 'Seguridad';
      case AlertButtonType.ViolenciaGenero:
        return 'Violencia de Género';
      case AlertButtonType.Otra:
        return 'Otra';
    }
  }

  IconData get icon {
    switch (this) {
      case AlertButtonType.Medica:
        return Icons.local_hospital;
      case AlertButtonType.Seguridad:
        return Icons.security;
      case AlertButtonType.ViolenciaGenero:
        return Icons.wc;
      case AlertButtonType.Otra:
        return Icons.more_horiz;
    }
  }
}
