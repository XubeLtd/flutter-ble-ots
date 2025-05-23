// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'common_characteristic.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CommonCharacteristic {
  Uint8List get characteristicId => throw _privateConstructorUsedError;
  Uint8List get serviceId => throw _privateConstructorUsedError;
  String get deviceId => throw _privateConstructorUsedError;

  /// Create a copy of CommonCharacteristic
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommonCharacteristicCopyWith<CommonCharacteristic> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommonCharacteristicCopyWith<$Res> {
  factory $CommonCharacteristicCopyWith(CommonCharacteristic value,
          $Res Function(CommonCharacteristic) then) =
      _$CommonCharacteristicCopyWithImpl<$Res, CommonCharacteristic>;
  @useResult
  $Res call({Uint8List characteristicId, Uint8List serviceId, String deviceId});
}

/// @nodoc
class _$CommonCharacteristicCopyWithImpl<$Res,
        $Val extends CommonCharacteristic>
    implements $CommonCharacteristicCopyWith<$Res> {
  _$CommonCharacteristicCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CommonCharacteristic
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? characteristicId = null,
    Object? serviceId = null,
    Object? deviceId = null,
  }) {
    return _then(_value.copyWith(
      characteristicId: null == characteristicId
          ? _value.characteristicId
          : characteristicId // ignore: cast_nullable_to_non_nullable
              as Uint8List,
      serviceId: null == serviceId
          ? _value.serviceId
          : serviceId // ignore: cast_nullable_to_non_nullable
              as Uint8List,
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommonCharacteristicImplCopyWith<$Res>
    implements $CommonCharacteristicCopyWith<$Res> {
  factory _$$CommonCharacteristicImplCopyWith(_$CommonCharacteristicImpl value,
          $Res Function(_$CommonCharacteristicImpl) then) =
      __$$CommonCharacteristicImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Uint8List characteristicId, Uint8List serviceId, String deviceId});
}

/// @nodoc
class __$$CommonCharacteristicImplCopyWithImpl<$Res>
    extends _$CommonCharacteristicCopyWithImpl<$Res, _$CommonCharacteristicImpl>
    implements _$$CommonCharacteristicImplCopyWith<$Res> {
  __$$CommonCharacteristicImplCopyWithImpl(_$CommonCharacteristicImpl _value,
      $Res Function(_$CommonCharacteristicImpl) _then)
      : super(_value, _then);

  /// Create a copy of CommonCharacteristic
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? characteristicId = null,
    Object? serviceId = null,
    Object? deviceId = null,
  }) {
    return _then(_$CommonCharacteristicImpl(
      characteristicId: null == characteristicId
          ? _value.characteristicId
          : characteristicId // ignore: cast_nullable_to_non_nullable
              as Uint8List,
      serviceId: null == serviceId
          ? _value.serviceId
          : serviceId // ignore: cast_nullable_to_non_nullable
              as Uint8List,
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CommonCharacteristicImpl implements _CommonCharacteristic {
  _$CommonCharacteristicImpl(
      {required this.characteristicId,
      required this.serviceId,
      required this.deviceId});

  @override
  final Uint8List characteristicId;
  @override
  final Uint8List serviceId;
  @override
  final String deviceId;

  @override
  String toString() {
    return 'CommonCharacteristic(characteristicId: $characteristicId, serviceId: $serviceId, deviceId: $deviceId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommonCharacteristicImpl &&
            const DeepCollectionEquality()
                .equals(other.characteristicId, characteristicId) &&
            const DeepCollectionEquality().equals(other.serviceId, serviceId) &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(characteristicId),
      const DeepCollectionEquality().hash(serviceId),
      deviceId);

  /// Create a copy of CommonCharacteristic
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommonCharacteristicImplCopyWith<_$CommonCharacteristicImpl>
      get copyWith =>
          __$$CommonCharacteristicImplCopyWithImpl<_$CommonCharacteristicImpl>(
              this, _$identity);
}

abstract class _CommonCharacteristic implements CommonCharacteristic {
  factory _CommonCharacteristic(
      {required final Uint8List characteristicId,
      required final Uint8List serviceId,
      required final String deviceId}) = _$CommonCharacteristicImpl;

  @override
  Uint8List get characteristicId;
  @override
  Uint8List get serviceId;
  @override
  String get deviceId;

  /// Create a copy of CommonCharacteristic
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommonCharacteristicImplCopyWith<_$CommonCharacteristicImpl>
      get copyWith => throw _privateConstructorUsedError;
}
