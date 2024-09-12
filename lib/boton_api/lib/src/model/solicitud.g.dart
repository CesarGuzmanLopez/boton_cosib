// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'solicitud.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Solicitud extends Solicitud {
  @override
  final String? contenido;

  factory _$Solicitud([void Function(SolicitudBuilder)? updates]) =>
      (new SolicitudBuilder()..update(updates))._build();

  _$Solicitud._({this.contenido}) : super._();

  @override
  Solicitud rebuild(void Function(SolicitudBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SolicitudBuilder toBuilder() => new SolicitudBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Solicitud && contenido == other.contenido;
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
    return (newBuiltValueToStringHelper(r'Solicitud')
          ..add('contenido', contenido))
        .toString();
  }
}

class SolicitudBuilder implements Builder<Solicitud, SolicitudBuilder> {
  _$Solicitud? _$v;

  String? _contenido;
  String? get contenido => _$this._contenido;
  set contenido(String? contenido) => _$this._contenido = contenido;

  SolicitudBuilder() {
    Solicitud._defaults(this);
  }

  SolicitudBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _contenido = $v.contenido;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Solicitud other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Solicitud;
  }

  @override
  void update(void Function(SolicitudBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Solicitud build() => _build();

  _$Solicitud _build() {
    final _$result = _$v ?? new _$Solicitud._(contenido: contenido);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
