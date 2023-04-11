import 'package:eit_task/models/models.dart';
import 'package:eit_task/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:eit_task/screens/screens.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
                        Text('${user.data.firstName} ${user.data.lastName}')
                      ],
                    ),
                  );
          });
        },
      ),
    );
  }
}
