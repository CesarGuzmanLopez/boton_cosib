// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'messages.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Messages extends Messages {
  @override
  final String? body;

  factory _$Messages([void Function(MessagesBuilder)? updates]) =>
      (new MessagesBuilder()..update(updates))._build();

  _$Messages._({this.body}) : super._();

  @override
  Messages rebuild(void Function(MessagesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MessagesBuilder toBuilder() => new MessagesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Messages && body == other.body;
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
    return (newBuiltValueToStringHelper(r'Messages')..add('body', body))
        .toString();
  }
}

class MessagesBuilder implements Builder<Messages, MessagesBuilder> {
  _$Messages? _$v;

  String? _body;
  String? get body => _$this._body;
  set body(String? body) => _$this._body = body;

  MessagesBuilder() {
    Messages._defaults(this);
  }

  MessagesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _body = $v.body;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Messages other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Messages;
  }

  @override
  void update(void Function(MessagesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Messages build() => _build();

  _$Messages _build() {
    final _$result = _$v ?? new _$Messages._(body: body);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
