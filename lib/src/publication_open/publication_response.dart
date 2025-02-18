import 'package:asalema_widgets/asalema_widgets.dart';
import 'package:asalema_widgets/freezed/theme_data_provider.dart';
import 'package:asalema_widgets/src/publication_open/future_comment_list.dart';
import 'package:asalema_widgets/src/publication_open/card_comment_publication.dart';
import 'package:asalema_widgets/src/publication_open/globals.dart';
import 'package:asalema_widgets/src/publication_open/widget_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PublicationResponse extends ConsumerStatefulWidget {
  const PublicationResponse({
    Key? key,
    required this.backgroundColor,
    required this.commentPublicationModel,
    required this.locale,
    required this.publicationModelProvider,
    required this.sendMessage,
    required this.sendSvg,
    required this.bottombarController,
    required this.onLike,
    required this.onReport,
    required this.onDelete,
    required this.listCommentModels,
    required this.onClickComment,
    required this.liked,
  }) : super(key: key);

  final Color backgroundColor;
  final bool liked;
  final CommentPublicationModel commentPublicationModel;
  final List<CommentPublicationModel> listCommentModels;

  final Function(
      {required CommentPublicationModel commentPublicationModel,
      required PublicationModel publicationModel}) onClickComment;
  final Function(String, String?, bool, String)? onLike;

  final String locale;
  final PublicationModel publicationModelProvider;

  final Function(String, String?, GlobalKey) sendMessage;
  final Widget sendSvg;
  final TextEditingController bottombarController;

  final Function(String, String?, String)? onReport;
  final Function(String, String?, String)? onDelete;

  @override
  ConsumerState<PublicationResponse> createState() =>
      _PublicationResponseState();
}

class _PublicationResponseState extends ConsumerState<PublicationResponse> {
  final GlobalKey _firstItemKey = GlobalKey();
  final FocusNode _focusNode = FocusNode();
  late Color mainTextColor;

  @override
  void initState() {
    mainTextColor = Colors.white;
    if (widget.backgroundColor.red * 0.299 +
            widget.backgroundColor.green * 0.587 +
            widget.backgroundColor.blue * 0.114 >
        186) {
      mainTextColor = Colors.black;
    }
    super.initState();
  }

  bool handleScrollNotification(ScrollNotification notification) {
    if (notification is ScrollEndNotification) {
      final metrics = notification.metrics;
      if (metrics.atEdge) {
        bool isTop = metrics.pixels == 0;
        if (!isTop) {
          triggerCommentPaginationNotifier();
        }
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        FocusScope.of(context).requestFocus(FocusNode());
      }),
      child: Container(
        color: Colors.black,
        child: Scaffold(
          body: Scaffold(
            backgroundColor: widget.backgroundColor,
            bottomNavigationBar: Container(
              height: 80.h,
              width: double.infinity,
              decoration: ref
                  .watch(themeDataProvider)
                  .themeDataApp
                  .commentBottombarStyle!
                  .decoration,
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
                          widget.sendMessage(text,
                              widget.commentPublicationModel.id, _firstItemKey);
                          _focusNode.requestFocus();
                        }),
                        cursorColor: ref
                            .watch(themeDataProvider)
                            .themeDataApp
                            .commentBottombarStyle!
                            .cursorColor,
                        decoration: ref
                            .watch(themeDataProvider)
                            .themeDataApp
                            .commentBottombarStyle!
                            .inputDecoration,
                        controller: widget.bottombarController,
                      ),
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: IconButton(
                      icon: widget.sendSvg,
                      onPressed: (() {
                        widget.sendMessage(
                          widget.bottombarController.text,
                          widget.commentPublicationModel.id,
                          _firstItemKey,
                        );
                      }),
                      splashRadius: Material.defaultSplashRadius / 1.8,
                    ),
                  )
                ],
              ),
            ),
            body: NotificationListener<ScrollNotification>(
              onNotification: handleScrollNotification,
              child: CustomScrollView(
                cacheExtent: 99999,
                physics: const AlwaysScrollableScrollPhysics(
                    parent: BouncingScrollPhysics()),
                slivers: [
                  SliverAppBar(
                    automaticallyImplyLeading: false,
                    elevation: 0,
                    title: SizedBox(
                      width: double.infinity,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: WidgetBackButton(
                              mapKey: widget.commentPublicationModel.id,
                              bottombarController: widget.bottombarController,
                              backgroundColor: widget.backgroundColor,
                              iconColor: mainTextColor,
                            ),
                          ),
                          Text(
                            'Réponse à',
                            style: TextStyle(
                              color: mainTextColor,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              fontSize: 17.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                    backgroundColor: widget.backgroundColor,
                    pinned: true,
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return index == 0
                            ? Column(
                                children: [
                                  CardCommentPublication(
                                    onClickComment: widget.onClickComment,
                                    onDelete: widget.onDelete,
                                    onReport: widget.onReport,
                                    onLike: widget.onLike,
                                    key: _firstItemKey,
                                    sendMessage: widget.sendMessage,
                                    sendSvg: widget.sendSvg,
                                    bottombarController:
                                        widget.bottombarController,
                                    publicationModelProvider:
                                        widget.publicationModelProvider,
                                    backgroundColor: widget.backgroundColor,
                                    commentPublicationModel:
                                        widget.commentPublicationModel,
                                    locale: widget.locale,
                                    isResponse: true,
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 31.w)
                                            .copyWith(bottom: 14.h),
                                    child: Container(
                                      color: mainTextColor.withOpacity(0.22),
                                      height: 0.5.h,
                                      width: double.infinity,
                                    ),
                                  ),
                                ],
                              )
                            : index == 1
                                ? FutureCommentList(
                                    onClickComment: widget.onClickComment,
                                    listCommentModels: widget.listCommentModels,
                                    onReport: widget.onReport,
                                    onDelete: widget.onDelete,
                                    onLike: widget.onLike,
                                    sendMessage: widget.sendMessage,
                                    sendSvg: widget.sendSvg,
                                    bottombarController:
                                        widget.bottombarController,
                                    locale: widget.locale,
                                    publicationModelProvider:
                                        widget.publicationModelProvider,
                                    commentPublicationModel:
                                        widget.commentPublicationModel,
                                    isResponse: true,
                                  )
                                : const SizedBox();
                      },
                      childCount: 2,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
