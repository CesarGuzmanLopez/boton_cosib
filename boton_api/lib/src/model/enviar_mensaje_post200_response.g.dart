// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enviar_mensaje_post200_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$EnviarMensajePost200Response extends EnviarMensajePost200Response {
  @override
  final String? mensaje;

  factory _$EnviarMensajePost200Response(
          [void Function(EnviarMensajePost200ResponseBuilder)? updates]) =>
      (new EnviarMensajePost200ResponseBuilder()..update(updates))._build();

  _$EnviarMensajePost200Response._({this.mensaje}) : super._();

  @override
  EnviarMensajePost200Response rebuild(
          void Function(EnviarMensajePost200ResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EnviarMensajePost200ResponseBuilder toBuilder() =>
      new EnviarMensajePost200ResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EnviarMensajePost200Response && mensaje == other.mensaje;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, mensaje.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EnviarMensajePost200Response')
          ..add('mensaje', mensaje))
        .toString();
  }
}

class EnviarMensajePost200ResponseBuilder
    implements
        Builder<EnviarMensajePost200Response,
            EnviarMensajePost200ResponseBuilder> {
  _$EnviarMensajePost200Response? _$v;

  String? _mensaje;
  String? get mensaje => _$this._mensaje;
  set mensaje(String? mensaje) => _$this._mensaje = mensaje;

  EnviarMensajePost200ResponseBuilder() {
    EnviarMensajePost200Response._defaults(this);
  }

  EnviarMensajePost200ResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _mensaje = $v.mensaje;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EnviarMensajePost200Response other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$EnviarMensajePost200Response;
  }

  @override
  void update(void Function(EnviarMensajePost200ResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EnviarMensajePost200Response build() => _build();

  _$EnviarMensajePost200Response _build() {
    final _$result =
        _$v ?? new _$EnviarMensajePost200Response._(mensaje: mensaje);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
