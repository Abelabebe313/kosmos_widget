import 'package:asalema_widgets/asalema_widgets.dart';
import 'package:asalema_widgets/freezed/theme_data_provider.dart';
import 'package:asalema_widgets/src/publication_feed/image_publication.dart';
import 'package:asalema_widgets/src/publication_feed/text_publication.dart';
import 'package:asalema_widgets/themeData/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Publication extends ConsumerWidget {
  const Publication({
    Key? key,
    required this.publicationModelProvider,
    required this.liked,
    required this.themeDataApp,
    this.showTime,
    this.onAvatarTap,
    this.infoRightWidget,
    this.info,
  }) : super(key: key);
  final ThemeDataApp themeDataApp;
  final Widget? info;
  final Widget? infoRightWidget;
  final bool liked;

  final bool? showTime;
  final PublicationModel publicationModelProvider;

  final Function(String)? onAvatarTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(themeDataProvider).setThemeDataApp(themeDataApp);
    });
    if (publicationModelProvider.type == 'text') {
      return TextPublication(
        liked: liked,
        onAvatarTap: onAvatarTap,
        publicationModelProvider: publicationModelProvider,
      );
    } else if (publicationModelProvider.type == 'image' || publicationModelProvider.type == 'video') {
      return ImagePublication(
        infoRightWidget: infoRightWidget,
        liked: liked,
        showTime: showTime,
        info: info,
        onAvatarTap: onAvatarTap,
        publicationModelProvider: publicationModelProvider,
      );
    } else {
      return const SizedBox();
    }
  }
}
