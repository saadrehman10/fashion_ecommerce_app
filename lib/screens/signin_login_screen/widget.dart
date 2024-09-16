import 'package:fashion_ecommerce_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OtherLoginIcon extends StatelessWidget {
  final String svgPath;
  const OtherLoginIcon({super.key, required this.svgPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.textColorSubtitles),
          borderRadius: BorderRadius.circular(100)),
      child: GestureDetector(
        onTap: () {
          debugPrint('working signin other');
        },
        child: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 27,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: SvgPicture.asset(svgPath),
          ),
        ),
      ),
    );
  }
}
