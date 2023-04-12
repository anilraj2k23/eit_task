import 'package:eit_task/models/models.dart';
import 'package:eit_task/provider/user_api_provider.dart';
import 'package:eit_task/screens/screens.dart';
import 'package:eit_task/screens/widgets/build_details_card.dart';
import 'package:eit_task/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController jobController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  final TextStyle nameStyle =
      TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    var userData = Provider.of<RegistrationProvider>(context);
    final id = userData.userModel!.id;
    return Scaffold(
      body: FutureProvider<UserModel>(
        create: (context) => getUserDetails(id: id.toString()),
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
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(20.0)), //this right here
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Add Details',
                            style: TextStyle(
                                fontSize: 18.sp, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          TextFormField(
                              controller: jobController,
                              decoration: const InputDecoration(
                                  filled: true,
                                  border: InputBorder.none,
                                  hintText: 'Job'),
                              validator: (job) {
                                if (job!.isNotEmpty) {
                                  return null;
                                }
                                return 'Please enter a valid email';
                              }),
                          SizedBox(
                            height: 10.h,
                          ),
                          TextFormField(
                              controller: addressController,
                              decoration: const InputDecoration(
                                  filled: true,
                                  border: InputBorder.none,
                                  hintText: 'Address'),
                              validator: (address) {
                                if (address!.isNotEmpty) {
                                  return null;
                                }
                                return 'Please enter a valid email';
                              }),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  "Cancel",
                                ),
                              ),
                              Consumer<UserUpdateProvider>(
                                builder: (context, update, child) {
                                  return TextButton(
                                    onPressed: () async {
                                      if (_formKey.currentState!.validate()) {
                                        await update.userUpdate(
                                            id: id.toString(),
                                            job: jobController.text,
                                            address: addressController.text,
                                            context: context);
                                       if(context.mounted) Navigator.pop(context);

                                      }
                                    },
                                    child: update.isLoading
                                        ? const CircularProgressIndicator(

                                          )
                                        : Text(
                                            "Save",
                                          ),
                                  );
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              });
        },
        child: const Icon(Icons.edit),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
    );
  }
}
