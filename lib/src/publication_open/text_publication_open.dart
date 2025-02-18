import 'package:asalema_widgets/asalema_widgets.dart';
import 'package:asalema_widgets/freezed/theme_data_provider.dart';
import 'package:asalema_widgets/src/publication_open/globals.dart';
import 'package:asalema_widgets/src/publication_open/modals.dart';
import 'package:asalema_widgets/src/publication_open/publication_open_content.dart';
import 'package:asalema_widgets/src/publication_open/widget_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TextPublicationOpen extends ConsumerStatefulWidget {
  const TextPublicationOpen({
    Key? key,
    required this.publicationModelProvider,
    required this.onLike,
    required this.onLikeComment,
    required this.locale,
    required this.firstItemKey,
    required this.onRefresh,
    required this.sendMessage,
    required this.sendSvg,
    required this.bottombarController,
    required this.onPop,
    required this.onDelete,
    required this.onReport,
    required this.onPubShare,
    required this.onPubEdit,
    required this.onAvatarTap,
    required this.itemFetchCount,
    required this.listCommentModels,
    required this.onClickComment,
    required this.liked,
  }) : super(key: key);

  final PublicationModel publicationModelProvider;
  final List<CommentPublicationModel> listCommentModels;

  final Function(String, String?, bool, String)? onLike;
  final Function(String, String?, bool, String)? onLikeComment;
  final String locale;
  final Function({required CommentPublicationModel commentPublicationModel, required PublicationModel publicationModel})
      onClickComment;
  final bool liked;
  final Function(String, String?, String)? onReport;
  final Function(String, String?, String)? onDelete;
  final GlobalKey firstItemKey;
  final Future<void> Function(String id) onRefresh;
  final Function(String, String?, GlobalKey) sendMessage;
  final Widget sendSvg;
  final TextEditingController bottombarController;
  final Function(String?)? onPop;

  final Function(String, String)? onPubShare;
  final Function(String)? onPubEdit;

  final Function(String)? onAvatarTap;
  final int itemFetchCount;

  @override
  ConsumerState<TextPublicationOpen> createState() => _TextPublicationOpenState();
}

class _TextPublicationOpenState extends ConsumerState<TextPublicationOpen> {
  Color backgroundColor = Colors.white;
  late Color mainTextColor;
  late Widget _settingsSvg;

  @override
  void initState() {
    mainTextColor = Colors.white;
    if (backgroundColor.red * 0.299 + backgroundColor.green * 0.587 + backgroundColor.blue * 0.114 > 186) {
      mainTextColor = Colors.black;
    }

    _settingsSvg = SvgPicture.asset(
      'assets/pubsettings.svg',
      semanticsLabel: 'PubSettings Icon',
      package: 'asalema_widgets',
      height: 14.w,
      width: 4.w,
      color: mainTextColor,
    );

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
    return CustomScrollView(
      cacheExtent: 99999,
      physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
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
              IconButton(
                onPressed: () {
                  showPublicationModal(
                    context,
                    widget.publicationModelProvider,
                    ref.watch(themeDataProvider).themeDataApp.modalStyle,
                    widget.onReport,
                    widget.onDelete,
                    widget.onPubShare,
                    widget.onPubEdit,
                    ref,
                  );
                },
                icon: _settingsSvg,
                splashRadius: Material.defaultSplashRadius / 1.5,
              ),
            ],
          ),
          backgroundColor: backgroundColor,
          pinned: true,
        ),
        PublicationOpenContent(
          onLikeComment: widget.onLikeComment,
          liked: widget.liked,
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
          backgroundColor: backgroundColor,
          onLike: widget.onLike,
          locale: widget.locale,
          firstItemKey: widget.firstItemKey,
        ),
      ],
    );
  }
}
