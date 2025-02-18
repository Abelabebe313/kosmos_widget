// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'comment_publication_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CommentPublicationModel _$CommentPublicationModelFromJson(
    Map<String, dynamic> json) {
  return _CommentPublicationModel.fromJson(json);
}

/// @nodoc
mixin _$CommentPublicationModel {
  String get id => throw _privateConstructorUsedError;
  String get pubid => throw _privateConstructorUsedError;
  PublicationUserModel get usermodel => throw _privateConstructorUsedError;
  List<String>? get likedBy => throw _privateConstructorUsedError;
  set likedBy(List<String>? value) => throw _privateConstructorUsedError;
  @TimestampConverterNotNUllable()
  DateTime get date => throw _privateConstructorUsedError;
  bool get me => throw _privateConstructorUsedError;
  String get comment => throw _privateConstructorUsedError;
  int get responses => throw _privateConstructorUsedError;
  set responses(int value) => throw _privateConstructorUsedError;
  int get likes => throw _privateConstructorUsedError;
  set likes(int value) => throw _privateConstructorUsedError;
  bool get liked => throw _privateConstructorUsedError;
  set liked(bool value) => throw _privateConstructorUsedError;
  String? get responseTo => throw _privateConstructorUsedError;
  set responseTo(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommentPublicationModelCopyWith<CommentPublicationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentPublicationModelCopyWith<$Res> {
  factory $CommentPublicationModelCopyWith(CommentPublicationModel value,
          $Res Function(CommentPublicationModel) then) =
      _$CommentPublicationModelCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String pubid,
      PublicationUserModel usermodel,
      List<String>? likedBy,
      @TimestampConverterNotNUllable() DateTime date,
      bool me,
      String comment,
      int responses,
      int likes,
      bool liked,
      String? responseTo});

  $PublicationUserModelCopyWith<$Res> get usermodel;
}

/// @nodoc
class _$CommentPublicationModelCopyWithImpl<$Res>
    implements $CommentPublicationModelCopyWith<$Res> {
  _$CommentPublicationModelCopyWithImpl(this._value, this._then);

  final CommentPublicationModel _value;
  // ignore: unused_field
  final $Res Function(CommentPublicationModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? pubid = freezed,
    Object? usermodel = freezed,
    Object? likedBy = freezed,
    Object? date = freezed,
    Object? me = freezed,
    Object? comment = freezed,
    Object? responses = freezed,
    Object? likes = freezed,
    Object? liked = freezed,
    Object? responseTo = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      pubid: pubid == freezed
          ? _value.pubid
          : pubid // ignore: cast_nullable_to_non_nullable
              as String,
      usermodel: usermodel == freezed
          ? _value.usermodel
          : usermodel // ignore: cast_nullable_to_non_nullable
              as PublicationUserModel,
      likedBy: likedBy == freezed
          ? _value.likedBy
          : likedBy // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      me: me == freezed
          ? _value.me
          : me // ignore: cast_nullable_to_non_nullable
              as bool,
      comment: comment == freezed
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      responses: responses == freezed
          ? _value.responses
          : responses // ignore: cast_nullable_to_non_nullable
              as int,
      likes: likes == freezed
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int,
      liked: liked == freezed
          ? _value.liked
          : liked // ignore: cast_nullable_to_non_nullable
              as bool,
      responseTo: responseTo == freezed
          ? _value.responseTo
          : responseTo // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $PublicationUserModelCopyWith<$Res> get usermodel {
    return $PublicationUserModelCopyWith<$Res>(_value.usermodel, (value) {
      return _then(_value.copyWith(usermodel: value));
    });
  }
}

/// @nodoc
abstract class _$$_CommentPublicationModelCopyWith<$Res>
    implements $CommentPublicationModelCopyWith<$Res> {
  factory _$$_CommentPublicationModelCopyWith(_$_CommentPublicationModel value,
          $Res Function(_$_CommentPublicationModel) then) =
      __$$_CommentPublicationModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String pubid,
      PublicationUserModel usermodel,
      List<String>? likedBy,
      @TimestampConverterNotNUllable() DateTime date,
      bool me,
      String comment,
      int responses,
      int likes,
      bool liked,
      String? responseTo});

  @override
  $PublicationUserModelCopyWith<$Res> get usermodel;
}

/// @nodoc
class __$$_CommentPublicationModelCopyWithImpl<$Res>
    extends _$CommentPublicationModelCopyWithImpl<$Res>
    implements _$$_CommentPublicationModelCopyWith<$Res> {
  __$$_CommentPublicationModelCopyWithImpl(_$_CommentPublicationModel _value,
      $Res Function(_$_CommentPublicationModel) _then)
      : super(_value, (v) => _then(v as _$_CommentPublicationModel));

  @override
  _$_CommentPublicationModel get _value =>
      super._value as _$_CommentPublicationModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? pubid = freezed,
    Object? usermodel = freezed,
    Object? likedBy = freezed,
    Object? date = freezed,
    Object? me = freezed,
    Object? comment = freezed,
    Object? responses = freezed,
    Object? likes = freezed,
    Object? liked = freezed,
    Object? responseTo = freezed,
  }) {
    return _then(_$_CommentPublicationModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      pubid: pubid == freezed
          ? _value.pubid
          : pubid // ignore: cast_nullable_to_non_nullable
              as String,
      usermodel: usermodel == freezed
          ? _value.usermodel
          : usermodel // ignore: cast_nullable_to_non_nullable
              as PublicationUserModel,
      likedBy: likedBy == freezed
          ? _value.likedBy
          : likedBy // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      me: me == freezed
          ? _value.me
          : me // ignore: cast_nullable_to_non_nullable
              as bool,
      comment: comment == freezed
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      responses: responses == freezed
          ? _value.responses
          : responses // ignore: cast_nullable_to_non_nullable
              as int,
      likes: likes == freezed
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int,
      liked: liked == freezed
          ? _value.liked
          : liked // ignore: cast_nullable_to_non_nullable
              as bool,
      responseTo: responseTo == freezed
          ? _value.responseTo
          : responseTo // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CommentPublicationModel
    with DiagnosticableTreeMixin
    implements _CommentPublicationModel {
  _$_CommentPublicationModel(
      {required this.id,
      required this.pubid,
      required this.usermodel,
      this.likedBy = const [],
      @TimestampConverterNotNUllable() required this.date,
      required this.me,
      required this.comment,
      required this.responses,
      required this.likes,
      required this.liked,
      this.responseTo});

  factory _$_CommentPublicationModel.fromJson(Map<String, dynamic> json) =>
      _$$_CommentPublicationModelFromJson(json);

  @override
  final String id;
  @override
  final String pubid;
  @override
  final PublicationUserModel usermodel;
  @override
  @JsonKey()
  List<String>? likedBy;
  @override
  @TimestampConverterNotNUllable()
  final DateTime date;
  @override
  final bool me;
  @override
  final String comment;
  @override
  int responses;
  @override
  int likes;
  @override
  bool liked;
  @override
  String? responseTo;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CommentPublicationModel(id: $id, pubid: $pubid, usermodel: $usermodel, likedBy: $likedBy, date: $date, me: $me, comment: $comment, responses: $responses, likes: $likes, liked: $liked, responseTo: $responseTo)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CommentPublicationModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('pubid', pubid))
      ..add(DiagnosticsProperty('usermodel', usermodel))
      ..add(DiagnosticsProperty('likedBy', likedBy))
      ..add(DiagnosticsProperty('date', date))
      ..add(DiagnosticsProperty('me', me))
      ..add(DiagnosticsProperty('comment', comment))
      ..add(DiagnosticsProperty('responses', responses))
      ..add(DiagnosticsProperty('likes', likes))
      ..add(DiagnosticsProperty('liked', liked))
      ..add(DiagnosticsProperty('responseTo', responseTo));
  }

  @JsonKey(ignore: true)
  @override
  _$$_CommentPublicationModelCopyWith<_$_CommentPublicationModel>
      get copyWith =>
          __$$_CommentPublicationModelCopyWithImpl<_$_CommentPublicationModel>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CommentPublicationModelToJson(
      this,
    );
  }
}

abstract class _CommentPublicationModel implements CommentPublicationModel {
  factory _CommentPublicationModel(
      {required final String id,
      required final String pubid,
      required final PublicationUserModel usermodel,
      List<String>? likedBy,
      @TimestampConverterNotNUllable() required final DateTime date,
      required final bool me,
      required final String comment,
      required int responses,
      required int likes,
      required bool liked,
      String? responseTo}) = _$_CommentPublicationModel;

  factory _CommentPublicationModel.fromJson(Map<String, dynamic> json) =
      _$_CommentPublicationModel.fromJson;

  @override
  String get id;
  @override
  String get pubid;
  @override
  PublicationUserModel get usermodel;
  @override
  List<String>? get likedBy;
  set likedBy(List<String>? value);
  @override
  @TimestampConverterNotNUllable()
  DateTime get date;
  @override
  bool get me;
  @override
  String get comment;
  @override
  int get responses;
  set responses(int value);
  @override
  int get likes;
  set likes(int value);
  @override
  bool get liked;
  set liked(bool value);
  @override
  String? get responseTo;
  set responseTo(String? value);
  @override
  @JsonKey(ignore: true)
  _$$_CommentPublicationModelCopyWith<_$_CommentPublicationModel>
      get copyWith => throw _privateConstructorUsedError;
}
