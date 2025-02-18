import 'package:asalema_widgets/asalema_widgets.dart';
import 'package:asalema_widgets/freezed/theme_data_provider.dart';
import 'package:asalema_widgets/src/publication_open/globals.dart';
import 'package:asalema_widgets/src/publication_open/publication_open_content.dart';
import 'package:asalema_widgets/src/publication_open/widget_back_button.dart';
import 'package:asalema_widgets/src/publication_open/widget_setting_button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:video_player/video_player.dart';

class VideoPublicationOpen extends ConsumerStatefulWidget {
  const VideoPublicationOpen({
    Key? key,
    required this.publicationModelProvider,
    required this.imageColor,
    required this.onLike,
    required this.onLikeComment,
    required this.backgroundColor,
    required this.locale,
    required this.firstItemKey,
    required this.onRefresh,
    required this.sendMessage,
    required this.sendSvg,
    required this.liked,
    required this.bottombarController,
    required this.onPop,
    required this.onReport,
    required this.onDelete,
    required this.onPubShare,
    required this.onPubEdit,
    required this.onAvatarTap,
    required this.listCommentModels,
    required this.itemFetchCount,
    required this.onClickComment,
  }) : super(key: key);

  final PublicationModel publicationModelProvider;
  final bool liked;
  final List<CommentPublicationModel> listCommentModels;
  final Function(
      {required CommentPublicationModel commentPublicationModel,
      required PublicationModel publicationModel}) onClickComment;

  final Function(String)? onPubEdit;
  final Color? imageColor;
  final Color backgroundColor;

  final String locale;

  final Function(String, String?, bool, String)? onLike;
  final Function(String, String?, bool, String)? onLikeComment;
  final GlobalKey firstItemKey;
  final Future<void> Function(String id) onRefresh;
  final Function(String, String?, GlobalKey) sendMessage;
  final Widget sendSvg;
  final TextEditingController bottombarController;
  final Function(String?)? onPop;

  final Function(String, String?, String)? onReport;
  final Function(String, String?, String)? onDelete;
  final Function(String, String)? onPubShare;

  final Function(String)? onAvatarTap;
  final int itemFetchCount;

  @override
  ConsumerState<VideoPublicationOpen> createState() =>
      _VideoPublicationOpenState();
}

class _VideoPublicationOpenState extends ConsumerState<VideoPublicationOpen> {
  late Color mainTextColor;
  late Color onImageTextColor;
  late ScrollController _scrollController;

  late ChewieController _chewieController;
  late VideoPlayerController videoPlayerController;

  bool played = false;
  bool _called = false;

  void _createChewieController() {
    _chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      fullScreenByDefault: true,
      autoPlay: true,
      showOptions: false,
      materialProgressColors:
          ref.watch(themeDataProvider).themeDataApp.chewieProgressColors ??
              ChewieProgressColors(
                backgroundColor: Colors.white.withOpacity(0.1),
                bufferedColor: Colors.white.withOpacity(0.2),
                handleColor: Colors.grey,
                playedColor: Colors.white,
              ),
      allowMuting: false,
      customControls: const MaterialControls(
        showPlayButton: true,
      ),
      errorBuilder: (context, str) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline_rounded,
              size: 100.h,
              color: Colors.red,
            ),
            Text(
              'Une erreur est survenue',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.red,
                fontSize: 16.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool error = false;
  Future<void> _initializePlayer() async {
    videoPlayerController =
        VideoPlayerController.network(widget.publicationModelProvider.video!);

    await Future.wait([
      videoPlayerController
          .initialize()
          .onError((error, stackTrace) => error = true),
    ]);
    _createChewieController();
    setState(() {});
  }

  @override
  void initState() {
    mainTextColor = Colors.white;
    if (widget.backgroundColor.red * 0.299 +
            widget.backgroundColor.green * 0.587 +
            widget.backgroundColor.blue * 0.114 >
        186) {
      mainTextColor = Colors.black;
    }

    onImageTextColor = Colors.white;
    if (widget.imageColor!.red * 0.299 +
            widget.imageColor!.green * 0.587 +
            widget.imageColor!.blue * 0.114 >
        186) {
      onImageTextColor = Colors.black;
    }

    _scrollController = ScrollController();

    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();

    if (played == true) {
      videoPlayerController.dispose();
      _chewieController.dispose();
    }

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
          physics: const AlwaysScrollableScrollPhysics(
              parent: BouncingScrollPhysics()),
          cacheExtent: 99999,
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              elevation: 0,
              title: Row(
                children: [
                  WidgetBackButton(
                    mapKey: widget.publicationModelProvider.id,
                    backgroundColor: widget.backgroundColor,
                    iconColor: mainTextColor,
                    bottombarController: widget.bottombarController,
                  ),
                  const Spacer(),
                  SettingsButton(
                    onPubShare: widget.onPubShare,
                    onReport: widget.onReport,
                    publicationModelProvider: widget.publicationModelProvider,
                    modalStyle:
                        ref.watch(themeDataProvider).themeDataApp.modalStyle,
                    mainTextColor: mainTextColor,
                    onImageTextColor: onImageTextColor,
                    scrollController: _scrollController,
                    onDelete: widget.onDelete,
                    onPubEdit: widget.onPubEdit,
                  ),
                ],
              ),
              backgroundColor: widget.backgroundColor,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 350.h,
                      child: CachedNetworkImage(
                        memCacheHeight: 350.h.toInt(),
                        memCacheWidth: 350.h.toInt(),
                        imageUrl: widget.publicationModelProvider.image!,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Transform.scale(
                      scale: 1.25,
                      child: Material(
                        shape: const CircleBorder(),
                        color: widget.imageColor!.withOpacity(0.5),
                        child: IconButton(
                          onPressed: (() async {
                            if (_called == false) {
                              _called = true;
                              await _initializePlayer();
                              played = true;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Container(
                                    color: Colors.black,
                                    child: Scaffold(
                                      backgroundColor: Colors.black,
                                      body: Stack(
                                        children: [
                                          _chewieController
                                                  .videoPlayerController
                                                  .value
                                                  .isInitialized
                                              ? Chewie(
                                                  controller: _chewieController,
                                                )
                                              : const SizedBox(),
                                          Padding(
                                            padding: EdgeInsets.only(
                                              left: 16.w,
                                              top: 50.h,
                                            ),
                                            child: WidgetBackButton(
                                              mapKey: widget
                                                  .publicationModelProvider.id,
                                              bottombarController:
                                                  widget.bottombarController,
                                              backgroundColor:
                                                  widget.backgroundColor,
                                              iconColor: mainTextColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ).then((value) => _called = false);
                            }
                          }),
                          icon: SvgPicture.asset(
                            'assets/pubplayer.svg',
                            package: 'asalema_widgets',
                            width: 25.w,
                            height: 25.w,
                          ),
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
              onLikeComment: widget.onLikeComment,
              onClickComment: widget.onClickComment,
              listCommentModels: widget.listCommentModels,
              itemFetchCount: widget.itemFetchCount,
              onAvatarTap: widget.onAvatarTap,
              onRefresh: widget.onRefresh,
              onDelete: widget.onDelete,
              onReport: widget.onReport,
              onPop: widget.onPop,
              sendMessage: widget.sendMessage,
              sendSvg: widget.sendSvg,
              bottombarController: widget.bottombarController,
              publicationModelProvider: widget.publicationModelProvider,
              backgroundColor: widget.backgroundColor,
              onLike: widget.onLike,
              locale: widget.locale,
              firstItemKey: widget.firstItemKey,
            ),
          ],
        ),
      ),
    );
  }
}
