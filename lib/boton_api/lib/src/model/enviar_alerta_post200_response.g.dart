// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enviar_alerta_post200_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$EnviarAlertaPost200Response extends EnviarAlertaPost200Response {
  @override
  final String? token;
  @override
  final String? contenido;

  factory _$EnviarAlertaPost200Response(
          [void Function(EnviarAlertaPost200ResponseBuilder)? updates]) =>
      (new EnviarAlertaPost200ResponseBuilder()..update(updates))._build();

  _$EnviarAlertaPost200Response._({this.token, this.contenido}) : super._();

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
        contenido == other.contenido;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, token.hashCode);
    _$hash = $jc(_$hash, contenido.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EnviarAlertaPost200Response')
          ..add('token', token)
          ..add('contenido', contenido))
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

  String? _contenido;
  String? get contenido => _$this._contenido;
  set contenido(String? contenido) => _$this._contenido = contenido;

  EnviarAlertaPost200ResponseBuilder() {
    EnviarAlertaPost200Response._defaults(this);
  }

  EnviarAlertaPost200ResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _token = $v.token;
      _contenido = $v.contenido;
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
        new _$EnviarAlertaPost200Response._(token: token, contenido: contenido);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
