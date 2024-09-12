// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reportes_listar_get200_response_inner.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ReportesListarGet200ResponseInner
    extends ReportesListarGet200ResponseInner {
  @override
  final String? id;
  @override
  final String? descripcion;

  factory _$ReportesListarGet200ResponseInner(
          [void Function(ReportesListarGet200ResponseInnerBuilder)? updates]) =>
      (new ReportesListarGet200ResponseInnerBuilder()..update(updates))
          ._build();

  _$ReportesListarGet200ResponseInner._({this.id, this.descripcion})
      : super._();

  @override
  ReportesListarGet200ResponseInner rebuild(
          void Function(ReportesListarGet200ResponseInnerBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReportesListarGet200ResponseInnerBuilder toBuilder() =>
      new ReportesListarGet200ResponseInnerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReportesListarGet200ResponseInner &&
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
    return (newBuiltValueToStringHelper(r'ReportesListarGet200ResponseInner')
          ..add('id', id)
          ..add('descripcion', descripcion))
        .toString();
  }
}

class ReportesListarGet200ResponseInnerBuilder
    implements
        Builder<ReportesListarGet200ResponseInner,
            ReportesListarGet200ResponseInnerBuilder> {
  _$ReportesListarGet200ResponseInner? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _descripcion;
  String? get descripcion => _$this._descripcion;
  set descripcion(String? descripcion) => _$this._descripcion = descripcion;

  ReportesListarGet200ResponseInnerBuilder() {
    ReportesListarGet200ResponseInner._defaults(this);
  }

  ReportesListarGet200ResponseInnerBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _descripcion = $v.descripcion;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ReportesListarGet200ResponseInner other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ReportesListarGet200ResponseInner;
  }

  @override
  void update(
      void Function(ReportesListarGet200ResponseInnerBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ReportesListarGet200ResponseInner build() => _build();

  _$ReportesListarGet200ResponseInner _build() {
    final _$result = _$v ??
        new _$ReportesListarGet200ResponseInner._(
            id: id, descripcion: descripcion);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
