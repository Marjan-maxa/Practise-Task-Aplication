import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/assets_path.dart';

class ScreenBacround extends StatelessWidget {
  const ScreenBacround({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(AssetsPath.bacroundImgPath,fit: BoxFit.cover,),
        SafeArea(child: child)
      ],
    );
  }
}
