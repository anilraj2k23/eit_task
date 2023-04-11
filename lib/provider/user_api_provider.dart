import 'package:eit_task/models/models.dart';
 
import 'package:eit_task/screens/widgets/build_custom_snackbar.dart';
import 'package:eit_task/services/services.dart';
import 'package:flutter/material.dart';

class RegistrationProvider with ChangeNotifier {
  bool _isLoading = false;
  UserRegisterModel? _userRegisterModel;

  UserRegisterModel? get userModel => _userRegisterModel;

  bool get isLoading => _isLoading;

  userRegister(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      _isLoading = true;

      _userRegisterModel = await registerUser(email: email, password: password);

      _isLoading = false;

      notifyListeners();
    } catch (e) {
      CustomSnackBar(context: context, message: 'Error: $e');
    } finally {
      _isLoading = false;
    }
  }
}


