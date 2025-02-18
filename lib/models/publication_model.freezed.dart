// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'publication_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PublicationModel _$PublicationModelFromJson(Map<String, dynamic> json) {
  return _PublicationModel.fromJson(json);
}

/// @nodoc
mixin _$PublicationModel {
  String get id => throw _privateConstructorUsedError;
  PublicationUserModel get usermodel => throw _privateConstructorUsedError;
  @TimestampConverterNotNUllable()
  DateTime get date => throw _privateConstructorUsedError;
  String get comment => throw _privateConstructorUsedError;
  set comment(String value) => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  String? get imagePath => throw _privateConstructorUsedError;
  String? get playbackId => throw _privateConstructorUsedError;
  String? get video => throw _privateConstructorUsedError;
  int? get color => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  bool get me => throw _privateConstructorUsedError;
  String? get sharedBy => throw _privateConstructorUsedError;
  int get responses => throw _privateConstructorUsedError;
  set responses(int value) => throw _privateConstructorUsedError;
  List<String>? get likedBy => throw _privateConstructorUsedError;
  set likedBy(List<String>? value) => throw _privateConstructorUsedError;
  String? get shareText => throw _privateConstructorUsedError;
  set shareText(String? value) => throw _privateConstructorUsedError;
  int get likes => throw _privateConstructorUsedError;
  set likes(int value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PublicationModelCopyWith<PublicationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PublicationModelCopyWith<$Res> {
  factory $PublicationModelCopyWith(
          PublicationModel value, $Res Function(PublicationModel) then) =
      _$PublicationModelCopyWithImpl<$Res>;
  $Res call(
      {String id,
      PublicationUserModel usermodel,
      @TimestampConverterNotNUllable() DateTime date,
      String comment,
      String? image,
      String? imagePath,
      String? playbackId,
      String? video,
      int? color,
      String type,
      bool me,
      String? sharedBy,
      int responses,
      List<String>? likedBy,
      String? shareText,
      int likes});

  $PublicationUserModelCopyWith<$Res> get usermodel;
}

/// @nodoc
class _$PublicationModelCopyWithImpl<$Res>
    implements $PublicationModelCopyWith<$Res> {
  _$PublicationModelCopyWithImpl(this._value, this._then);

  final PublicationModel _value;
  // ignore: unused_field
  final $Res Function(PublicationModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? usermodel = freezed,
    Object? date = freezed,
    Object? comment = freezed,
    Object? image = freezed,
    Object? imagePath = freezed,
    Object? playbackId = freezed,
    Object? video = freezed,
    Object? color = freezed,
    Object? type = freezed,
    Object? me = freezed,
    Object? sharedBy = freezed,
    Object? responses = freezed,
    Object? likedBy = freezed,
    Object? shareText = freezed,
    Object? likes = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      usermodel: usermodel == freezed
          ? _value.usermodel
          : usermodel // ignore: cast_nullable_to_non_nullable
              as PublicationUserModel,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      comment: comment == freezed
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      imagePath: imagePath == freezed
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      playbackId: playbackId == freezed
          ? _value.playbackId
          : playbackId // ignore: cast_nullable_to_non_nullable
              as String?,
      video: video == freezed
          ? _value.video
          : video // ignore: cast_nullable_to_non_nullable
              as String?,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      me: me == freezed
          ? _value.me
          : me // ignore: cast_nullable_to_non_nullable
              as bool,
      sharedBy: sharedBy == freezed
          ? _value.sharedBy
          : sharedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      responses: responses == freezed
          ? _value.responses
          : responses // ignore: cast_nullable_to_non_nullable
              as int,
      likedBy: likedBy == freezed
          ? _value.likedBy
          : likedBy // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      shareText: shareText == freezed
          ? _value.shareText
          : shareText // ignore: cast_nullable_to_non_nullable
              as String?,
      likes: likes == freezed
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int,
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
abstract class _$$_PublicationModelCopyWith<$Res>
    implements $PublicationModelCopyWith<$Res> {
  factory _$$_PublicationModelCopyWith(
          _$_PublicationModel value, $Res Function(_$_PublicationModel) then) =
      __$$_PublicationModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      PublicationUserModel usermodel,
      @TimestampConverterNotNUllable() DateTime date,
      String comment,
      String? image,
      String? imagePath,
      String? playbackId,
      String? video,
      int? color,
      String type,
      bool me,
      String? sharedBy,
      int responses,
      List<String>? likedBy,
      String? shareText,
      int likes});

  @override
  $PublicationUserModelCopyWith<$Res> get usermodel;
}

/// @nodoc
class __$$_PublicationModelCopyWithImpl<$Res>
    extends _$PublicationModelCopyWithImpl<$Res>
    implements _$$_PublicationModelCopyWith<$Res> {
  __$$_PublicationModelCopyWithImpl(
      _$_PublicationModel _value, $Res Function(_$_PublicationModel) _then)
      : super(_value, (v) => _then(v as _$_PublicationModel));

  @override
  _$_PublicationModel get _value => super._value as _$_PublicationModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? usermodel = freezed,
    Object? date = freezed,
    Object? comment = freezed,
    Object? image = freezed,
    Object? imagePath = freezed,
    Object? playbackId = freezed,
    Object? video = freezed,
    Object? color = freezed,
    Object? type = freezed,
    Object? me = freezed,
    Object? sharedBy = freezed,
    Object? responses = freezed,
    Object? likedBy = freezed,
    Object? shareText = freezed,
    Object? likes = freezed,
  }) {
    return _then(_$_PublicationModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      usermodel: usermodel == freezed
          ? _value.usermodel
          : usermodel // ignore: cast_nullable_to_non_nullable
              as PublicationUserModel,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      comment: comment == freezed
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      imagePath: imagePath == freezed
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      playbackId: playbackId == freezed
          ? _value.playbackId
          : playbackId // ignore: cast_nullable_to_non_nullable
              as String?,
      video: video == freezed
          ? _value.video
          : video // ignore: cast_nullable_to_non_nullable
              as String?,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      me: me == freezed
          ? _value.me
          : me // ignore: cast_nullable_to_non_nullable
              as bool,
      sharedBy: sharedBy == freezed
          ? _value.sharedBy
          : sharedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      responses: responses == freezed
          ? _value.responses
          : responses // ignore: cast_nullable_to_non_nullable
              as int,
      likedBy: likedBy == freezed
          ? _value.likedBy
          : likedBy // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      shareText: shareText == freezed
          ? _value.shareText
          : shareText // ignore: cast_nullable_to_non_nullable
              as String?,
      likes: likes == freezed
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PublicationModel
    with DiagnosticableTreeMixin
    implements _PublicationModel {
  _$_PublicationModel(
      {required this.id,
      required this.usermodel,
      @TimestampConverterNotNUllable() required this.date,
      required this.comment,
      this.image,
      this.imagePath,
      this.playbackId,
      this.video,
      this.color,
      required this.type,
      required this.me,
      required this.sharedBy,
      required this.responses,
      this.likedBy = const [],
      this.shareText,
      required this.likes});

  factory _$_PublicationModel.fromJson(Map<String, dynamic> json) =>
      _$$_PublicationModelFromJson(json);

  @override
  final String id;
  @override
  final PublicationUserModel usermodel;
  @override
  @TimestampConverterNotNUllable()
  final DateTime date;
  @override
  String comment;
  @override
  final String? image;
  @override
  final String? imagePath;
  @override
  final String? playbackId;
  @override
  final String? video;
  @override
  final int? color;
  @override
  final String type;
  @override
  final bool me;
  @override
  final String? sharedBy;
  @override
  int responses;
  @override
  @JsonKey()
  List<String>? likedBy;
  @override
  String? shareText;
  @override
  int likes;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PublicationModel(id: $id, usermodel: $usermodel, date: $date, comment: $comment, image: $image, imagePath: $imagePath, playbackId: $playbackId, video: $video, color: $color, type: $type, me: $me, sharedBy: $sharedBy, responses: $responses, likedBy: $likedBy, shareText: $shareText, likes: $likes)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PublicationModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('usermodel', usermodel))
      ..add(DiagnosticsProperty('date', date))
      ..add(DiagnosticsProperty('comment', comment))
      ..add(DiagnosticsProperty('image', image))
      ..add(DiagnosticsProperty('imagePath', imagePath))
      ..add(DiagnosticsProperty('playbackId', playbackId))
      ..add(DiagnosticsProperty('video', video))
      ..add(DiagnosticsProperty('color', color))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('me', me))
      ..add(DiagnosticsProperty('sharedBy', sharedBy))
      ..add(DiagnosticsProperty('responses', responses))
      ..add(DiagnosticsProperty('likedBy', likedBy))
      ..add(DiagnosticsProperty('shareText', shareText))
      ..add(DiagnosticsProperty('likes', likes));
  }

  @JsonKey(ignore: true)
  @override
  _$$_PublicationModelCopyWith<_$_PublicationModel> get copyWith =>
      __$$_PublicationModelCopyWithImpl<_$_PublicationModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PublicationModelToJson(
      this,
    );
  }
}

abstract class _PublicationModel implements PublicationModel {
  factory _PublicationModel(
      {required final String id,
      required final PublicationUserModel usermodel,
      @TimestampConverterNotNUllable() required final DateTime date,
      required String comment,
      final String? image,
      final String? imagePath,
      final String? playbackId,
      final String? video,
      final int? color,
      required final String type,
      required final bool me,
      required final String? sharedBy,
      required int responses,
      List<String>? likedBy,
      String? shareText,
      required int likes}) = _$_PublicationModel;

  factory _PublicationModel.fromJson(Map<String, dynamic> json) =
      _$_PublicationModel.fromJson;

  @override
  String get id;
  @override
  PublicationUserModel get usermodel;
  @override
  @TimestampConverterNotNUllable()
  DateTime get date;
  @override
  String get comment;
  set comment(String value);
  @override
  String? get image;
  @override
  String? get imagePath;
  @override
  String? get playbackId;
  @override
  String? get video;
  @override
  int? get color;
  @override
  String get type;
  @override
  bool get me;
  @override
  String? get sharedBy;
  @override
  int get responses;
  set responses(int value);
  @override
  List<String>? get likedBy;
  set likedBy(List<String>? value);
  @override
  String? get shareText;
  set shareText(String? value);
  @override
  int get likes;
  set likes(int value);
  @override
  @JsonKey(ignore: true)
  _$$_PublicationModelCopyWith<_$_PublicationModel> get copyWith =>
      throw _privateConstructorUsedError;
}
