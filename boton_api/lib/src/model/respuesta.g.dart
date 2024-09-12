// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'respuesta.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Respuesta extends Respuesta {
  @override
  final String? token;
  @override
  final String? contenido;

  factory _$Respuesta([void Function(RespuestaBuilder)? updates]) =>
      (new RespuestaBuilder()..update(updates))._build();

  _$Respuesta._({this.token, this.contenido}) : super._();

  @override
  Respuesta rebuild(void Function(RespuestaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RespuestaBuilder toBuilder() => new RespuestaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Respuesta &&
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
    return (newBuiltValueToStringHelper(r'Respuesta')
          ..add('token', token)
          ..add('contenido', contenido))
        .toString();
  }
}

class RespuestaBuilder implements Builder<Respuesta, RespuestaBuilder> {
  _$Respuesta? _$v;

  String? _token;
  String? get token => _$this._token;
  set token(String? token) => _$this._token = token;

  String? _contenido;
  String? get contenido => _$this._contenido;
  set contenido(String? contenido) => _$this._contenido = contenido;

  RespuestaBuilder() {
    Respuesta._defaults(this);
  }

  RespuestaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _token = $v.token;
      _contenido = $v.contenido;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Respuesta other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Respuesta;
  }

  @override
  void update(void Function(RespuestaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Respuesta build() => _build();

  _$Respuesta _build() {
    final _$result =
        _$v ?? new _$Respuesta._(token: token, contenido: contenido);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
