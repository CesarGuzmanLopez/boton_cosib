// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enviar_mensaje_post_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$EnviarMensajePostRequest extends EnviarMensajePostRequest {
  @override
  final String? contenido;

  factory _$EnviarMensajePostRequest(
          [void Function(EnviarMensajePostRequestBuilder)? updates]) =>
      (new EnviarMensajePostRequestBuilder()..update(updates))._build();

  _$EnviarMensajePostRequest._({this.contenido}) : super._();

  @override
  EnviarMensajePostRequest rebuild(
          void Function(EnviarMensajePostRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EnviarMensajePostRequestBuilder toBuilder() =>
      new EnviarMensajePostRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EnviarMensajePostRequest && contenido == other.contenido;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, contenido.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EnviarMensajePostRequest')
          ..add('contenido', contenido))
        .toString();
  }
}

class EnviarMensajePostRequestBuilder
    implements
        Builder<EnviarMensajePostRequest, EnviarMensajePostRequestBuilder> {
  _$EnviarMensajePostRequest? _$v;

  String? _contenido;
  String? get contenido => _$this._contenido;
  set contenido(String? contenido) => _$this._contenido = contenido;

  EnviarMensajePostRequestBuilder() {
    EnviarMensajePostRequest._defaults(this);
  }

  EnviarMensajePostRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _contenido = $v.contenido;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EnviarMensajePostRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$EnviarMensajePostRequest;
  }

  @override
  void update(void Function(EnviarMensajePostRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EnviarMensajePostRequest build() => _build();

  _$EnviarMensajePostRequest _build() {
    final _$result =
        _$v ?? new _$EnviarMensajePostRequest._(contenido: contenido);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
