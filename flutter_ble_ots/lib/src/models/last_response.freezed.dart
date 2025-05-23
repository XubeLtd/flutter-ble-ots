// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'last_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LastResponse<Type> {
  DateTime get timeStamp => throw _privateConstructorUsedError;
  Type get response => throw _privateConstructorUsedError;

  /// Create a copy of LastResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LastResponseCopyWith<Type, LastResponse<Type>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LastResponseCopyWith<Type, $Res> {
  factory $LastResponseCopyWith(
          LastResponse<Type> value, $Res Function(LastResponse<Type>) then) =
      _$LastResponseCopyWithImpl<Type, $Res, LastResponse<Type>>;
  @useResult
  $Res call({DateTime timeStamp, Type response});
}

/// @nodoc
class _$LastResponseCopyWithImpl<Type, $Res, $Val extends LastResponse<Type>>
    implements $LastResponseCopyWith<Type, $Res> {
  _$LastResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LastResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timeStamp = null,
    Object? response = freezed,
  }) {
    return _then(_value.copyWith(
      timeStamp: null == timeStamp
          ? _value.timeStamp
          : timeStamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      response: freezed == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as Type,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LastResponseImplCopyWith<Type, $Res>
    implements $LastResponseCopyWith<Type, $Res> {
  factory _$$LastResponseImplCopyWith(_$LastResponseImpl<Type> value,
          $Res Function(_$LastResponseImpl<Type>) then) =
      __$$LastResponseImplCopyWithImpl<Type, $Res>;
  @override
  @useResult
  $Res call({DateTime timeStamp, Type response});
}

/// @nodoc
class __$$LastResponseImplCopyWithImpl<Type, $Res>
    extends _$LastResponseCopyWithImpl<Type, $Res, _$LastResponseImpl<Type>>
    implements _$$LastResponseImplCopyWith<Type, $Res> {
  __$$LastResponseImplCopyWithImpl(_$LastResponseImpl<Type> _value,
      $Res Function(_$LastResponseImpl<Type>) _then)
      : super(_value, _then);

  /// Create a copy of LastResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timeStamp = null,
    Object? response = freezed,
  }) {
    return _then(_$LastResponseImpl<Type>(
      timeStamp: null == timeStamp
          ? _value.timeStamp
          : timeStamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      response: freezed == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as Type,
    ));
  }
}

/// @nodoc

class _$LastResponseImpl<Type> implements _LastResponse<Type> {
  _$LastResponseImpl({required this.timeStamp, required this.response});

  @override
  final DateTime timeStamp;
  @override
  final Type response;

  @override
  String toString() {
    return 'LastResponse<$Type>(timeStamp: $timeStamp, response: $response)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LastResponseImpl<Type> &&
            (identical(other.timeStamp, timeStamp) ||
                other.timeStamp == timeStamp) &&
            const DeepCollectionEquality().equals(other.response, response));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, timeStamp, const DeepCollectionEquality().hash(response));

  /// Create a copy of LastResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LastResponseImplCopyWith<Type, _$LastResponseImpl<Type>> get copyWith =>
      __$$LastResponseImplCopyWithImpl<Type, _$LastResponseImpl<Type>>(
          this, _$identity);
}

abstract class _LastResponse<Type> implements LastResponse<Type> {
  factory _LastResponse(
      {required final DateTime timeStamp,
      required final Type response}) = _$LastResponseImpl<Type>;

  @override
  DateTime get timeStamp;
  @override
  Type get response;

  /// Create a copy of LastResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LastResponseImplCopyWith<Type, _$LastResponseImpl<Type>> get copyWith =>
      throw _privateConstructorUsedError;
}
