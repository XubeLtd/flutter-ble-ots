// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'olcp_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OlcpResponse {
  int get requestCode => throw _privateConstructorUsedError;
  int get resultCode => throw _privateConstructorUsedError;
  List<int> get responseParameter => throw _privateConstructorUsedError;

  /// Create a copy of OlcpResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OlcpResponseCopyWith<OlcpResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OlcpResponseCopyWith<$Res> {
  factory $OlcpResponseCopyWith(
          OlcpResponse value, $Res Function(OlcpResponse) then) =
      _$OlcpResponseCopyWithImpl<$Res, OlcpResponse>;
  @useResult
  $Res call({int requestCode, int resultCode, List<int> responseParameter});
}

/// @nodoc
class _$OlcpResponseCopyWithImpl<$Res, $Val extends OlcpResponse>
    implements $OlcpResponseCopyWith<$Res> {
  _$OlcpResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OlcpResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestCode = null,
    Object? resultCode = null,
    Object? responseParameter = null,
  }) {
    return _then(_value.copyWith(
      requestCode: null == requestCode
          ? _value.requestCode
          : requestCode // ignore: cast_nullable_to_non_nullable
              as int,
      resultCode: null == resultCode
          ? _value.resultCode
          : resultCode // ignore: cast_nullable_to_non_nullable
              as int,
      responseParameter: null == responseParameter
          ? _value.responseParameter
          : responseParameter // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OlcpResponseImplCopyWith<$Res>
    implements $OlcpResponseCopyWith<$Res> {
  factory _$$OlcpResponseImplCopyWith(
          _$OlcpResponseImpl value, $Res Function(_$OlcpResponseImpl) then) =
      __$$OlcpResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int requestCode, int resultCode, List<int> responseParameter});
}

/// @nodoc
class __$$OlcpResponseImplCopyWithImpl<$Res>
    extends _$OlcpResponseCopyWithImpl<$Res, _$OlcpResponseImpl>
    implements _$$OlcpResponseImplCopyWith<$Res> {
  __$$OlcpResponseImplCopyWithImpl(
      _$OlcpResponseImpl _value, $Res Function(_$OlcpResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of OlcpResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestCode = null,
    Object? resultCode = null,
    Object? responseParameter = null,
  }) {
    return _then(_$OlcpResponseImpl(
      requestCode: null == requestCode
          ? _value.requestCode
          : requestCode // ignore: cast_nullable_to_non_nullable
              as int,
      resultCode: null == resultCode
          ? _value.resultCode
          : resultCode // ignore: cast_nullable_to_non_nullable
              as int,
      responseParameter: null == responseParameter
          ? _value._responseParameter
          : responseParameter // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc

class _$OlcpResponseImpl implements _OlcpResponse {
  const _$OlcpResponseImpl(
      {required this.requestCode,
      required this.resultCode,
      final List<int> responseParameter = const []})
      : _responseParameter = responseParameter;

  @override
  final int requestCode;
  @override
  final int resultCode;
  final List<int> _responseParameter;
  @override
  @JsonKey()
  List<int> get responseParameter {
    if (_responseParameter is EqualUnmodifiableListView)
      return _responseParameter;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_responseParameter);
  }

  @override
  String toString() {
    return 'OlcpResponse(requestCode: $requestCode, resultCode: $resultCode, responseParameter: $responseParameter)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OlcpResponseImpl &&
            (identical(other.requestCode, requestCode) ||
                other.requestCode == requestCode) &&
            (identical(other.resultCode, resultCode) ||
                other.resultCode == resultCode) &&
            const DeepCollectionEquality()
                .equals(other._responseParameter, _responseParameter));
  }

  @override
  int get hashCode => Object.hash(runtimeType, requestCode, resultCode,
      const DeepCollectionEquality().hash(_responseParameter));

  /// Create a copy of OlcpResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OlcpResponseImplCopyWith<_$OlcpResponseImpl> get copyWith =>
      __$$OlcpResponseImplCopyWithImpl<_$OlcpResponseImpl>(this, _$identity);
}

abstract class _OlcpResponse implements OlcpResponse {
  const factory _OlcpResponse(
      {required final int requestCode,
      required final int resultCode,
      final List<int> responseParameter}) = _$OlcpResponseImpl;

  @override
  int get requestCode;
  @override
  int get resultCode;
  @override
  List<int> get responseParameter;

  /// Create a copy of OlcpResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OlcpResponseImplCopyWith<_$OlcpResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
