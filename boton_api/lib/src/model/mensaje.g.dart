// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mensaje.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Mensaje extends Mensaje {
  @override
  final String? contenido;

  factory _$Mensaje([void Function(MensajeBuilder)? updates]) =>
      (new MensajeBuilder()..update(updates))._build();

  _$Mensaje._({this.contenido}) : super._();

  @override
  Mensaje rebuild(void Function(MensajeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MensajeBuilder toBuilder() => new MensajeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Mensaje && contenido == other.contenido;
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
    return (newBuiltValueToStringHelper(r'Mensaje')
          ..add('contenido', contenido))
        .toString();
  }
}

class MensajeBuilder implements Builder<Mensaje, MensajeBuilder> {
  _$Mensaje? _$v;

  String? _contenido;
  String? get contenido => _$this._contenido;
  set contenido(String? contenido) => _$this._contenido = contenido;

  MensajeBuilder() {
    Mensaje._defaults(this);
  }

  MensajeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _contenido = $v.contenido;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Mensaje other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Mensaje;
  }

  @override
  void update(void Function(MensajeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Mensaje build() => _build();

  _$Mensaje _build() {
    final _$result = _$v ?? new _$Mensaje._(contenido: contenido);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
