import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';




class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.threeArchedCircle( //threeArchedCircle
        color: Colors.black, //AppColor.mainColor,
        size: 35.r,
      ),
    );
  }
}


class Loader2 extends StatelessWidget {
  const Loader2({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.waveDots( 
        color: Colors.black, //AppColor.mainColor,
        size: 35.r,
      ),
    );
  }
}