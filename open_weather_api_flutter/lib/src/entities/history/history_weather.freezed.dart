// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'history_weather.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

History _$HistoryFromJson(Map<String, dynamic> json) {
  return _History.fromJson(json);
}

/// @nodoc
class _$HistoryTearOff {
  const _$HistoryTearOff();

  _History call(
      {@JsonKey(name: 'hourly') required List<HistoryWeather> weatherInfo}) {
    return _History(
      weatherInfo: weatherInfo,
    );
  }

  History fromJson(Map<String, Object?> json) {
    return History.fromJson(json);
  }
}

/// @nodoc
const $History = _$HistoryTearOff();

/// @nodoc
mixin _$History {
  @JsonKey(name: 'hourly')
  List<HistoryWeather> get weatherInfo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HistoryCopyWith<History> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryCopyWith<$Res> {
  factory $HistoryCopyWith(History value, $Res Function(History) then) =
      _$HistoryCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: 'hourly') List<HistoryWeather> weatherInfo});
}

/// @nodoc
class _$HistoryCopyWithImpl<$Res> implements $HistoryCopyWith<$Res> {
  _$HistoryCopyWithImpl(this._value, this._then);

  final History _value;
  // ignore: unused_field
  final $Res Function(History) _then;

  @override
  $Res call({
    Object? weatherInfo = freezed,
  }) {
    return _then(_value.copyWith(
      weatherInfo: weatherInfo == freezed
          ? _value.weatherInfo
          : weatherInfo // ignore: cast_nullable_to_non_nullable
              as List<HistoryWeather>,
    ));
  }
}

/// @nodoc
abstract class _$HistoryCopyWith<$Res> implements $HistoryCopyWith<$Res> {
  factory _$HistoryCopyWith(_History value, $Res Function(_History) then) =
      __$HistoryCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: 'hourly') List<HistoryWeather> weatherInfo});
}

/// @nodoc
class __$HistoryCopyWithImpl<$Res> extends _$HistoryCopyWithImpl<$Res>
    implements _$HistoryCopyWith<$Res> {
  __$HistoryCopyWithImpl(_History _value, $Res Function(_History) _then)
      : super(_value, (v) => _then(v as _History));

  @override
  _History get _value => super._value as _History;

  @override
  $Res call({
    Object? weatherInfo = freezed,
  }) {
    return _then(_History(
      weatherInfo: weatherInfo == freezed
          ? _value.weatherInfo
          : weatherInfo // ignore: cast_nullable_to_non_nullable
              as List<HistoryWeather>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_History implements _History {
  _$_History({@JsonKey(name: 'hourly') required this.weatherInfo});

  factory _$_History.fromJson(Map<String, dynamic> json) =>
      _$$_HistoryFromJson(json);

  @override
  @JsonKey(name: 'hourly')
  final List<HistoryWeather> weatherInfo;

  @override
  String toString() {
    return 'History(weatherInfo: $weatherInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _History &&
            const DeepCollectionEquality()
                .equals(other.weatherInfo, weatherInfo));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(weatherInfo));

  @JsonKey(ignore: true)
  @override
  _$HistoryCopyWith<_History> get copyWith =>
      __$HistoryCopyWithImpl<_History>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HistoryToJson(this);
  }
}

abstract class _History implements History {
  factory _History(
      {@JsonKey(name: 'hourly')
          required List<HistoryWeather> weatherInfo}) = _$_History;

  factory _History.fromJson(Map<String, dynamic> json) = _$_History.fromJson;

  @override
  @JsonKey(name: 'hourly')
  List<HistoryWeather> get weatherInfo;
  @override
  @JsonKey(ignore: true)
  _$HistoryCopyWith<_History> get copyWith =>
      throw _privateConstructorUsedError;
}

HistoryWeather _$HistoryWeatherFromJson(Map<String, dynamic> json) {
  return _HistoryWeather.fromJson(json);
}

/// @nodoc
class _$HistoryWeatherTearOff {
  const _$HistoryWeatherTearOff();

  _HistoryWeather call(
      {required int dt,
      required double temp,
      @JsonKey(name: 'feels_like') required double feelsLike,
      required int pressure,
      required int humidity,
      required int clouds,
      required int visibility,
      required List<WeatherInfo> weather}) {
    return _HistoryWeather(
      dt: dt,
      temp: temp,
      feelsLike: feelsLike,
      pressure: pressure,
      humidity: humidity,
      clouds: clouds,
      visibility: visibility,
      weather: weather,
    );
  }

  HistoryWeather fromJson(Map<String, Object?> json) {
    return HistoryWeather.fromJson(json);
  }
}

/// @nodoc
const $HistoryWeather = _$HistoryWeatherTearOff();

/// @nodoc
mixin _$HistoryWeather {
  int get dt => throw _privateConstructorUsedError;
  double get temp => throw _privateConstructorUsedError;
  @JsonKey(name: 'feels_like')
  double get feelsLike => throw _privateConstructorUsedError;
  int get pressure => throw _privateConstructorUsedError;
  int get humidity => throw _privateConstructorUsedError;
  int get clouds => throw _privateConstructorUsedError;
  int get visibility => throw _privateConstructorUsedError;
  List<WeatherInfo> get weather => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HistoryWeatherCopyWith<HistoryWeather> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryWeatherCopyWith<$Res> {
  factory $HistoryWeatherCopyWith(
          HistoryWeather value, $Res Function(HistoryWeather) then) =
      _$HistoryWeatherCopyWithImpl<$Res>;
  $Res call(
      {int dt,
      double temp,
      @JsonKey(name: 'feels_like') double feelsLike,
      int pressure,
      int humidity,
      int clouds,
      int visibility,
      List<WeatherInfo> weather});
}

/// @nodoc
class _$HistoryWeatherCopyWithImpl<$Res>
    implements $HistoryWeatherCopyWith<$Res> {
  _$HistoryWeatherCopyWithImpl(this._value, this._then);

  final HistoryWeather _value;
  // ignore: unused_field
  final $Res Function(HistoryWeather) _then;

  @override
  $Res call({
    Object? dt = freezed,
    Object? temp = freezed,
    Object? feelsLike = freezed,
    Object? pressure = freezed,
    Object? humidity = freezed,
    Object? clouds = freezed,
    Object? visibility = freezed,
    Object? weather = freezed,
  }) {
    return _then(_value.copyWith(
      dt: dt == freezed
          ? _value.dt
          : dt // ignore: cast_nullable_to_non_nullable
              as int,
      temp: temp == freezed
          ? _value.temp
          : temp // ignore: cast_nullable_to_non_nullable
              as double,
      feelsLike: feelsLike == freezed
          ? _value.feelsLike
          : feelsLike // ignore: cast_nullable_to_non_nullable
              as double,
      pressure: pressure == freezed
          ? _value.pressure
          : pressure // ignore: cast_nullable_to_non_nullable
              as int,
      humidity: humidity == freezed
          ? _value.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as int,
      clouds: clouds == freezed
          ? _value.clouds
          : clouds // ignore: cast_nullable_to_non_nullable
              as int,
      visibility: visibility == freezed
          ? _value.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as int,
      weather: weather == freezed
          ? _value.weather
          : weather // ignore: cast_nullable_to_non_nullable
              as List<WeatherInfo>,
    ));
  }
}

/// @nodoc
abstract class _$HistoryWeatherCopyWith<$Res>
    implements $HistoryWeatherCopyWith<$Res> {
  factory _$HistoryWeatherCopyWith(
          _HistoryWeather value, $Res Function(_HistoryWeather) then) =
      __$HistoryWeatherCopyWithImpl<$Res>;
  @override
  $Res call(
      {int dt,
      double temp,
      @JsonKey(name: 'feels_like') double feelsLike,
      int pressure,
      int humidity,
      int clouds,
      int visibility,
      List<WeatherInfo> weather});
}

/// @nodoc
class __$HistoryWeatherCopyWithImpl<$Res>
    extends _$HistoryWeatherCopyWithImpl<$Res>
    implements _$HistoryWeatherCopyWith<$Res> {
  __$HistoryWeatherCopyWithImpl(
      _HistoryWeather _value, $Res Function(_HistoryWeather) _then)
      : super(_value, (v) => _then(v as _HistoryWeather));

  @override
  _HistoryWeather get _value => super._value as _HistoryWeather;

  @override
  $Res call({
    Object? dt = freezed,
    Object? temp = freezed,
    Object? feelsLike = freezed,
    Object? pressure = freezed,
    Object? humidity = freezed,
    Object? clouds = freezed,
    Object? visibility = freezed,
    Object? weather = freezed,
  }) {
    return _then(_HistoryWeather(
      dt: dt == freezed
          ? _value.dt
          : dt // ignore: cast_nullable_to_non_nullable
              as int,
      temp: temp == freezed
          ? _value.temp
          : temp // ignore: cast_nullable_to_non_nullable
              as double,
      feelsLike: feelsLike == freezed
          ? _value.feelsLike
          : feelsLike // ignore: cast_nullable_to_non_nullable
              as double,
      pressure: pressure == freezed
          ? _value.pressure
          : pressure // ignore: cast_nullable_to_non_nullable
              as int,
      humidity: humidity == freezed
          ? _value.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as int,
      clouds: clouds == freezed
          ? _value.clouds
          : clouds // ignore: cast_nullable_to_non_nullable
              as int,
      visibility: visibility == freezed
          ? _value.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as int,
      weather: weather == freezed
          ? _value.weather
          : weather // ignore: cast_nullable_to_non_nullable
              as List<WeatherInfo>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HistoryWeather implements _HistoryWeather {
  _$_HistoryWeather(
      {required this.dt,
      required this.temp,
      @JsonKey(name: 'feels_like') required this.feelsLike,
      required this.pressure,
      required this.humidity,
      required this.clouds,
      required this.visibility,
      required this.weather});

  factory _$_HistoryWeather.fromJson(Map<String, dynamic> json) =>
      _$$_HistoryWeatherFromJson(json);

  @override
  final int dt;
  @override
  final double temp;
  @override
  @JsonKey(name: 'feels_like')
  final double feelsLike;
  @override
  final int pressure;
  @override
  final int humidity;
  @override
  final int clouds;
  @override
  final int visibility;
  @override
  final List<WeatherInfo> weather;

  @override
  String toString() {
    return 'HistoryWeather(dt: $dt, temp: $temp, feelsLike: $feelsLike, pressure: $pressure, humidity: $humidity, clouds: $clouds, visibility: $visibility, weather: $weather)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HistoryWeather &&
            const DeepCollectionEquality().equals(other.dt, dt) &&
            const DeepCollectionEquality().equals(other.temp, temp) &&
            const DeepCollectionEquality().equals(other.feelsLike, feelsLike) &&
            const DeepCollectionEquality().equals(other.pressure, pressure) &&
            const DeepCollectionEquality().equals(other.humidity, humidity) &&
            const DeepCollectionEquality().equals(other.clouds, clouds) &&
            const DeepCollectionEquality()
                .equals(other.visibility, visibility) &&
            const DeepCollectionEquality().equals(other.weather, weather));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(dt),
      const DeepCollectionEquality().hash(temp),
      const DeepCollectionEquality().hash(feelsLike),
      const DeepCollectionEquality().hash(pressure),
      const DeepCollectionEquality().hash(humidity),
      const DeepCollectionEquality().hash(clouds),
      const DeepCollectionEquality().hash(visibility),
      const DeepCollectionEquality().hash(weather));

  @JsonKey(ignore: true)
  @override
  _$HistoryWeatherCopyWith<_HistoryWeather> get copyWith =>
      __$HistoryWeatherCopyWithImpl<_HistoryWeather>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HistoryWeatherToJson(this);
  }
}

abstract class _HistoryWeather implements HistoryWeather {
  factory _HistoryWeather(
      {required int dt,
      required double temp,
      @JsonKey(name: 'feels_like') required double feelsLike,
      required int pressure,
      required int humidity,
      required int clouds,
      required int visibility,
      required List<WeatherInfo> weather}) = _$_HistoryWeather;

  factory _HistoryWeather.fromJson(Map<String, dynamic> json) =
      _$_HistoryWeather.fromJson;

  @override
  int get dt;
  @override
  double get temp;
  @override
  @JsonKey(name: 'feels_like')
  double get feelsLike;
  @override
  int get pressure;
  @override
  int get humidity;
  @override
  int get clouds;
  @override
  int get visibility;
  @override
  List<WeatherInfo> get weather;
  @override
  @JsonKey(ignore: true)
  _$HistoryWeatherCopyWith<_HistoryWeather> get copyWith =>
      throw _privateConstructorUsedError;
}
