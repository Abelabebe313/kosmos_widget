import 'package:asalema_widgets/asalema_widgets.dart';
import 'package:asalema_widgets/freezed/theme_data_provider.dart';
import 'package:asalema_widgets/src/publication_open/globals.dart';
import 'package:asalema_widgets/src/publication_open/modals.dart';
import 'package:asalema_widgets/src/publication_open/publication_response.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardCommentPublication extends ConsumerWidget {
  const CardCommentPublication({
    Key? key,
    required this.publicationModelProvider,
    required this.onLike,
    required this.locale,
    required this.backgroundColor,
    required this.isResponse,
    required this.commentPublicationModel,
    required this.sendMessage,
    required this.sendSvg,
    required this.bottombarController,
    required this.onReport,
    required this.onDelete,
    required this.onClickComment,
  }) : super(key: key);

  final Function(String, String?, bool, String)? onLike;
  final PublicationModel publicationModelProvider;
  final String locale;

  final Color backgroundColor;
  final bool isResponse;

  final CommentPublicationModel commentPublicationModel;
  final Function(String, String?, GlobalKey) sendMessage;
  final Widget sendSvg;
  final TextEditingController bottombarController;
  final Function(String, String?, String)? onReport;
  final Function({
    required PublicationModel publicationModel,
    required CommentPublicationModel commentPublicationModel,
  }) onClickComment;
  final Function(String, String?, String)? onDelete;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CommentPublicationStyle style =
        ref.watch(themeDataProvider).themeDataApp.commentPublicationStyle ??
            CommentPublicationStyle();

    Widget verifiedSvg = SvgPicture.asset(
      'assets/pubverified.svg',
      semanticsLabel: 'PubVerified Icon',
      package: 'asalema_widgets',
      height: 14.w,
      width: 14.w,
    );

    Color mainTextColor = Colors.white;
    if (style.backgroundColor.red * 0.299 +
            style.backgroundColor.green * 0.587 +
            style.backgroundColor.blue * 0.114 >
        186) {
      mainTextColor = const Color(0xFF02132B);
    }

    Color mainTextColorMe = Colors.white;
    if (style.backgroundColorMe.red * 0.299 +
            style.backgroundColorMe.green * 0.587 +
            style.backgroundColorMe.blue * 0.114 >
        186) {
      mainTextColorMe = const Color(0xFF02132B);
    }

    return GestureDetector(
      onTap: (() {
        if (!isResponse) {
          FocusScope.of(context).unfocus();
          bottombarController.clear();
          onClickComment(
            publicationModel: publicationModelProvider,
            commentPublicationModel: commentPublicationModel,
          );
          // Navigator.push(
          //   context,
          //   PageTransition(
          //     duration: const Duration(milliseconds: 200),
          //     reverseDuration: const Duration(milliseconds: 200),
          //     type: PageTransitionType.rightToLeftWithFade,
          //     child: PublicationResponse(
          //       itemFetchCount: itemFetchCount,
          //       onRefresh: onRefresh,
          //       onDelete: onDelete,
          //       onReport: onReport,
          //       onLike: onLike,
          //       onPop: onPop,
          //       publicationModelProvider: publicationModelProvider,
          //       commentPublicationModel: commentPublicationModel,
          //       locale: locale,
          //       backgroundColor: backgroundColor,
          //       bottombarController: bottombarController,
          //       sendSvg: sendSvg,
          //       sendMessage: sendMessage,
          //     ),
          //   ),
          // );
        }
      }),
      child: Padding(
        padding: isResponse
            ? EdgeInsets.fromLTRB(23.w, 0, 23.w, 26.h)
            : EdgeInsets.fromLTRB(19.w, 0, 19.w, 14.h),
        child: !commentPublicationModel.me
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  isResponse
                      ? const SizedBox()
                      : Padding(
                          padding: EdgeInsets.only(bottom: 9.h, right: 14.w),
                          child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: 18.r,
                            backgroundImage: const AssetImage(
                              'assets/placeholderavatar.png',
                              package: 'asalema_widgets',
                            ),
                            foregroundImage: CachedNetworkImageProvider(
                                commentPublicationModel.usermodel.avatar),
                          ),
                        ),
                  Flexible(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(16.5.w, 10.h, 12.5.w, 12.h),
                      width: isResponse ? double.infinity : 239.w,
                      decoration: style.decoration,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                constraints: BoxConstraints(
                                    maxWidth: isResponse ? 220.w : 130.w),
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    commentPublicationModel
                                            .usermodel.firstname +
                                        ' ' +
                                        commentPublicationModel
                                            .usermodel.lastname,
                                    style: style.titleStyle,
                                  ),
                                ),
                              ),
                              SizedBox(width: 5.w),
                              if (ref
                                  .watch(themeDataProvider)
                                  .themeDataApp
                                  .useCheck)
                                verifiedSvg,
                              const Spacer(),
                              Timeago(
                                builder: ((context, str) {
                                  return Text(
                                    str,
                                    style: style.dateStyle,
                                  );
                                }),
                                date: commentPublicationModel.date,
                                locale: locale,
                              ),
                            ],
                          ),
                          SizedBox(height: 7.h),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(right: 40.5.w),
                              child: Text(
                                commentPublicationModel.comment,
                                style: style.commentStyle,
                              ),
                            ),
                          ),
                          SizedBox(height: 8.5.h),
                          Container(
                            height: 0.5.h,
                            color: mainTextColor.withOpacity(0.20),
                          ),
                          SizedBox(height: 6.5.h),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              if (commentPublicationModel.responseTo ==
                                  null) ...[
                                CardResponsesCount(
                                  commentPublicationModel:
                                      commentPublicationModel,
                                  style: style.socialStyle,
                                ),
                                SizedBox(width: 7.w),
                                Container(
                                  width: 3.w,
                                  height: 3.w,
                                  decoration: BoxDecoration(
                                    color: mainTextColor.withOpacity(0.45),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                SizedBox(width: 7.w),
                              ],
                              CardLike(
                                publicationModelProvider:
                                    publicationModelProvider,
                                commentPublicationModel:
                                    commentPublicationModel,
                                onLike: onLike,
                                socialStyle: style.socialStyle,
                                liked: commentPublicationModel.liked,
                              ),
                              const Spacer(),
                              !isResponse
                                  ? Transform.translate(
                                      offset: Offset(8.w, 0),
                                      child: Material(
                                        color: Colors.transparent,
                                        child: IconButton(
                                          splashRadius: 12.r,
                                          padding: EdgeInsets.zero,
                                          constraints: const BoxConstraints(),
                                          icon: SvgPicture.asset(
                                            'assets/pubsettings.svg',
                                            semanticsLabel: 'ComSettings Icon',
                                            package: 'asalema_widgets',
                                            height: 9.h,
                                            width: 3.w,
                                            fit: BoxFit.contain,
                                            color: style.socialStyle!.color,
                                          ),
                                          onPressed: (() {
                                            showCommentModal(
                                                context,
                                                onLike,
                                                onReport,
                                                onDelete,
                                                publicationModelProvider,
                                                commentPublicationModel,
                                                ref
                                                    .watch(themeDataProvider)
                                                    .themeDataApp
                                                    .modalStyle,
                                                ref,
                                                commentPublicationModel.liked);
                                          }),
                                        ),
                                      ),
                                    )
                                  : const SizedBox(),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Flexible(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(16.5.w, 10.h, 12.5.w, 12.h),
                      width: isResponse ? double.infinity : 239.w,
                      decoration: style.decorationMe,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Timeago(
                                builder: ((context, str) {
                                  return Text(
                                    str,
                                    style: style.dateStyleMe,
                                  );
                                }),
                                date: commentPublicationModel.date,
                                locale: locale,
                              ),
                              const Spacer(),
                              if (ref
                                  .watch(themeDataProvider)
                                  .themeDataApp
                                  .useCheck)
                                verifiedSvg,
                              SizedBox(width: 5.w),
                              Container(
                                constraints: BoxConstraints(
                                    maxWidth: isResponse ? 220.w : 130.w),
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    commentPublicationModel
                                            .usermodel.firstname +
                                        ' ' +
                                        commentPublicationModel
                                            .usermodel.lastname,
                                    style: style.titleStyleMe,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 7.h),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: EdgeInsets.only(left: 40.5.w),
                              child: Text(
                                commentPublicationModel.comment,
                                style: style.commentStyleMe,
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ),
                          SizedBox(height: 8.5.h),
                          Container(
                            height: 0.5.h,
                            color: mainTextColorMe.withOpacity(0.20),
                          ),
                          SizedBox(height: 6.5.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              !isResponse
                                  ? Transform.translate(
                                      offset: Offset(-8.w, 0),
                                      child: Container(
                                        color: Colors.transparent,
                                        child: IconButton(
                                          splashRadius: 12.r,
                                          padding: EdgeInsets.zero,
                                          constraints: const BoxConstraints(),
                                          icon: SvgPicture.asset(
                                            'assets/pubsettings.svg',
                                            semanticsLabel: 'ComSettings Icon',
                                            package: 'asalema_widgets',
                                            height: 9.h,
                                            width: 3.w,
                                            fit: BoxFit.contain,
                                            color: style.socialStyleMe!.color,
                                          ),
                                          onPressed: (() {
                                            showCommentModal(
                                                context,
                                                onLike,
                                                onReport,
                                                onDelete,
                                                publicationModelProvider,
                                                commentPublicationModel,
                                                ref
                                                    .watch(themeDataProvider)
                                                    .themeDataApp
                                                    .modalStyle,
                                                ref,
                                                commentPublicationModel.liked);
                                          }),
                                        ),
                                      ),
                                    )
                                  : const SizedBox(),
                              const Spacer(),
                              CardLike(
                                publicationModelProvider:
                                    publicationModelProvider,
                                commentPublicationModel:
                                    commentPublicationModel,
                                onLike: onLike,
                                socialStyle: style.socialStyleMe,
                                liked: commentPublicationModel.liked,
                              ),
                              if (commentPublicationModel.responseTo ==
                                  null) ...[
                                SizedBox(width: 7.w),
                                Container(
                                  width: 3.w,
                                  height: 3.w,
                                  decoration: BoxDecoration(
                                    color: mainTextColorMe.withOpacity(0.45),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                SizedBox(width: 7.w),
                                CardResponsesCount(
                                  commentPublicationModel:
                                      commentPublicationModel,
                                  style: style.socialStyleMe,
                                ),
                              ]
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  isResponse
                      ? const SizedBox()
                      : Padding(
                          padding: EdgeInsets.only(bottom: 9.h, left: 14.w),
                          child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: 18.r,
                            backgroundImage: const AssetImage(
                              'assets/placeholderavatar.png',
                              package: 'asalema_widgets',
                            ),
                            foregroundImage: CachedNetworkImageProvider(
                                commentPublicationModel.usermodel.avatar),
                          ),
                        ),
                ],
              ),
      ),
    );
  }
}

class CardLike extends ConsumerStatefulWidget {
  const CardLike({
    Key? key,
    required this.liked,
    required this.publicationModelProvider,
    required this.commentPublicationModel,
    required this.socialStyle,
    required this.onLike,
  }) : super(key: key);

  final CommentPublicationModel commentPublicationModel;
  final PublicationModel publicationModelProvider;
  final TextStyle? socialStyle;
  final bool liked;
  final Function(String, String?, bool, String)? onLike;

  @override
  ConsumerState<CardLike> createState() => _CardLikeState();
}

class _CardLikeState extends ConsumerState<CardLike> {
  @override
  Widget build(BuildContext context) {
    TextStyle? likesStyle = widget.socialStyle;
    if (widget.liked) {
      likesStyle = likesStyle?.copyWith(color: const Color(0xFFF54458));
    }
    return GestureDetector(
      onTap: () async {
        if (widget.onLike != null) {
          await widget.onLike!(
              widget.publicationModelProvider.id,
              widget.commentPublicationModel.id,
              !widget.liked,
              widget.commentPublicationModel.usermodel.id);
        }
      },
      child: Text(
        widget.commentPublicationModel.likes.toString() +
            (widget.commentPublicationModel.likes > 1 ? " j'aimes" : " j'aime"),
        style: likesStyle,
      ),
    );
  }
}

class CardResponsesCount extends StatefulWidget {
  const CardResponsesCount({
    Key? key,
    required this.commentPublicationModel,
    required this.style,
  }) : super(key: key);

  final CommentPublicationModel commentPublicationModel;
  final TextStyle? style;

  @override
  State<CardResponsesCount> createState() => _CardResponsesCountState();
}

class _CardResponsesCountState extends State<CardResponsesCount> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.commentPublicationModel.responses.toString() +
          (widget.commentPublicationModel.responses > 1
              ? ' réponses'
              : ' réponse'),
      style: widget.style,
    );
  }
}
