import 'package:eit_task/provider/provider.dart';
import 'package:eit_task/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final dashboard = Provider.of<RegistrationProvider>(context, listen: false);

    return Scaffold(
      body: SafeArea(child:
          Consumer<RegistrationProvider>(builder: (context, provider, child) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                child: Image.asset("assets/images/registration.png",
                    fit: BoxFit.fitWidth, height: 297.815.h),
              ),
              Padding(
                padding: EdgeInsets.only(left: 25.w),
                child: Text(
                  "Registration",
                  style: TextStyle(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 25.52.h,
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                          padding: EdgeInsets.only(left: 20.w, right: 20.w),
                          child: Column(
                            children: [
                              TextFormField(
                                controller: emailController,
                                keyboardType: TextInputType.emailAddress,
                                decoration: const InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.mail_outline,
                                    ),
                                    hintText: 'Email'),
                                validator: (email) {
                                  if (email!.isNotEmpty) {
                                    return null;
                                  }
                                  return 'Please enter a valid email';
                                },
                              ),
                              SizedBox(height: 50.h),
                              TextFormField(
                                controller: passwordController,
                                obscureText: true,
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.lock,
                                  ),
                                  hintText: 'Password',
                                ),
                                validator: (password) {
                                  if (password!.isNotEmpty) {
                                    return null;
                                  }
                                  return 'Please enter a password';
                                },
                              )
                            ],
                          )),
                      SizedBox(height: 50.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.20.w),
                        child: FilledButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              await provider.userRegister(
                                email: emailController.text,
                                password: passwordController.text,
                                context: context);
                            if (!provider.isLoading) {
                              if (provider.userModel?.id !=null ) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomeScreen()));
                              }
                            }
                          }
                          },
                          style: FilledButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0.r)),
                            minimumSize: Size(357.w, 47.h),
                          ),
                          child: provider.isLoading
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : Text('Login',
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                  )),
                        ),
                      )
                    ],
                  ))
            ],
          ),
        );
      })),
    );
  }
}
