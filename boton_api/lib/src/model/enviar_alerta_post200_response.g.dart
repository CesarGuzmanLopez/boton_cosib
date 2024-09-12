// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enviar_alerta_post200_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$EnviarAlertaPost200Response extends EnviarAlertaPost200Response {
  @override
  final String? token;
  @override
  final num? idMensaje;
  @override
  final DateTime? horaEnvio;
  @override
  final bool? uam;

  factory _$EnviarAlertaPost200Response(
          [void Function(EnviarAlertaPost200ResponseBuilder)? updates]) =>
      (new EnviarAlertaPost200ResponseBuilder()..update(updates))._build();

  _$EnviarAlertaPost200Response._(
      {this.token, this.idMensaje, this.horaEnvio, this.uam})
      : super._();

  @override
  EnviarAlertaPost200Response rebuild(
          void Function(EnviarAlertaPost200ResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EnviarAlertaPost200ResponseBuilder toBuilder() =>
      new EnviarAlertaPost200ResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EnviarAlertaPost200Response &&
        token == other.token &&
        idMensaje == other.idMensaje &&
        horaEnvio == other.horaEnvio &&
        uam == other.uam;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, token.hashCode);
    _$hash = $jc(_$hash, idMensaje.hashCode);
    _$hash = $jc(_$hash, horaEnvio.hashCode);
    _$hash = $jc(_$hash, uam.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EnviarAlertaPost200Response')
          ..add('token', token)
          ..add('idMensaje', idMensaje)
          ..add('horaEnvio', horaEnvio)
          ..add('uam', uam))
        .toString();
  }
}

class EnviarAlertaPost200ResponseBuilder
    implements
        Builder<EnviarAlertaPost200Response,
            EnviarAlertaPost200ResponseBuilder> {
  _$EnviarAlertaPost200Response? _$v;

  String? _token;
  String? get token => _$this._token;
  set token(String? token) => _$this._token = token;

  num? _idMensaje;
  num? get idMensaje => _$this._idMensaje;
  set idMensaje(num? idMensaje) => _$this._idMensaje = idMensaje;

  DateTime? _horaEnvio;
  DateTime? get horaEnvio => _$this._horaEnvio;
  set horaEnvio(DateTime? horaEnvio) => _$this._horaEnvio = horaEnvio;

  bool? _uam;
  bool? get uam => _$this._uam;
  set uam(bool? uam) => _$this._uam = uam;

  EnviarAlertaPost200ResponseBuilder() {
    EnviarAlertaPost200Response._defaults(this);
  }

  EnviarAlertaPost200ResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _token = $v.token;
      _idMensaje = $v.idMensaje;
      _horaEnvio = $v.horaEnvio;
      _uam = $v.uam;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EnviarAlertaPost200Response other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$EnviarAlertaPost200Response;
  }

  @override
  void update(void Function(EnviarAlertaPost200ResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EnviarAlertaPost200Response build() => _build();

  _$EnviarAlertaPost200Response _build() {
    final _$result = _$v ??
        new _$EnviarAlertaPost200Response._(
            token: token, idMensaje: idMensaje, horaEnvio: horaEnvio, uam: uam);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
