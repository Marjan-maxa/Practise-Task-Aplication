import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/assets_path.dart';

class ScreenBacround extends StatelessWidget {
  const ScreenBacround({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          SvgPicture.asset(AssetsPath.bacroundImgPath,fit: BoxFit.cover,),
          SafeArea(child: child)
        ],
      ),
    );
  }
}
