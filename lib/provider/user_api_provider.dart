
import 'package:eit_task/models/models.dart';
import 'package:eit_task/screens/widgets/build_custom_snackbar.dart';
import 'package:eit_task/services/services.dart';
import 'package:flutter/material.dart';

class RegistrationProvider with ChangeNotifier {
  bool _isLoading = false;
  UserRegisterModel? _userRegisterModel;

  UserRegisterModel? get userModel => _userRegisterModel;

  bool get isLoading => _isLoading;
  setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
  userRegister(
      {required String email,
      required String password,
      required BuildContext context}) async {
    setLoading(true);
    try {


      _userRegisterModel = await registerUser(email: email, password: password);
      notifyListeners();

      setLoading(false);

    } catch (e) {
      CustomSnackBar(
              context: context,
              message: '$e',
              backgroundColor: Colors.redAccent)
          .show();
    } finally {
setLoading(false);
    }
  }
}


class UserUpdateProvider with ChangeNotifier {
  bool _isLoading = false;

  UserUpdateModel? _userUpdateModelModel;

  UserUpdateModel? get userModel => _userUpdateModelModel;

  bool get isLoading => _isLoading;

  setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
  userUpdate({
    required String id,
    required String job,
    required String address,
    required BuildContext context,
  }) async {
    setLoading(true);
    try {
      _userUpdateModelModel = await updateUser(id: id, address: address, job: job);
      notifyListeners();
      setLoading(false);

    } catch (e) {
      CustomSnackBar(context: context, message: 'Error: $e');
    } finally {
      setLoading(false);
    }
  }
}