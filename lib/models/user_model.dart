import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class PublicationUserModel with _$PublicationUserModel {
  const factory PublicationUserModel({
    required final String id,
    required final String avatar,
    required final String firstname,
    required final String lastname,
    required final String username,
    required final bool verified,
  }) = _PublicationUserModel;

  factory PublicationUserModel.fromJson(Map<String, Object?> json) => _$PublicationUserModelFromJson(json);
}
