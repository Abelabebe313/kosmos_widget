import 'package:animations/animations.dart';
import 'package:asalema_widgets/asalema_widgets.dart';
import 'package:asalema_widgets/freezed/theme_data_provider.dart';
import 'package:asalema_widgets/src/publication_feed/text_publication.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImagePublication extends ConsumerStatefulWidget {
  const ImagePublication({
    required this.liked,
    this.showTime,
    this.infoRightWidget,
    Key? key,
    required this.publicationModelProvider,
    this.info,
    required this.onAvatarTap,
  }) : super(key: key);

  final PublicationModel publicationModelProvider;
  final Widget? info;
  final Widget? infoRightWidget;
  final bool liked;
  final bool? showTime;
  final Function(String)? onAvatarTap;

  @override
  ConsumerState<ImagePublication> createState() => _ImagePublicationState();
}

class _ImagePublicationState extends ConsumerState<ImagePublication> {
  Color backgroundColor = Colors.white;
  late Color imageColor;
  late Color onImageTextColor;

  @override
  void initState() {
    imageColor = Color(widget.publicationModelProvider.color!);
    backgroundColor = imageColor;
    _loading = false;
    onImageTextColor = Colors.white;
    if (imageColor.red * 0.299 + imageColor.green * 0.587 + imageColor.blue * 0.114 > 186) {
      onImageTextColor = Colors.black;
    }
    setState(() {});
    super.initState();
  }

  bool _loading = true;

  @override
  Widget build(BuildContext context) {
    return _loading
        ? Container(
            width: 325.w,
            height: 262.h,
            decoration: BoxDecoration(
              color: imageColor,
              borderRadius: BorderRadius.all(Radius.circular(ref.watch(themeDataProvider).themeDataApp.borderRadius!)),
            ),
            child: SpinKitRing(
              color: ref.watch(themeDataProvider).themeDataApp.spinnerColor ?? Colors.transparent,
              size: 50.w,
            ),
          )
        : Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius:
                  BorderRadius.all(Radius.circular(ref.watch(themeDataProvider).themeDataApp.borderRadius ?? 10.r)),
            ),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                SizedBox(
                  width: 325.w,
                  height: 262.h,
                  child: CachedNetworkImage(
                    memCacheWidth: 350.h.toInt(),
                    imageUrl: widget.publicationModelProvider.image!,
                    fit: BoxFit.cover,
                    errorWidget: (context, url, error) => Image.network(
                      widget.publicationModelProvider.image!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                widget.publicationModelProvider.type == "video"
                    ? Container(
                        margin: EdgeInsets.only(bottom: 155.h),
                        width: 50.w,
                        height: 50.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: imageColor.withOpacity(0.5),
                        ),
                        child: SvgPicture.asset(
                          'assets/pubplayer.svg',
                          package: 'asalema_widgets',
                          width: 25.w,
                          height: 25.w,
                          color: onImageTextColor,
                          fit: BoxFit.scaleDown,
                        ),
                      )
                    : const SizedBox(),
                TextPublication(
                  infoRightWidget: widget.infoRightWidget,
                  showTime: widget.showTime,
                  liked: widget.liked,
                  imageColor: imageColor,
                  backgroudColor: backgroundColor,
                  onAvatarTap: widget.onAvatarTap,
                  publicationModelProvider: widget.publicationModelProvider,
                ),
                if (widget.info != null) widget.info!
              ],
            ),
          );
  }
}
