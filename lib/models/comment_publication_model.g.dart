// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_publication_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CommentPublicationModel _$$_CommentPublicationModelFromJson(
        Map<String, dynamic> json) =>
    _$_CommentPublicationModel(
      id: json['id'] as String,
      pubid: json['pubid'] as String,
      usermodel: PublicationUserModel.fromJson(
          json['usermodel'] as Map<String, dynamic>),
      likedBy: (json['likedBy'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      date: const TimestampConverterNotNUllable()
          .fromJson(json['date'] as Timestamp),
      me: json['me'] as bool,
      comment: json['comment'] as String,
      responses: json['responses'] as int,
      likes: json['likes'] as int,
      liked: json['liked'] as bool,
      responseTo: json['responseTo'] as String?,
    );

Map<String, dynamic> _$$_CommentPublicationModelToJson(
        _$_CommentPublicationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'pubid': instance.pubid,
      'usermodel': instance.usermodel,
      'likedBy': instance.likedBy,
      'date': const TimestampConverterNotNUllable().toJson(instance.date),
      'me': instance.me,
      'comment': instance.comment,
      'responses': instance.responses,
      'likes': instance.likes,
      'liked': instance.liked,
      'responseTo': instance.responseTo,
    };
