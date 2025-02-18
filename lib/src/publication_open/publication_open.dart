import 'package:asalema_widgets/asalema_widgets.dart';
import 'package:asalema_widgets/freezed/theme_data_provider.dart';
import 'package:asalema_widgets/src/publication_open/globals.dart';
import 'package:asalema_widgets/src/publication_open/image_publication_open.dart';
import 'package:asalema_widgets/src/publication_open/text_publication_open.dart';
import 'package:asalema_widgets/src/publication_open/video_publication_open.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PublicationOpen extends ConsumerWidget {
  const PublicationOpen({
    Key? key,
    required this.publicationModelProvider,
    required this.onLike,
    required this.onLikeComment,
    required this.locale,
    required this.onSend,
    required this.bottombarController,
    required this.onRefresh,
    required this.onPop,
    required this.onReport,
    required this.onDelete,
    required this.onPubShare,
    required this.onPubEdit,
    required this.onAvatarTap,
    required this.listCommentModels,
    required this.itemFetchCount,
    required this.onClickComment,
    required this.liked,
    this.bottomImageWidget,
    this.imageColor,
  }) : super(key: key);

  final PublicationModel publicationModelProvider;
  final bool liked;
  final List<CommentPublicationModel> listCommentModels;

  final Function(String)? onPubEdit;
  final Widget? bottomImageWidget;
  final String locale;
  final Color? imageColor;

  final Function(String, String?, bool, String)? onLike;
  final Function(String, String?, bool, String)? onLikeComment;
  final Function(String, String?, String, String)? onSend;
  final TextEditingController bottombarController;
  final Future<void> Function(String id) onRefresh;
  final Function(
      {required CommentPublicationModel commentPublicationModel,
      required PublicationModel publicationModel}) onClickComment;

  final Function(String?)? onPop;

  final Function(String, String?, String)? onReport;
  final Function(String, String?, String)? onDelete;
  final Function(String, String)? onPubShare;

  final Function(String)? onAvatarTap;
  final int itemFetchCount;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CommentBottombarStyle style =
        ref.watch(themeDataProvider).themeDataApp.commentBottombarStyle ??
            CommentBottombarStyle();

    Color mainTextColor = Colors.white;
    if (style.backgroundColor.red * 0.299 +
            style.backgroundColor.green * 0.587 +
            style.backgroundColor.blue * 0.114 >
        186) {
      mainTextColor = const Color(0xFF02132B);
    }

    Widget sendSvg = SvgPicture.asset(
      'assets/arrowsend.svg',
      semanticsLabel: 'ArrowSend Icon',
      package: 'asalema_widgets',
      height: 23.5.w,
      width: 23.5.w,
      color: mainTextColor,
    );

    GlobalKey _firstItemKey = GlobalKey();

    void sendMessage(
        String text, String? responseTo, GlobalKey firstItemKey) async {
      if (onSend != null && text.isNotEmpty) {
        await onSend!(
          publicationModelProvider.id,
          responseTo,
          text,
          publicationModelProvider.sharedBy ??
              publicationModelProvider.usermodel.id,
        );
        bottombarController.clear();
        triggerNotifier();
        if (firstItemKey.currentContext != null) {
          Scrollable.ensureVisible(
            firstItemKey.currentContext!,
            curve: Curves.easeOutExpo,
            duration: const Duration(milliseconds: 500),
          );
        }
      }
    }

    FocusNode _focusNode = FocusNode();

    return WillPopScope(
      onWillPop: (() async {
        bottombarController.clear();
        if (onPop != null) {
          onPop!(publicationModelProvider.id);
        }
        return true;
      }),
      child: GestureDetector(
        onTap: (() {
          FocusScope.of(context).requestFocus(FocusNode());
        }),
        child: Container(
          color: Colors.black,
          child: Scaffold(
            body: Scaffold(
              backgroundColor:
                  ref.watch(themeDataProvider).themeDataApp.backgroundColor,
              bottomNavigationBar: Container(
                height: 80.h,
                width: double.infinity,
                decoration: style.decoration,
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 9.w),
                      child: SizedBox(
                        width: 301.w,
                        height: 48.h,
                        child: TextField(
                          focusNode: _focusNode,
                          onSubmitted: ((text) {
                            sendMessage(text, null, _firstItemKey);
                            _focusNode.requestFocus();
                          }),
                          cursorColor: style.cursorColor,
                          decoration: style.inputDecoration,
                          controller: bottombarController,
                        ),
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: IconButton(
                        icon: sendSvg,
                        onPressed: (() {
                          sendMessage(
                              bottombarController.text, null, _firstItemKey);
                        }),
                        splashRadius: Material.defaultSplashRadius / 1.8,
                      ),
                    ),
                  ],
                ),
              ),
              body: publicationModelProvider.type == 'text'
                  ? TextPublicationOpen(
                      onLikeComment: onLikeComment,
                      liked: liked,
                      onClickComment: onClickComment,
                      listCommentModels: listCommentModels,
                      itemFetchCount: itemFetchCount,
                      onAvatarTap: onAvatarTap,
                      onPubEdit: onPubEdit,
                      onPubShare: onPubShare,
                      onDelete: onDelete,
                      onReport: onReport,
                      onPop: onPop,
                      sendMessage: sendMessage,
                      sendSvg: sendSvg,
                      bottombarController: bottombarController,
                      locale: locale,
                      publicationModelProvider: publicationModelProvider,
                      onLike: onLike,
                      firstItemKey: _firstItemKey,
                      onRefresh: onRefresh,
                    )
                  : publicationModelProvider.type == 'image'
                      ? ImagePublicationOpen(
                          imageBottomWidget: bottomImageWidget,
                          onLikeComment: onLikeComment,
                          liked: liked,
                          onClickComment: onClickComment,
                          listCommentModels: listCommentModels,
                          itemFetchCount: itemFetchCount,
                          publicationModelProvider: publicationModelProvider,
                          onAvatarTap: onAvatarTap,
                          onPubEdit: onPubEdit,
                          onPubShare: onPubShare,
                          onPop: onPop,
                          sendMessage: sendMessage,
                          sendSvg: sendSvg,
                          bottombarController: bottombarController,
                          onLike: onLike,
                          locale: locale,
                          firstItemKey: _firstItemKey,
                          onRefresh: onRefresh,
                          onDelete: onDelete,
                          onReport: onReport,
                        )
                      : publicationModelProvider.type == 'video'
                          ? VideoPublicationOpen(
                              onLikeComment: onLikeComment,
                              liked: liked,
                              onClickComment: onClickComment,
                              listCommentModels: listCommentModels,
                              itemFetchCount: itemFetchCount,
                              publicationModelProvider:
                                  publicationModelProvider,
                              onAvatarTap: onAvatarTap,
                              onPubEdit: onPubEdit,
                              onPubShare: onPubShare,
                              onPop: onPop,
                              backgroundColor: ref
                                      .watch(themeDataProvider)
                                      .themeDataApp
                                      .backgroundColor ??
                                  Colors.transparent,
                              sendMessage: sendMessage,
                              sendSvg: sendSvg,
                              bottombarController: bottombarController,
                              imageColor: imageColor,
                              onLike: onLike,
                              locale: locale,
                              firstItemKey: _firstItemKey,
                              onRefresh: onRefresh,
                              onDelete: onDelete,
                              onReport: onReport,
                            )
                          : const SizedBox(),
            ),
          ),
        ),
      ),
    );
  }
}
