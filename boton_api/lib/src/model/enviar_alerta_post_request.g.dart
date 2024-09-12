// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enviar_alerta_post_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$EnviarAlertaPostRequest extends EnviarAlertaPostRequest {
  @override
  final String idDispositivo;
  @override
  final EnviarAlertaPostRequestLocalizacion localizacion;
  @override
  final String? nombreCompleto;
  @override
  final String? matricula;
  @override
  final String? numeroTelefono;
  @override
  final String? correoElectronico;

  factory _$EnviarAlertaPostRequest(
          [void Function(EnviarAlertaPostRequestBuilder)? updates]) =>
      (new EnviarAlertaPostRequestBuilder()..update(updates))._build();

  _$EnviarAlertaPostRequest._(
      {required this.idDispositivo,
      required this.localizacion,
      this.nombreCompleto,
      this.matricula,
      this.numeroTelefono,
      this.correoElectronico})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        idDispositivo, r'EnviarAlertaPostRequest', 'idDispositivo');
    BuiltValueNullFieldError.checkNotNull(
        localizacion, r'EnviarAlertaPostRequest', 'localizacion');
  }

  @override
  EnviarAlertaPostRequest rebuild(
          void Function(EnviarAlertaPostRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EnviarAlertaPostRequestBuilder toBuilder() =>
      new EnviarAlertaPostRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EnviarAlertaPostRequest &&
        idDispositivo == other.idDispositivo &&
        localizacion == other.localizacion &&
        nombreCompleto == other.nombreCompleto &&
        matricula == other.matricula &&
        numeroTelefono == other.numeroTelefono &&
        correoElectronico == other.correoElectronico;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, idDispositivo.hashCode);
    _$hash = $jc(_$hash, localizacion.hashCode);
    _$hash = $jc(_$hash, nombreCompleto.hashCode);
    _$hash = $jc(_$hash, matricula.hashCode);
    _$hash = $jc(_$hash, numeroTelefono.hashCode);
    _$hash = $jc(_$hash, correoElectronico.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EnviarAlertaPostRequest')
          ..add('idDispositivo', idDispositivo)
          ..add('localizacion', localizacion)
          ..add('nombreCompleto', nombreCompleto)
          ..add('matricula', matricula)
          ..add('numeroTelefono', numeroTelefono)
          ..add('correoElectronico', correoElectronico))
        .toString();
  }
}

class EnviarAlertaPostRequestBuilder
    implements
        Builder<EnviarAlertaPostRequest, EnviarAlertaPostRequestBuilder> {
  _$EnviarAlertaPostRequest? _$v;

  String? _idDispositivo;
  String? get idDispositivo => _$this._idDispositivo;
  set idDispositivo(String? idDispositivo) =>
      _$this._idDispositivo = idDispositivo;

  EnviarAlertaPostRequestLocalizacionBuilder? _localizacion;
  EnviarAlertaPostRequestLocalizacionBuilder get localizacion =>
      _$this._localizacion ??= new EnviarAlertaPostRequestLocalizacionBuilder();
  set localizacion(EnviarAlertaPostRequestLocalizacionBuilder? localizacion) =>
      _$this._localizacion = localizacion;

  String? _nombreCompleto;
  String? get nombreCompleto => _$this._nombreCompleto;
  set nombreCompleto(String? nombreCompleto) =>
      _$this._nombreCompleto = nombreCompleto;

  String? _matricula;
  String? get matricula => _$this._matricula;
  set matricula(String? matricula) => _$this._matricula = matricula;

  String? _numeroTelefono;
  String? get numeroTelefono => _$this._numeroTelefono;
  set numeroTelefono(String? numeroTelefono) =>
      _$this._numeroTelefono = numeroTelefono;

  String? _correoElectronico;
  String? get correoElectronico => _$this._correoElectronico;
  set correoElectronico(String? correoElectronico) =>
      _$this._correoElectronico = correoElectronico;

  EnviarAlertaPostRequestBuilder() {
    EnviarAlertaPostRequest._defaults(this);
  }

  EnviarAlertaPostRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _idDispositivo = $v.idDispositivo;
      _localizacion = $v.localizacion.toBuilder();
      _nombreCompleto = $v.nombreCompleto;
      _matricula = $v.matricula;
      _numeroTelefono = $v.numeroTelefono;
      _correoElectronico = $v.correoElectronico;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EnviarAlertaPostRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$EnviarAlertaPostRequest;
  }

  @override
  void update(void Function(EnviarAlertaPostRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EnviarAlertaPostRequest build() => _build();

  _$EnviarAlertaPostRequest _build() {
    _$EnviarAlertaPostRequest _$result;
    try {
      _$result = _$v ??
          new _$EnviarAlertaPostRequest._(
              idDispositivo: BuiltValueNullFieldError.checkNotNull(
                  idDispositivo, r'EnviarAlertaPostRequest', 'idDispositivo'),
              localizacion: localizacion.build(),
              nombreCompleto: nombreCompleto,
              matricula: matricula,
              numeroTelefono: numeroTelefono,
              correoElectronico: correoElectronico);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'localizacion';
        localizacion.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'EnviarAlertaPostRequest', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
