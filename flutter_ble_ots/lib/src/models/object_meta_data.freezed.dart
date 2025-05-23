// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'object_meta_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ObjectMetaData {
  List<int> get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<int> get type => throw _privateConstructorUsedError;
  List<int> get size => throw _privateConstructorUsedError;
  String get lastModified => throw _privateConstructorUsedError;
  ObjectProperties get objectProperties => throw _privateConstructorUsedError;

  /// Create a copy of ObjectMetaData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ObjectMetaDataCopyWith<ObjectMetaData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ObjectMetaDataCopyWith<$Res> {
  factory $ObjectMetaDataCopyWith(
          ObjectMetaData value, $Res Function(ObjectMetaData) then) =
      _$ObjectMetaDataCopyWithImpl<$Res, ObjectMetaData>;
  @useResult
  $Res call(
      {List<int> id,
      String name,
      List<int> type,
      List<int> size,
      String lastModified,
      ObjectProperties objectProperties});

  $ObjectPropertiesCopyWith<$Res> get objectProperties;
}

/// @nodoc
class _$ObjectMetaDataCopyWithImpl<$Res, $Val extends ObjectMetaData>
    implements $ObjectMetaDataCopyWith<$Res> {
  _$ObjectMetaDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ObjectMetaData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? type = null,
    Object? size = null,
    Object? lastModified = null,
    Object? objectProperties = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as List<int>,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as List<int>,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as List<int>,
      lastModified: null == lastModified
          ? _value.lastModified
          : lastModified // ignore: cast_nullable_to_non_nullable
              as String,
      objectProperties: null == objectProperties
          ? _value.objectProperties
          : objectProperties // ignore: cast_nullable_to_non_nullable
              as ObjectProperties,
    ) as $Val);
  }

  /// Create a copy of ObjectMetaData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ObjectPropertiesCopyWith<$Res> get objectProperties {
    return $ObjectPropertiesCopyWith<$Res>(_value.objectProperties, (value) {
      return _then(_value.copyWith(objectProperties: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ObjectMetaDataImplCopyWith<$Res>
    implements $ObjectMetaDataCopyWith<$Res> {
  factory _$$ObjectMetaDataImplCopyWith(_$ObjectMetaDataImpl value,
          $Res Function(_$ObjectMetaDataImpl) then) =
      __$$ObjectMetaDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<int> id,
      String name,
      List<int> type,
      List<int> size,
      String lastModified,
      ObjectProperties objectProperties});

  @override
  $ObjectPropertiesCopyWith<$Res> get objectProperties;
}

/// @nodoc
class __$$ObjectMetaDataImplCopyWithImpl<$Res>
    extends _$ObjectMetaDataCopyWithImpl<$Res, _$ObjectMetaDataImpl>
    implements _$$ObjectMetaDataImplCopyWith<$Res> {
  __$$ObjectMetaDataImplCopyWithImpl(
      _$ObjectMetaDataImpl _value, $Res Function(_$ObjectMetaDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of ObjectMetaData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? type = null,
    Object? size = null,
    Object? lastModified = null,
    Object? objectProperties = null,
  }) {
    return _then(_$ObjectMetaDataImpl(
      id: null == id
          ? _value._id
          : id // ignore: cast_nullable_to_non_nullable
              as List<int>,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value._type
          : type // ignore: cast_nullable_to_non_nullable
              as List<int>,
      size: null == size
          ? _value._size
          : size // ignore: cast_nullable_to_non_nullable
              as List<int>,
      lastModified: null == lastModified
          ? _value.lastModified
          : lastModified // ignore: cast_nullable_to_non_nullable
              as String,
      objectProperties: null == objectProperties
          ? _value.objectProperties
          : objectProperties // ignore: cast_nullable_to_non_nullable
              as ObjectProperties,
    ));
  }
}

/// @nodoc

class _$ObjectMetaDataImpl extends _ObjectMetaData {
  const _$ObjectMetaDataImpl(
      {required final List<int> id,
      required this.name,
      final List<int> type = const [],
      required final List<int> size,
      this.lastModified = '',
      required this.objectProperties})
      : _id = id,
        _type = type,
        _size = size,
        super._();

  final List<int> _id;
  @override
  List<int> get id {
    if (_id is EqualUnmodifiableListView) return _id;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_id);
  }

  @override
  final String name;
  final List<int> _type;
  @override
  @JsonKey()
  List<int> get type {
    if (_type is EqualUnmodifiableListView) return _type;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_type);
  }

  final List<int> _size;
  @override
  List<int> get size {
    if (_size is EqualUnmodifiableListView) return _size;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_size);
  }

  @override
  @JsonKey()
  final String lastModified;
  @override
  final ObjectProperties objectProperties;

  @override
  String toString() {
    return 'ObjectMetaData(id: $id, name: $name, type: $type, size: $size, lastModified: $lastModified, objectProperties: $objectProperties)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ObjectMetaDataImpl &&
            const DeepCollectionEquality().equals(other._id, _id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._type, _type) &&
            const DeepCollectionEquality().equals(other._size, _size) &&
            (identical(other.lastModified, lastModified) ||
                other.lastModified == lastModified) &&
            (identical(other.objectProperties, objectProperties) ||
                other.objectProperties == objectProperties));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_id),
      name,
      const DeepCollectionEquality().hash(_type),
      const DeepCollectionEquality().hash(_size),
      lastModified,
      objectProperties);

  /// Create a copy of ObjectMetaData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ObjectMetaDataImplCopyWith<_$ObjectMetaDataImpl> get copyWith =>
      __$$ObjectMetaDataImplCopyWithImpl<_$ObjectMetaDataImpl>(
          this, _$identity);
}

abstract class _ObjectMetaData extends ObjectMetaData {
  const factory _ObjectMetaData(
      {required final List<int> id,
      required final String name,
      final List<int> type,
      required final List<int> size,
      final String lastModified,
      required final ObjectProperties objectProperties}) = _$ObjectMetaDataImpl;
  const _ObjectMetaData._() : super._();

  @override
  List<int> get id;
  @override
  String get name;
  @override
  List<int> get type;
  @override
  List<int> get size;
  @override
  String get lastModified;
  @override
  ObjectProperties get objectProperties;

  /// Create a copy of ObjectMetaData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ObjectMetaDataImplCopyWith<_$ObjectMetaDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
