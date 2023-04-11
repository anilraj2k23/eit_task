import 'package:eit_task/models/models.dart';
import 'package:eit_task/screens/widgets/build_custom_snackbar.dart';
import 'package:eit_task/services/services.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  bool _isLoading = false;
  UserRegisterModel? _userModel;

  UserRegisterModel? get userModel => _userModel;

  bool get isLoading => _isLoading;

  userRegister(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      _isLoading = true;

      _userModel = await registerUser(email: email, password: password);

      _isLoading = false;

      notifyListeners();
    } catch (e) {
      CustomSnackBar(context: context, message: 'Error: $e');
    } finally {
      _isLoading = false;
    }
  }
}
