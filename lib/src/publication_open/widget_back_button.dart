import 'package:asalema_widgets/asalema_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WidgetBackButton extends StatelessWidget {
  const WidgetBackButton({
    Key? key,
    required this.backgroundColor,
    required this.iconColor,
    required this.bottombarController,
    required this.mapKey,
  }) : super(key: key);

  final Color backgroundColor;
  final Color iconColor;
  final TextEditingController bottombarController;

  final String? mapKey;

  @override
  Widget build(BuildContext context) {
    final Widget backArrowSvg = SvgPicture.asset(
      'assets/pubbackarrow.svg',
      semanticsLabel: 'PubBackArrow Icon',
      package: 'asalema_widgets',
      height: 15.w,
      width: 8.5.w,
      color: iconColor,
    );

    return Material(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      borderRadius: BorderRadius.circular(14.r),
      color: backgroundColor,
      child: IconButton(
        color: backgroundColor,
        onPressed: () {
          bottombarController.clear();
          Navigator.pop(context);
        },
        icon: backArrowSvg,
      ),
    );
  }
}
