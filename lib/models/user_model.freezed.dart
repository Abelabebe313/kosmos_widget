// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PublicationUserModel _$PublicationUserModelFromJson(Map<String, dynamic> json) {
  return _PublicationUserModel.fromJson(json);
}

/// @nodoc
mixin _$PublicationUserModel {
  String get id => throw _privateConstructorUsedError;
  String get avatar => throw _privateConstructorUsedError;
  String get firstname => throw _privateConstructorUsedError;
  String get lastname => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  bool get verified => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PublicationUserModelCopyWith<PublicationUserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PublicationUserModelCopyWith<$Res> {
  factory $PublicationUserModelCopyWith(PublicationUserModel value,
          $Res Function(PublicationUserModel) then) =
      _$PublicationUserModelCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String avatar,
      String firstname,
      String lastname,
      String username,
      bool verified});
}

/// @nodoc
class _$PublicationUserModelCopyWithImpl<$Res>
    implements $PublicationUserModelCopyWith<$Res> {
  _$PublicationUserModelCopyWithImpl(this._value, this._then);

  final PublicationUserModel _value;
  // ignore: unused_field
  final $Res Function(PublicationUserModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? avatar = freezed,
    Object? firstname = freezed,
    Object? lastname = freezed,
    Object? username = freezed,
    Object? verified = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: avatar == freezed
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
      firstname: firstname == freezed
          ? _value.firstname
          : firstname // ignore: cast_nullable_to_non_nullable
              as String,
      lastname: lastname == freezed
          ? _value.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      verified: verified == freezed
          ? _value.verified
          : verified // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_PublicationUserModelCopyWith<$Res>
    implements $PublicationUserModelCopyWith<$Res> {
  factory _$$_PublicationUserModelCopyWith(_$_PublicationUserModel value,
          $Res Function(_$_PublicationUserModel) then) =
      __$$_PublicationUserModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String avatar,
      String firstname,
      String lastname,
      String username,
      bool verified});
}

/// @nodoc
class __$$_PublicationUserModelCopyWithImpl<$Res>
    extends _$PublicationUserModelCopyWithImpl<$Res>
    implements _$$_PublicationUserModelCopyWith<$Res> {
  __$$_PublicationUserModelCopyWithImpl(_$_PublicationUserModel _value,
      $Res Function(_$_PublicationUserModel) _then)
      : super(_value, (v) => _then(v as _$_PublicationUserModel));

  @override
  _$_PublicationUserModel get _value => super._value as _$_PublicationUserModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? avatar = freezed,
    Object? firstname = freezed,
    Object? lastname = freezed,
    Object? username = freezed,
    Object? verified = freezed,
  }) {
    return _then(_$_PublicationUserModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: avatar == freezed
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
      firstname: firstname == freezed
          ? _value.firstname
          : firstname // ignore: cast_nullable_to_non_nullable
              as String,
      lastname: lastname == freezed
          ? _value.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      verified: verified == freezed
          ? _value.verified
          : verified // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PublicationUserModel
    with DiagnosticableTreeMixin
    implements _PublicationUserModel {
  const _$_PublicationUserModel(
      {required this.id,
      required this.avatar,
      required this.firstname,
      required this.lastname,
      required this.username,
      required this.verified});

  factory _$_PublicationUserModel.fromJson(Map<String, dynamic> json) =>
      _$$_PublicationUserModelFromJson(json);

  @override
  final String id;
  @override
  final String avatar;
  @override
  final String firstname;
  @override
  final String lastname;
  @override
  final String username;
  @override
  final bool verified;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PublicationUserModel(id: $id, avatar: $avatar, firstname: $firstname, lastname: $lastname, username: $username, verified: $verified)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PublicationUserModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('avatar', avatar))
      ..add(DiagnosticsProperty('firstname', firstname))
      ..add(DiagnosticsProperty('lastname', lastname))
      ..add(DiagnosticsProperty('username', username))
      ..add(DiagnosticsProperty('verified', verified));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PublicationUserModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.avatar, avatar) &&
            const DeepCollectionEquality().equals(other.firstname, firstname) &&
            const DeepCollectionEquality().equals(other.lastname, lastname) &&
            const DeepCollectionEquality().equals(other.username, username) &&
            const DeepCollectionEquality().equals(other.verified, verified));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(avatar),
      const DeepCollectionEquality().hash(firstname),
      const DeepCollectionEquality().hash(lastname),
      const DeepCollectionEquality().hash(username),
      const DeepCollectionEquality().hash(verified));

  @JsonKey(ignore: true)
  @override
  _$$_PublicationUserModelCopyWith<_$_PublicationUserModel> get copyWith =>
      __$$_PublicationUserModelCopyWithImpl<_$_PublicationUserModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PublicationUserModelToJson(
      this,
    );
  }
}

abstract class _PublicationUserModel implements PublicationUserModel {
  const factory _PublicationUserModel(
      {required final String id,
      required final String avatar,
      required final String firstname,
      required final String lastname,
      required final String username,
      required final bool verified}) = _$_PublicationUserModel;

  factory _PublicationUserModel.fromJson(Map<String, dynamic> json) =
      _$_PublicationUserModel.fromJson;

  @override
  String get id;
  @override
  String get avatar;
  @override
  String get firstname;
  @override
  String get lastname;
  @override
  String get username;
  @override
  bool get verified;
  @override
  @JsonKey(ignore: true)
  _$$_PublicationUserModelCopyWith<_$_PublicationUserModel> get copyWith =>
      throw _privateConstructorUsedError;
}
