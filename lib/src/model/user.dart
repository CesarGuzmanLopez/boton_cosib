class User {
  final String? nombreCompleto;
  final String? matricula;
  final String? numeroTelefono;
  final String? correoElectronico;

  User({
    this.nombreCompleto,
    this.matricula,
    this.numeroTelefono,
    this.correoElectronico,
  });

  Map<String, dynamic> toMap() {
    return {
      'nombreCompleto': nombreCompleto,
      'matricula': matricula,
      'numeroTelefono': numeroTelefono,
      'correoElectronico': correoElectronico,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      nombreCompleto: map['nombreCompleto'],
      matricula: map['matricula'],
      numeroTelefono: map['numeroTelefono'],
      correoElectronico: map['correoElectronico'],
    );
  }

  /// Crea una copia del objeto `User`, permitiendo la modificación de campos específicos.
  User copyWith({
    String? nombreCompleto,
    String? matricula,
    String? numeroTelefono,
    String? correoElectronico,
  }) {
    return User(
      nombreCompleto: nombreCompleto ?? this.nombreCompleto,
      matricula: matricula ?? this.matricula,
      numeroTelefono: numeroTelefono ?? this.numeroTelefono,
      correoElectronico: correoElectronico ?? this.correoElectronico,
    );
  }
}
