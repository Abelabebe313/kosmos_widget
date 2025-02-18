import 'package:asalema_widgets/models/publication_model.dart';
import 'package:asalema_widgets/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'comment_publication_model.freezed.dart';
part 'comment_publication_model.g.dart';

@unfreezed
class CommentPublicationModel with _$CommentPublicationModel {
  factory CommentPublicationModel({
    required final String id,
    required final String pubid,
    required final PublicationUserModel usermodel,
    @Default([]) List<String>? likedBy,
    @TimestampConverterNotNUllable() required final DateTime date,
    required final bool me,
    required final String comment,
    required int responses,
    required int likes,
    required bool liked,
    String? responseTo,
  }) = _CommentPublicationModel;

  factory CommentPublicationModel.fromJson(Map<String, Object?> json) => _$CommentPublicationModelFromJson(json);
}
