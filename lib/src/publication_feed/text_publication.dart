import 'dart:ui';

import 'package:animations/animations.dart';
import 'package:asalema_widgets/asalema_widgets.dart';
import 'package:asalema_widgets/freezed/theme_data_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:asalema_widgets/utils/text_style_builder.dart';

class TextPublication extends ConsumerStatefulWidget {
  const TextPublication({
    Key? key,
    this.infoRightWidget,
    this.showTime,
    required this.publicationModelProvider,
    required this.liked,
    this.backgroudColor,
    this.imageColor,
    required this.onAvatarTap,
  }) : super(key: key);
  final Color? imageColor;
  final Widget? infoRightWidget;
  final Color? backgroudColor;
  final bool liked;
  final bool? showTime;
  final PublicationModel publicationModelProvider;
  final Function(String)? onAvatarTap;

  @override
  ConsumerState<TextPublication> createState() => _TextPublicationState();
}

class _TextPublicationState extends ConsumerState<TextPublication> {
  TextStyle? customTitleStyle;
  TextStyle? customSubtitleStyle;
  TextStyle? customContentStyle;
  TextStyle? customSocialStyle;
  TextStyle? customOpenTitleStyle;
  TextStyle? customOpenSubtitleStyle;
  TextStyle? customOpenContentStyle;
  TextStyle? customOpenSocialStyle;
  TextStyle? likesStyle;
  Widget? responsesSvg;
  Widget? verifiedSvg;
  Color? mainTextColor;

  @override
  void initState() {
    verifiedSvg = SvgPicture.asset(
      'assets/pubverified.svg',
      semanticsLabel: 'PubVerified Icon',
      package: 'asalema_widgets',
      height: 14.w,
      width: 14.w,
    );
    mainTextColor = Colors.white;

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (widget.backgroudColor == null ||
          widget.backgroudColor!.red * 0.299 +
                  widget.backgroudColor!.green * 0.587 +
                  widget.backgroudColor!.blue * 0.114 >
              186) {
        setState(() {
          mainTextColor = Colors.black;
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    customTitleStyle = textStyleBuilder(
      ref.read(themeDataProvider).themeDataApp.titleStyle,
      TextStyle(
        color: mainTextColor,
        fontFamily: 'Poppins',
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
      ),
    );
    customOpenTitleStyle = textStyleBuilder(ref.read(themeDataProvider).themeDataApp.openTitleStyle, customTitleStyle!);

    customSubtitleStyle = textStyleBuilder(
      ref.read(themeDataProvider).themeDataApp.subtitleStyle,
      TextStyle(
        color: mainTextColor?.withOpacity(0.5),
        fontFamily: 'Poppins',
        fontSize: 11.sp,
        fontWeight: FontWeight.w500,
      ),
    );
    customOpenSubtitleStyle =
        textStyleBuilder(ref.read(themeDataProvider).themeDataApp.openSubtitleStyle, customSubtitleStyle!);

    customContentStyle = textStyleBuilder(
      ref.read(themeDataProvider).themeDataApp.contentStyle,
      TextStyle(
        color: mainTextColor?.withOpacity(0.86),
        fontFamily: 'Poppins',
        fontSize: 11.5.sp,
        fontWeight: FontWeight.w400,
      ),
    );
    customOpenContentStyle =
        textStyleBuilder(ref.read(themeDataProvider).themeDataApp.openContentStyle, customContentStyle!);

    customSocialStyle = textStyleBuilder(
      ref.read(themeDataProvider).themeDataApp.socialStyle,
      TextStyle(
        color: mainTextColor?.withOpacity(0.6),
        fontFamily: 'Poppins',
        fontSize: 10.sp,
        fontWeight: FontWeight.w500,
      ),
    );
    customOpenSocialStyle =
        textStyleBuilder(ref.read(themeDataProvider).themeDataApp.openSocialStyle, customSocialStyle!);

    likesStyle = customSocialStyle?.copyWith(
      color: widget.liked ? const Color(0xFFF54458) : customSocialStyle!.color,
    );

    responsesSvg = SvgPicture.asset(
      'assets/pubresponses.svg',
      semanticsLabel: 'PubResponses Icon',
      package: 'asalema_widgets',
      color: customSocialStyle!.color,
      height: 12.w,
      width: 12.w,
    );
    return Wrap(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius:
                BorderRadius.all(Radius.circular(ref.watch(themeDataProvider).themeDataApp.borderRadius ?? 20.r)),
          ),
          clipBehavior: Clip.hardEdge,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Container(
              constraints: BoxConstraints(minHeight: 70.h),
              width: 325.w,
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
              decoration: BoxDecoration(
                color: widget.imageColor?.withOpacity(0.3) ?? ref.watch(themeDataProvider).themeDataApp.backgroundColor,
              ),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          widget.publicationModelProvider.sharedBy != null ? SizedBox(height: 10.h) : const SizedBox(),
                          GestureDetector(
                            onTap: (() {
                              widget.onAvatarTap!(widget.publicationModelProvider.usermodel.id);
                            }),
                            child: CircleAvatar(
                              radius: 19.5.w,
                              backgroundImage: const AssetImage(
                                'assets/placeholderavatar.png',
                                package: 'asalema_widgets',
                              ),
                              foregroundImage:
                                  CachedNetworkImageProvider(widget.publicationModelProvider.usermodel.avatar),
                              backgroundColor: Colors.transparent,
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 8.5.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      if (widget.publicationModelProvider.shareText != null) ...[
                                        Text(
                                          widget.publicationModelProvider.shareText!,
                                          style:
                                              customTitleStyle?.copyWith(fontWeight: FontWeight.w500, fontSize: 10.sp),
                                        ),
                                        SizedBox(
                                          height: 5.h,
                                        ),
                                      ],
                                      widget.publicationModelProvider.sharedBy != null
                                          ? Text(
                                              'Partagée',
                                              style: customSubtitleStyle,
                                            )
                                          : const SizedBox(),
                                      Row(
                                        children: [
                                          Container(
                                            constraints: BoxConstraints(maxWidth: 140.w),
                                            child: FittedBox(
                                              alignment: Alignment.centerLeft,
                                              fit: BoxFit.scaleDown,
                                              child: Text(
                                                widget.publicationModelProvider.usermodel.firstname +
                                                    ' ' +
                                                    widget.publicationModelProvider.usermodel.lastname,
                                                style: customTitleStyle,
                                              ),
                                            ),
                                          ),
                                          ref.watch(themeDataProvider).themeDataApp.useCheck &&
                                                  widget.publicationModelProvider.usermodel.verified
                                              ? Padding(
                                                  padding: EdgeInsets.only(left: 6.4.w),
                                                  child: verifiedSvg,
                                                )
                                              : const SizedBox(),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            widget.publicationModelProvider.usermodel.username +
                                                ((widget.showTime == true || widget.showTime == null) ? ' - ' : ''),
                                            style: customSubtitleStyle,
                                          ),
                                          if (widget.showTime == true || widget.showTime == null)
                                            Timeago(
                                              builder: ((context, str) {
                                                return Text(
                                                  str,
                                                  style: customSubtitleStyle,
                                                );
                                              }),
                                              date: widget.publicationModelProvider.date,
                                              locale: "fr",
                                            ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  widget.infoRightWidget ??
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Wrap(
                                            children: [
                                              responsesSvg ?? const SizedBox(),
                                              SizedBox(width: 5.4.w),
                                              Text(
                                                widget.publicationModelProvider.responses.toString() + ' réponses',
                                                style: customSocialStyle,
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 6.h),
                                          if (customSocialStyle != null)
                                            LikeButton(
                                              liked: widget.liked,
                                              publicationModelProvider: widget.publicationModelProvider,
                                              customSocialStyle: customSocialStyle!,
                                            ),
                                        ],
                                      ),
                                ],
                              ),
                              widget.publicationModelProvider.comment.isNotEmpty
                                  ? Padding(
                                      padding: EdgeInsets.only(right: 38.w, top: 8.h),
                                      child: Text(
                                        widget.publicationModelProvider.comment,
                                        style: customContentStyle,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    )
                                  : const SizedBox(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

class LikeButton extends ConsumerStatefulWidget {
  const LikeButton({
    Key? key,
    required this.publicationModelProvider,
    required this.liked,
    required this.customSocialStyle,
  }) : super(key: key);

  final PublicationModel publicationModelProvider;
  final TextStyle customSocialStyle;
  final bool liked;

  @override
  ConsumerState<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends ConsumerState<LikeButton> {
  @override
  Widget build(BuildContext context) {
    TextStyle likesStyle = widget.customSocialStyle.copyWith(
      color: widget.liked ? const Color(0xFFF54458) : widget.customSocialStyle.color,
    );

    Widget likesSvg = SvgPicture.asset(
      widget.liked ? 'assets/publikesfull.svg' : 'assets/publikes.svg',
      semanticsLabel: 'PubLikes Icon',
      package: 'asalema_widgets',
      height: 12.w,
      width: 12.w,
      color: likesStyle.color,
    );

    return Wrap(
      children: [
        likesSvg,
        SizedBox(width: 5.4.w),
        Text(
          widget.publicationModelProvider.likes.toString() + " j'aimes",
          style: likesStyle,
        ),
      ],
    );
  }
}
