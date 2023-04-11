import 'package:eit_task/models/models.dart';
import 'package:eit_task/screens/screens.dart';
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

class UserProvider with ChangeNotifier {
  bool _isLoading = false;
  UserModel? _userModel;

  UserModel? get userModel => _userModel;

  bool get isLoading => _isLoading;

  fetchUser({required String id, required BuildContext context}) async {
    try {
      _isLoading = true;

      _userModel = await getUserDetails(id: id);

      _isLoading = false;

      notifyListeners();
    } catch (e) {
      CustomSnackBar(context: context, message: 'Error: $e');
    } finally {
      _isLoading = false;
    }
  }
}

class UserUpdateProvider with ChangeNotifier {
  bool _isLoading = false;
  UserUpdateModel? _userUpdateModelModel;

  UserUpdateModel? get userModel => _userUpdateModelModel;

  bool get isLoading => _isLoading;

  fetchUser({
    required String id,
    required String job,
    required String name,
    required BuildContext context,
  }) async {
    try {
      _isLoading = true;

      _userUpdateModelModel = await updateUser(id: id, name: '', job: '');

      _isLoading = false;

      notifyListeners();
    } catch (e) {
      CustomSnackBar(context: context, message: 'Error: $e');
    } finally {
      _isLoading = false;
    }
  }
}
