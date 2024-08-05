import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:sporty/utils/theme/app_theme.dart';






class SwitchWidget extends StatelessWidget {
  SwitchWidget({super.key, required this.onChanged, required this.isToggled});
  final void Function(bool)? onChanged;
  bool isToggled;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 0.8,
      child: CupertinoSwitch(
        dragStartBehavior: DragStartBehavior.down,
        activeColor: AppColor.greenColorDark.withOpacity(0.2),
        thumbColor: AppColor.greenColorDark,
        trackColor: AppColor.greyColor,  //lightGreyColor.withOpacity(0.2), //fieldGreyColor
        value: isToggled,
        onChanged: onChanged
      ),
    );
  }
}