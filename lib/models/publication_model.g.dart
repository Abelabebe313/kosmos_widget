// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'publication_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PublicationModel _$$_PublicationModelFromJson(Map<String, dynamic> json) =>
    _$_PublicationModel(
      id: json['id'] as String,
      usermodel: PublicationUserModel.fromJson(
          json['usermodel'] as Map<String, dynamic>),
      date: const TimestampConverterNotNUllable()
          .fromJson(json['date'] as Timestamp),
      comment: json['comment'] as String,
      image: json['image'] as String?,
      imagePath: json['imagePath'] as String?,
      playbackId: json['playbackId'] as String?,
      video: json['video'] as String?,
      color: json['color'] as int?,
      type: json['type'] as String,
      me: json['me'] as bool,
      sharedBy: json['sharedBy'] as String?,
      responses: json['responses'] as int,
      likedBy: (json['likedBy'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      shareText: json['shareText'] as String?,
      likes: json['likes'] as int,
    );

Map<String, dynamic> _$$_PublicationModelToJson(_$_PublicationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'usermodel': instance.usermodel,
      'date': const TimestampConverterNotNUllable().toJson(instance.date),
      'comment': instance.comment,
      'image': instance.image,
      'imagePath': instance.imagePath,
      'playbackId': instance.playbackId,
      'video': instance.video,
      'color': instance.color,
      'type': instance.type,
      'me': instance.me,
      'sharedBy': instance.sharedBy,
      'responses': instance.responses,
      'likedBy': instance.likedBy,
      'shareText': instance.shareText,
      'likes': instance.likes,
    };
