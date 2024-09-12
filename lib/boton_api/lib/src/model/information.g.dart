// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'information.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Information extends Information {
  @override
  final String? body;

  factory _$Information([void Function(InformationBuilder)? updates]) =>
      (new InformationBuilder()..update(updates))._build();

  _$Information._({this.body}) : super._();

  @override
  Information rebuild(void Function(InformationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InformationBuilder toBuilder() => new InformationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Information && body == other.body;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, body.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Information')..add('body', body))
        .toString();
  }
}

class InformationBuilder implements Builder<Information, InformationBuilder> {
  _$Information? _$v;

  String? _body;
  String? get body => _$this._body;
  set body(String? body) => _$this._body = body;

  InformationBuilder() {
    Information._defaults(this);
  }

  InformationBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _body = $v.body;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Information other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Information;
  }

  @override
  void update(void Function(InformationBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Information build() => _build();

  _$Information _build() {
    final _$result = _$v ?? new _$Information._(body: body);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
