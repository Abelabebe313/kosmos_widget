import 'package:asalema_widgets/asalema_widgets.dart';
import 'package:asalema_widgets/freezed/theme_data_provider.dart';
import 'package:asalema_widgets/src/publication_open/globals.dart';
import 'package:asalema_widgets/src/publication_open/publication_open_content.dart';
import 'package:asalema_widgets/src/publication_open/widget_back_button.dart';
import 'package:asalema_widgets/src/publication_open/widget_setting_button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photo_view/photo_view.dart';

class ImagePublicationOpen extends ConsumerStatefulWidget {
  const ImagePublicationOpen({
    Key? key,
    required this.publicationModelProvider,
    required this.onLike,
    this.imageBottomWidget,
    required this.onLikeComment,
    required this.locale,
    required this.firstItemKey,
    required this.onRefresh,
    required this.sendMessage,
    required this.sendSvg,
    required this.bottombarController,
    required this.onPop,
    required this.onReport,
    required this.onDelete,
    required this.onPubShare,
    required this.onPubEdit,
    required this.onAvatarTap,
    required this.itemFetchCount,
    required this.listCommentModels,
    required this.onClickComment,
    required this.liked,
  }) : super(key: key);
  final Widget? imageBottomWidget;
  final PublicationModel publicationModelProvider;

  final bool liked;
  final Function(String)? onAvatarTap;

  final String locale;

  final Function(String, String?, bool, String)? onLike;
  final Function(String, String?, bool, String)? onLikeComment;
  final Function({required CommentPublicationModel commentPublicationModel, required PublicationModel publicationModel})
      onClickComment;
  final int itemFetchCount;
  final GlobalKey firstItemKey;
  final Future<void> Function(String id) onRefresh;
  final List<CommentPublicationModel> listCommentModels;
  final Function(String, String?, GlobalKey) sendMessage;
  final Widget sendSvg;
  final TextEditingController bottombarController;
  final Function(String?)? onPop;

  final Function(String, String?, String)? onReport;
  final Function(String, String?, String)? onDelete;
  final Function(String, String)? onPubShare;
  final Function(String)? onPubEdit;

  @override
  ConsumerState<ImagePublicationOpen> createState() => _ImagePublicationOpenState();
}

class _ImagePublicationOpenState extends ConsumerState<ImagePublicationOpen> {
  late Color mainTextColor;
  late Color backgroundColor;
  late Color onImageTextColor;
  late Color imageColor;

  late ScrollController _scrollController;

  @override
  void initState() {
    imageColor = Color(widget.publicationModelProvider.color!);
    backgroundColor = ref.read(themeDataProvider).themeDataApp.backgroundColor ?? Colors.white;
    mainTextColor = Colors.white;
    if (backgroundColor.red * 0.299 + backgroundColor.green * 0.587 + backgroundColor.blue * 0.114 > 186) {
      mainTextColor = Colors.black;
    }

    onImageTextColor = Colors.white;
    if (imageColor.red * 0.299 + imageColor.green * 0.587 + imageColor.blue * 0.114 > 186) {
      onImageTextColor = Colors.black;
    }

    _scrollController = ScrollController();

    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();

    super.dispose();
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
    return RefreshIndicator(
      onRefresh: (() async {}),
      edgeOffset: 350.h,
      displacement: 40.h,
      child: NotificationListener<ScrollNotification>(
        onNotification: handleScrollNotification,
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
          cacheExtent: 99999,
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              elevation: 0,
              title: Row(
                children: [
                  WidgetBackButton(
                    mapKey: widget.publicationModelProvider.id,
                    backgroundColor: backgroundColor,
                    iconColor: mainTextColor,
                    bottombarController: widget.bottombarController,
                  ),
                  const Spacer(),
                  SettingsButton(
                    onPubEdit: widget.onPubEdit,
                    onPubShare: widget.onPubShare,
                    onReport: widget.onReport,
                    publicationModelProvider: widget.publicationModelProvider,
                    modalStyle: ref.watch(themeDataProvider).themeDataApp.modalStyle,
                    mainTextColor: mainTextColor,
                    onImageTextColor: onImageTextColor,
                    scrollController: _scrollController,
                    onDelete: widget.onDelete,
                  ),
                ],
              ),
              backgroundColor: backgroundColor,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 350.h,
                      child: CachedNetworkImage(
                        memCacheWidth: 350.h.toInt(),
                        imageUrl: widget.publicationModelProvider.image!,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: widget.imageBottomWidget ?? Container(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 15.w, bottom: 5.w),
                      child: Material(
                        color: Colors.transparent,
                        child: IconButton(
                          onPressed: (() {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Container(
                                  color: Colors.black,
                                  child: SafeArea(
                                    child: Scaffold(
                                      body: Stack(
                                        children: [
                                          PhotoView(
                                            imageProvider:
                                                CachedNetworkImageProvider(widget.publicationModelProvider.image!),
                                            minScale: PhotoViewComputedScale.contained,
                                            maxScale: PhotoViewComputedScale.contained * 5,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                              left: 16.w,
                                              top: 4.w,
                                            ),
                                            child: WidgetBackButton(
                                              mapKey: widget.publicationModelProvider.id,
                                              bottombarController: widget.bottombarController,
                                              backgroundColor: backgroundColor,
                                              iconColor: mainTextColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                          iconSize: 25.w,
                          icon: const Icon(Icons.fullscreen_rounded),
                          splashRadius: Material.defaultSplashRadius / 1.5,
                          color: onImageTextColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              pinned: true,
              expandedHeight: 350.h,
            ),
            PublicationOpenContent(
              liked: widget.liked,
              onClickComment: widget.onClickComment,
              itemFetchCount: widget.itemFetchCount,
              listCommentModels: widget.listCommentModels,
              onAvatarTap: widget.onAvatarTap,
              onRefresh: widget.onRefresh,
              onDelete: widget.onDelete,
              onReport: widget.onReport,
              onPop: widget.onPop,
              sendMessage: widget.sendMessage,
              sendSvg: widget.sendSvg,
              bottombarController: widget.bottombarController,
              publicationModelProvider: widget.publicationModelProvider,
              backgroundColor: backgroundColor,
              onLike: widget.onLike,
              onLikeComment: widget.onLikeComment,
              locale: widget.locale,
              firstItemKey: widget.firstItemKey,
            ),
          ],
        ),
      ),
    );
  }
}
