import 'package:asalema_widgets/asalema_widgets.dart';
import 'package:asalema_widgets/freezed/theme_data_provider.dart';
import 'package:asalema_widgets/src/publication_open/future_comment_list.dart';
import 'package:asalema_widgets/utils/text_style_builder.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PublicationOpenContent extends ConsumerStatefulWidget {
  const PublicationOpenContent({
    Key? key,
    required this.publicationModelProvider,
    required this.onLike,
    required this.locale,
    required this.backgroundColor,
    required this.firstItemKey,
    required this.sendMessage,
    required this.sendSvg,
    required this.bottombarController,
    required this.onPop,
    required this.onDelete,
    required this.onReport,
    required this.onRefresh,
    required this.onAvatarTap,
    required this.itemFetchCount,
    required this.listCommentModels,
    required this.onClickComment,
    required this.liked,
    required this.onLikeComment,
  }) : super(key: key);

  final PublicationModel publicationModelProvider;
  final bool liked;
  final Function(String, String?, bool, String)? onLike;
  final Function(String, String?, bool, String)? onLikeComment;
  final String locale;
  final Color backgroundColor;
  final List<CommentPublicationModel> listCommentModels;
  final Function(
      {required CommentPublicationModel commentPublicationModel,
      required PublicationModel publicationModel}) onClickComment;

  final GlobalKey firstItemKey;

  final Function(String, String?, GlobalKey) sendMessage;
  final Widget sendSvg;
  final TextEditingController bottombarController;
  final Function(String?)? onPop;

  final Function(String, String?, String)? onReport;
  final Function(String, String?, String)? onDelete;
  final Future<void> Function(String id) onRefresh;

  final Function(String)? onAvatarTap;
  final int itemFetchCount;

  @override
  ConsumerState<PublicationOpenContent> createState() =>
      _PublicationOpenContentState();
}

class _PublicationOpenContentState
    extends ConsumerState<PublicationOpenContent> {
  late Widget verifiedSvg;
  late Color mainTextColor;
  late TextStyle customTitleStyle;
  late TextStyle customSubtitleStyle;
  late TextStyle customContentStyle;
  late TextStyle customSocialStyle;
  late Widget responsesSvg;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    verifiedSvg = SvgPicture.asset(
      'assets/pubverified.svg',
      semanticsLabel: 'PubVerified Icon',
      package: 'asalema_widgets',
      height: 14.w,
      width: 14.w,
    );

    mainTextColor = Colors.white;
    if (widget.backgroundColor.red * 0.299 +
            widget.backgroundColor.green * 0.587 +
            widget.backgroundColor.blue * 0.114 >
        186) {
      mainTextColor = Colors.black;
    }

    customTitleStyle = textStyleBuilder(
      ref.read(themeDataProvider).themeDataApp.titleStyle,
      TextStyle(
        color: mainTextColor,
        fontFamily: 'Poppins',
        fontSize: 18.sp,
        fontWeight: FontWeight.w500,
      ),
    );

    customSubtitleStyle = textStyleBuilder(
      ref.watch(themeDataProvider).themeDataApp.subtitleStyle,
      TextStyle(
        color: mainTextColor.withOpacity(0.5),
        fontFamily: 'Poppins',
        fontSize: 13.sp,
        fontWeight: FontWeight.w500,
      ),
    );

    customContentStyle = textStyleBuilder(
      ref.watch(themeDataProvider).themeDataApp.contentStyle,
      TextStyle(
        color: mainTextColor.withOpacity(0.86),
        fontFamily: 'Poppins',
        fontSize: 13.sp,
        fontWeight: FontWeight.w400,
      ),
    );

    customSocialStyle = textStyleBuilder(
      ref.watch(themeDataProvider).themeDataApp.socialStyle,
      TextStyle(
        color: mainTextColor.withOpacity(0.6),
        fontFamily: 'Poppins',
        fontSize: 13.sp,
        fontWeight: FontWeight.w500,
      ),
    );

    responsesSvg = SvgPicture.asset(
      'assets/pubresponses.svg',
      semanticsLabel: 'PubResponses Icon',
      package: 'asalema_widgets',
      height: 17.w,
      width: 17.w,
      color: customSocialStyle.color,
    );
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return index == 0
              ? Container(
                  key: widget.firstItemKey,
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.w, vertical: 14.h),
                  width: double.infinity,
                  color: widget.backgroundColor,
                  child: Wrap(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: (() {
                              widget.onAvatarTap!(
                                  widget.publicationModelProvider.usermodel.id);
                            }),
                            child: CircleAvatar(
                              radius: 23.5.w,
                              backgroundImage: CachedNetworkImageProvider(widget
                                  .publicationModelProvider.usermodel.avatar),
                              backgroundColor: Colors.transparent,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(left: 10.w),
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            constraints:
                                                BoxConstraints(maxWidth: 142.w),
                                            child: FittedBox(
                                              alignment: Alignment.centerLeft,
                                              fit: BoxFit.scaleDown,
                                              child: Text(
                                                widget.publicationModelProvider
                                                        .usermodel.firstname +
                                                    ' ' +
                                                    widget
                                                        .publicationModelProvider
                                                        .usermodel
                                                        .lastname,
                                                style: customTitleStyle,
                                              ),
                                            ),
                                          ),
                                          ref
                                                      .watch(themeDataProvider)
                                                      .themeDataApp
                                                      .useCheck &&
                                                  widget
                                                      .publicationModelProvider
                                                      .usermodel
                                                      .verified
                                              ? Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 6.4.w),
                                                  child: verifiedSvg,
                                                )
                                              : const SizedBox(),
                                        ],
                                      ),
                                      Timeago(
                                        builder: ((context, str) {
                                          return Text(
                                            str,
                                            style: customSubtitleStyle,
                                          );
                                        }),
                                        date: widget
                                            .publicationModelProvider.date,
                                        locale: widget.locale,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            color: mainTextColor.withOpacity(0.22),
                            height: 35.h,
                            width: 0.5.w,
                          ),
                          SizedBox(width: 10.w),
                          LikeButton(
                            liked: widget.liked,
                            publicationModelProvider:
                                widget.publicationModelProvider,
                            customSocialStyle: customSocialStyle,
                            onLike: widget.onLike,
                            backgroundColor: widget.backgroundColor,
                          ),
                          ResponsesCount(
                            responsesSvg: responsesSvg,
                            publicationModelProvider:
                                widget.publicationModelProvider,
                            customSocialStyle: customSocialStyle,
                          ),
                        ],
                      ),
                      widget.publicationModelProvider.comment.isEmpty
                          ? Container(height: 14.h)
                          : Padding(
                              padding: EdgeInsets.only(top: 8.h, bottom: 14.h),
                              child: Text(
                                widget.publicationModelProvider.comment,
                                style: customContentStyle,
                              ),
                            ),
                      Container(
                        color: mainTextColor.withOpacity(0.22),
                        height: 0.5.h,
                        width: double.infinity,
                      ),
                    ],
                  ),
                )
              : index == 1
                  ? FutureCommentList(
                      onClickComment: widget.onClickComment,
                      listCommentModels: widget.listCommentModels,
                      onDelete: widget.onDelete,
                      onReport: widget.onReport,
                      onLike: widget.onLikeComment,
                      sendMessage: widget.sendMessage,
                      sendSvg: widget.sendSvg,
                      bottombarController: widget.bottombarController,
                      commentPublicationModel: null,
                      locale: widget.locale,
                      publicationModelProvider: widget.publicationModelProvider,
                      isResponse: false,
                    )
                  : const SizedBox();
        },
        childCount: 2,
      ),
    );
  }
}

class ResponsesCount extends ConsumerStatefulWidget {
  const ResponsesCount({
    Key? key,
    required this.responsesSvg,
    required this.publicationModelProvider,
    required this.customSocialStyle,
  }) : super(key: key);

  final Widget responsesSvg;
  final PublicationModel publicationModelProvider;
  final TextStyle customSocialStyle;

  @override
  ConsumerState<ResponsesCount> createState() => _ResponsesCountState();
}

class _ResponsesCountState extends ConsumerState<ResponsesCount> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        widget.responsesSvg,
        SizedBox(width: 3.w),
        Text(
          widget.publicationModelProvider.responses.toString(),
          style: widget.customSocialStyle,
        ),
      ],
    );
  }
}

class LikeButton extends ConsumerStatefulWidget {
  const LikeButton(
      {Key? key,
      required this.publicationModelProvider,
      required this.customSocialStyle,
      required this.onLike,
      required this.backgroundColor,
      required this.liked})
      : super(key: key);

  final PublicationModel publicationModelProvider;
  final bool liked;
  final TextStyle customSocialStyle;
  final Function(String, String?, bool, String)? onLike;
  final Color backgroundColor;

  @override
  ConsumerState<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends ConsumerState<LikeButton> {
  @override
  Widget build(BuildContext context) {
    TextStyle likesStyle = widget.customSocialStyle.copyWith(
      color: widget.liked
          ? const Color(0xFFF54458)
          : widget.customSocialStyle.color,
    );

    Widget likesSvg = SvgPicture.asset(
      widget.liked ? 'assets/publikesfull.svg' : 'assets/publikes.svg',
      semanticsLabel: 'PubLikes Icon',
      package: 'asalema_widgets',
      height: 17.w,
      width: 17.w,
      color: likesStyle.color,
    );

    return GestureDetector(
      onTap: (() async {
        if (widget.onLike != null) {
          await widget.onLike!(
            widget.publicationModelProvider.id,
            null,
            !widget.liked,
            widget.publicationModelProvider.sharedBy ??
                widget.publicationModelProvider.usermodel.id,
          );
        }
        setState(() {});
      }),
      child: Container(
        height: 35.w,
        color: widget.backgroundColor,
        child: Row(
          children: [
            likesSvg,
            SizedBox(width: 3.w),
            Text(
              widget.publicationModelProvider.likes.toString(),
              style: likesStyle,
            ),
            SizedBox(width: 8.w),
          ],
        ),
      ),
    );
  }
}
