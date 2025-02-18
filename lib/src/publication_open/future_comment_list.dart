import 'package:asalema_widgets/asalema_widgets.dart';
import 'package:asalema_widgets/freezed/theme_data_provider.dart';
import 'package:asalema_widgets/models/comment_publication_model.dart';
import 'package:asalema_widgets/models/publication_model.dart';
import 'package:asalema_widgets/src/publication_open/card_comment_publication.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class FutureCommentList extends ConsumerStatefulWidget {
  const FutureCommentList({
    Key? key,
    required this.locale,
    required this.publicationModelProvider,
    required this.isResponse,
    this.commentPublicationModel,
    required this.sendMessage,
    required this.sendSvg,
    required this.bottombarController,
    required this.onLike,
    required this.onReport,
    required this.onDelete,
    required this.listCommentModels,
    required this.onClickComment,
  }) : super(key: key);

  final String locale;

  final Function({required CommentPublicationModel commentPublicationModel, required PublicationModel publicationModel})
      onClickComment;
  final CommentPublicationModel? commentPublicationModel;
  final Function(String, String?, bool, String)? onLike;
  final PublicationModel publicationModelProvider;
  final List<CommentPublicationModel> listCommentModels;
  final bool isResponse;
  final Function(String, String?, GlobalKey) sendMessage;
  final Widget sendSvg;
  final TextEditingController bottombarController;
  final Function(String, String?, String)? onReport;
  final Function(String, String?, String)? onDelete;

  @override
  ConsumerState<FutureCommentList> createState() => _FutureCommentListState();
}

class _FutureCommentListState extends ConsumerState<FutureCommentList> {
  bool isLoading = true;
  bool showLoader = true;

  int prevModelListSize = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: widget.listCommentModels.length + 1,
        itemBuilder: (context, index) {
          if (index == widget.listCommentModels.length) {
            return showLoader == true
                ? Padding(
                    padding: EdgeInsets.symmetric(vertical: 25.h),
                    child: SizedBox(
                      width: double.infinity,
                      height: 80.h,
                      child: Center(
                        child: SpinKitRing(
                          color: ref.watch(themeDataProvider).themeDataApp.spinnerColor ?? Colors.transparent,
                        ),
                      ),
                    ),
                  )
                : const SizedBox();
          } else {
            return CardCommentPublication(
              onClickComment: widget.onClickComment,
              backgroundColor: Colors.white,
              onLike: widget.onLike,
              sendMessage: widget.sendMessage,
              sendSvg: widget.sendSvg,
              bottombarController: widget.bottombarController,
              publicationModelProvider: widget.publicationModelProvider,
              commentPublicationModel: widget.listCommentModels[index],
              locale: widget.locale,
              isResponse: false,
              onDelete: widget.onDelete,
              onReport: widget.onReport,
            );
          }
        },
      ),
    );
  }
}
