import 'package:asalema_widgets/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'publication_model.freezed.dart';
part 'publication_model.g.dart';

@unfreezed
class PublicationModel with _$PublicationModel {
  factory PublicationModel({
    required final String id,
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
    @Default([]) List<String>? likedBy,
    String? shareText,
    required int likes,
  }) = _PublicationModel;

  factory PublicationModel.fromJson(Map<String, Object?> json) => _$PublicationModelFromJson(json);
}

class TimestampConverter implements JsonConverter<DateTime?, Timestamp?> {
  const TimestampConverter();

  @override
  DateTime? fromJson(Timestamp? timestamp) {
    return timestamp?.toDate();
  }

  @override
  Timestamp? toJson(DateTime? date) => date != null ? Timestamp.fromDate(date) : null;
}

class TimestampConverterNotNUllable implements JsonConverter<DateTime, Timestamp> {
  const TimestampConverterNotNUllable();

  @override
  DateTime fromJson(Timestamp timestamp) {
    return timestamp.toDate();
  }

  @override
  Timestamp toJson(DateTime date) => Timestamp.fromDate(date);
}
