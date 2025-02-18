import 'package:asalema_widgets/asalema_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import 'modals.dart';

class SettingsButton extends ConsumerStatefulWidget {
  const SettingsButton({
    Key? key,
    required this.mainTextColor,
    required this.onImageTextColor,
    required this.scrollController,
    required this.publicationModelProvider,
    required this.modalStyle,
    required this.onReport,
    required this.onDelete,
    required this.onPubShare,
    required this.onPubEdit,
  }) : super(key: key);

  final Color mainTextColor;
  final Color onImageTextColor;
  final ScrollController scrollController;
  final ModalStyle? modalStyle;
  final PublicationModel publicationModelProvider;
  final Function(String, String?, String)? onReport;
  final Function(String, String?, String)? onDelete;
  final Function(String, String)? onPubShare;
  final Function(String)? onPubEdit;

  @override
  ConsumerState<SettingsButton> createState() => _SettingsButtonState();
}

class _SettingsButtonState extends ConsumerState<SettingsButton> {
  bool lastStatus = true;

  _scrollListener() {
    if (isShrink != lastStatus) {
      setState(() {
        lastStatus = isShrink;
      });
    }
  }

  bool get isShrink {
    return widget.scrollController.hasClients && widget.scrollController.offset > (350.h - kToolbarHeight);
  }

  @override
  void initState() {
    widget.scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget settingsSvg = SvgPicture.asset(
      'assets/pubsettings.svg',
      semanticsLabel: 'PubSettings Icon',
      package: 'asalema_widgets',
      height: 14.w,
      width: 4.w,
      color: isShrink ? widget.mainTextColor : widget.onImageTextColor,
    );

    return IconButton(
      onPressed: () {
        showPublicationModal(
          context,
          widget.publicationModelProvider,
          widget.modalStyle,
          widget.onReport,
          widget.onDelete,
          widget.onPubShare,
          widget.onPubEdit,
          ref,
        );
      },
      icon: settingsSvg,
      splashRadius: Material.defaultSplashRadius / 1.5,
    );
  }
}
