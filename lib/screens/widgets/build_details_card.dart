import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildDetailsCard extends StatelessWidget {
  const BuildDetailsCard({
    super.key, required this.title, required this.data, required this.dataFontSize,
  });
  final String title;
  final String data;
  final double dataFontSize;
  @override
  Widget build(BuildContext context) {
    return Container(margin: EdgeInsets.symmetric(horizontal: 20.w),
        height: 70.h,
        width: double.infinity,
        child: Card(
          child: Row(
            children: [
              SizedBox(width: 20.w,),
              Text('$title :', style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 19.sp),),SizedBox(width: 20.w,),
              Expanded(
                child: Text(data, style: TextStyle(fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold, fontSize: dataFontSize),),
              )
            ],
          ),
        ));
  }
}
