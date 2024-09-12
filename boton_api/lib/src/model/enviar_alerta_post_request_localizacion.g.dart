// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enviar_alerta_post_request_localizacion.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$EnviarAlertaPostRequestLocalizacion
    extends EnviarAlertaPostRequestLocalizacion {
  @override
  final num? latitude;
  @override
  final num? longitude;
  @override
  final num? altitude;
  @override
  final num? accuracy;
  @override
  final num? altitudeAccuracy;
  @override
  final num? heading;
  @override
  final num? speed;

  factory _$EnviarAlertaPostRequestLocalizacion(
          [void Function(EnviarAlertaPostRequestLocalizacionBuilder)?
              updates]) =>
      (new EnviarAlertaPostRequestLocalizacionBuilder()..update(updates))
          ._build();

  _$EnviarAlertaPostRequestLocalizacion._(
      {this.latitude,
      this.longitude,
      this.altitude,
      this.accuracy,
      this.altitudeAccuracy,
      this.heading,
      this.speed})
      : super._();

  @override
  EnviarAlertaPostRequestLocalizacion rebuild(
          void Function(EnviarAlertaPostRequestLocalizacionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EnviarAlertaPostRequestLocalizacionBuilder toBuilder() =>
      new EnviarAlertaPostRequestLocalizacionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EnviarAlertaPostRequestLocalizacion &&
        latitude == other.latitude &&
        longitude == other.longitude &&
        altitude == other.altitude &&
        accuracy == other.accuracy &&
        altitudeAccuracy == other.altitudeAccuracy &&
        heading == other.heading &&
        speed == other.speed;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, latitude.hashCode);
    _$hash = $jc(_$hash, longitude.hashCode);
    _$hash = $jc(_$hash, altitude.hashCode);
    _$hash = $jc(_$hash, accuracy.hashCode);
    _$hash = $jc(_$hash, altitudeAccuracy.hashCode);
    _$hash = $jc(_$hash, heading.hashCode);
    _$hash = $jc(_$hash, speed.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EnviarAlertaPostRequestLocalizacion')
          ..add('latitude', latitude)
          ..add('longitude', longitude)
          ..add('altitude', altitude)
          ..add('accuracy', accuracy)
          ..add('altitudeAccuracy', altitudeAccuracy)
          ..add('heading', heading)
          ..add('speed', speed))
        .toString();
  }
}

class EnviarAlertaPostRequestLocalizacionBuilder
    implements
        Builder<EnviarAlertaPostRequestLocalizacion,
            EnviarAlertaPostRequestLocalizacionBuilder> {
  _$EnviarAlertaPostRequestLocalizacion? _$v;

  num? _latitude;
  num? get latitude => _$this._latitude;
  set latitude(num? latitude) => _$this._latitude = latitude;

  num? _longitude;
  num? get longitude => _$this._longitude;
  set longitude(num? longitude) => _$this._longitude = longitude;

  num? _altitude;
  num? get altitude => _$this._altitude;
  set altitude(num? altitude) => _$this._altitude = altitude;

  num? _accuracy;
  num? get accuracy => _$this._accuracy;
  set accuracy(num? accuracy) => _$this._accuracy = accuracy;

  num? _altitudeAccuracy;
  num? get altitudeAccuracy => _$this._altitudeAccuracy;
  set altitudeAccuracy(num? altitudeAccuracy) =>
      _$this._altitudeAccuracy = altitudeAccuracy;

  num? _heading;
  num? get heading => _$this._heading;
  set heading(num? heading) => _$this._heading = heading;

  num? _speed;
  num? get speed => _$this._speed;
  set speed(num? speed) => _$this._speed = speed;

  EnviarAlertaPostRequestLocalizacionBuilder() {
    EnviarAlertaPostRequestLocalizacion._defaults(this);
  }

  EnviarAlertaPostRequestLocalizacionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _latitude = $v.latitude;
      _longitude = $v.longitude;
      _altitude = $v.altitude;
      _accuracy = $v.accuracy;
      _altitudeAccuracy = $v.altitudeAccuracy;
      _heading = $v.heading;
      _speed = $v.speed;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EnviarAlertaPostRequestLocalizacion other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$EnviarAlertaPostRequestLocalizacion;
  }

  @override
  void update(
      void Function(EnviarAlertaPostRequestLocalizacionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EnviarAlertaPostRequestLocalizacion build() => _build();

  _$EnviarAlertaPostRequestLocalizacion _build() {
    final _$result = _$v ??
        new _$EnviarAlertaPostRequestLocalizacion._(
            latitude: latitude,
            longitude: longitude,
            altitude: altitude,
            accuracy: accuracy,
            altitudeAccuracy: altitudeAccuracy,
            heading: heading,
            speed: speed);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
