// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reporte.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Reporte extends Reporte {
  @override
  final String? id;
  @override
  final String? descripcion;

  factory _$Reporte([void Function(ReporteBuilder)? updates]) =>
      (new ReporteBuilder()..update(updates))._build();

  _$Reporte._({this.id, this.descripcion}) : super._();

  @override
  Reporte rebuild(void Function(ReporteBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReporteBuilder toBuilder() => new ReporteBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Reporte &&
        id == other.id &&
        descripcion == other.descripcion;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, descripcion.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Reporte')
          ..add('id', id)
          ..add('descripcion', descripcion))
        .toString();
  }
}

class ReporteBuilder implements Builder<Reporte, ReporteBuilder> {
  _$Reporte? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _descripcion;
  String? get descripcion => _$this._descripcion;
  set descripcion(String? descripcion) => _$this._descripcion = descripcion;

  ReporteBuilder() {
    Reporte._defaults(this);
  }

  ReporteBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _descripcion = $v.descripcion;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Reporte other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Reporte;
  }

  @override
  void update(void Function(ReporteBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Reporte build() => _build();

  _$Reporte _build() {
    final _$result = _$v ?? new _$Reporte._(id: id, descripcion: descripcion);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
