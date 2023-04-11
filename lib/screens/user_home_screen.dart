import 'package:eit_task/models/models.dart';
import 'package:eit_task/screens/screens.dart';
import 'package:eit_task/screens/widgets/build_details_card.dart';
import 'package:eit_task/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final TextStyle nameStyle =
      TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureProvider<UserModel>(
        create: (context) => getUserDetails(id: '4'),
        initialData: UserModel.initialUserData,
        builder: (BuildContext context, child) {
          return Consumer<UserModel>(builder: (context, user, child) {
            return user.data.id == 0
                ? const Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        BuildAvatar(imageUrl: user.data.avatar),
                        SizedBox(height: 100.h),
                        Text('${user.data.firstName} ${user.data.lastName}',
                            style: nameStyle),
                        SizedBox(height: 20.h),
                        BuildDetailsCard(
                          title: 'Email',
                          data: user.data.email,
                          dataFontSize: 19.sp,
                        ),
                        BuildDetailsCard(
                          title: 'URL',
                          data: user.support.url,
                          dataFontSize: 15.sp,
                        ),
                        BuildDetailsCard(
                          title: 'Text',
                          data: user.support.text,
                          dataFontSize: 12.sp,
                        ),
                      ],
                    ),
                  );
          });
        },
      ),
      floatingActionButton: FloatingActionButton.large(
        tooltip: 'Edit Profile',
        onPressed: () {},
        child: const Icon(Icons.edit),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
    );
  }
}
