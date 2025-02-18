import 'dart:ui';

import 'package:asalema_widgets/asalema_widgets.dart';
import 'package:asalema_widgets/src/publication_open/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

showCommentModal(
  BuildContext context,
  Function(String, String, bool, String)? onLike,
  Function(String, String?, String)? onReport,
  Function(String, String?, String)? onDelete,
  PublicationModel publicationModelProvider,
  CommentPublicationModel commentPublicationModel,
  ModalStyle? modalStyle,
  WidgetRef ref,
  bool liked,
) {
  ModalStyle customStyle = modalStyle ?? ModalStyle();

  return showModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: context,
    builder: (context) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 8.w).copyWith(bottom: 33.h),
        height: 215.h,
        width: double.infinity,
        child: Column(
          children: [
            ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 5,
                  sigmaY: 5,
                ),
                child: Container(
                  height: 151.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: customStyle.backgroundColorTop,
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 39.h,
                        child: Center(
                          child: Text('Que souhaitez-vous faire ?', style: customStyle.titleStyle),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 0.5.h,
                        color: customStyle.spacerColor,
                      ),
                      SizedBox(
                        height: 55.5.h,
                        width: double.infinity,
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: (() async {
                              if (onLike != null) {
                                await onLike(
                                  publicationModelProvider.id,
                                  commentPublicationModel.id,
                                  !liked,
                                  publicationModelProvider.usermodel.id,
                                );
                              }
                              triggerNotifier();
                              Navigator.pop(context);
                            }),
                            child: Center(
                              child: Text(
                                liked ? "Je n'aime plus" : "J'aime",
                                style: customStyle.textStyle1,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 0.5.h,
                        color: customStyle.spacerColor,
                      ),
                      SizedBox(
                        height: 55.5.h,
                        width: double.infinity,
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            customBorder: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(14.r),
                                bottomRight: Radius.circular(14.r),
                              ),
                            ),
                            onTap: (() async {
                              if (onReport != null && commentPublicationModel.me == false) {
                                await onReport(publicationModelProvider.id, commentPublicationModel.id, commentPublicationModel.usermodel.id);
                              } else if (onDelete != null && commentPublicationModel.me == true) {
                                await onDelete(
                                  publicationModelProvider.id,
                                  commentPublicationModel.id,
                                  publicationModelProvider.sharedBy ?? publicationModelProvider.usermodel.id,
                                );
                                triggerNotifier();
                              }

                              Navigator.pop(context);
                            }),
                            child: Center(
                              child: Text(
                                commentPublicationModel.me == true ? 'Supprimer mon commentaire' : 'Signaler',
                                style: customStyle.textStyle2,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 8.h),
            ClipRRect(
              borderRadius: BorderRadius.circular(
                14.r,
              ),
              child: SizedBox(
                height: 56.h,
                width: double.infinity,
                child: Material(
                  color: customStyle.backGroundColorBottom,
                  child: InkWell(
                    onTap: (() {
                      Navigator.pop(context);
                    }),
                    child: Center(
                      child: Text(
                        'Annuler',
                        style: customStyle.textStyleBottom,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

showPublicationModal(
  BuildContext context,
  PublicationModel publicationModelProvider,
  ModalStyle? modalStyle,
  Function(String, String?, String)? onReport,
  Function(String, String?, String)? onDelete,
  Function(String, String)? onPubShare,
  Function(String)? onPubEdit,
  WidgetRef ref,
) {
  ModalStyle customStyle = modalStyle ?? ModalStyle();

  return showModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: context,
    builder: (context) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 8.w).copyWith(bottom: 33.h),
        height: 215.h,
        width: double.infinity,
        child: Column(
          children: [
            ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 5,
                  sigmaY: 5,
                ),
                child: Container(
                  height: 151.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: customStyle.backgroundColorTop,
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 39.h,
                        child: Center(
                          child: Text(
                            'Que souhaitez-vous faire ?',
                            style: customStyle.titleStyle,
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 0.5.h,
                        color: customStyle.spacerColor,
                      ),
                      SizedBox(
                        height: 55.5.h,
                        width: double.infinity,
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: (() async {
                              if (publicationModelProvider.me == false && onPubShare != null) {
                                await onPubShare(
                                  publicationModelProvider.usermodel.id,
                                  publicationModelProvider.id,
                                );
                              } else if (publicationModelProvider.me == true && onPubEdit != null) {
                                await onPubEdit(publicationModelProvider.id);
                              }
                              Navigator.pop(context);
                            }),
                            child: Center(
                              child: Text(
                                publicationModelProvider.me == true ? 'Modifier ma publication' : 'Partager sur mon profil',
                                style: customStyle.textStyle1,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 0.5.h,
                        color: customStyle.spacerColor,
                      ),
                      SizedBox(
                        height: 55.5.h,
                        width: double.infinity,
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            customBorder: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(14.r),
                                bottomRight: Radius.circular(14.r),
                              ),
                            ),
                            onTap: (() async {
                              if (onReport != null && publicationModelProvider.me == false) {
                                await onReport(publicationModelProvider.id, null, publicationModelProvider.usermodel.id);
                              } else if (onDelete != null && publicationModelProvider.me == true) {
                                onDelete(
                                  publicationModelProvider.id,
                                  null,
                                  publicationModelProvider.sharedBy ?? publicationModelProvider.usermodel.id,
                                );
                              }
                              Navigator.pop(context);
                            }),
                            child: Center(
                              child: Text(
                                publicationModelProvider.me == true ? 'Supprimer ma publication' : 'Signaler',
                                style: customStyle.textStyle2,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 8.h),
            ClipRRect(
              borderRadius: BorderRadius.circular(
                14.r,
              ),
              child: SizedBox(
                height: 56.h,
                width: double.infinity,
                child: Material(
                  color: customStyle.backGroundColorBottom,
                  child: InkWell(
                    onTap: (() {
                      Navigator.pop(context);
                    }),
                    child: Center(
                      child: Text(
                        'Annuler',
                        style: customStyle.textStyleBottom,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
