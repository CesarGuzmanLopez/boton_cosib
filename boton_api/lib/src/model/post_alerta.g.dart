// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_alerta.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PostAlerta extends PostAlerta {
  @override
  final String? mensaje;

  factory _$PostAlerta([void Function(PostAlertaBuilder)? updates]) =>
      (new PostAlertaBuilder()..update(updates))._build();

  _$PostAlerta._({this.mensaje}) : super._();

  @override
  PostAlerta rebuild(void Function(PostAlertaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PostAlertaBuilder toBuilder() => new PostAlertaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PostAlerta && mensaje == other.mensaje;
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
    return (newBuiltValueToStringHelper(r'PostAlerta')..add('mensaje', mensaje))
        .toString();
  }
}

class PostAlertaBuilder implements Builder<PostAlerta, PostAlertaBuilder> {
  _$PostAlerta? _$v;

  String? _mensaje;
  String? get mensaje => _$this._mensaje;
  set mensaje(String? mensaje) => _$this._mensaje = mensaje;

  PostAlertaBuilder() {
    PostAlerta._defaults(this);
  }

  PostAlertaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _mensaje = $v.mensaje;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PostAlerta other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PostAlerta;
  }

  @override
  void update(void Function(PostAlertaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PostAlerta build() => _build();

  _$PostAlerta _build() {
    final _$result = _$v ?? new _$PostAlerta._(mensaje: mensaje);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
