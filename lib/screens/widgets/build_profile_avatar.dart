import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class BuildAvatar extends StatelessWidget {
  const BuildAvatar({
    super.key, required this.imageUrl,
  });
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff3f51b5), Color(0xff03a9f4)],
            stops: [0, 1],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )),
      width: double.infinity,
      height: 0.22.sh,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: 0.10.sh,
            left: 0.25.sw,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 95.r,
              child: CircleAvatar(
                radius: 90.r,
                foregroundImage:
                NetworkImage(imageUrl),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
