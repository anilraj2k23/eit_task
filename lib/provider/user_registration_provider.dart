import 'package:eit_task/models/models.dart';
import 'package:eit_task/services/services.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier{
  bool _isLoading = false;
  UserModel? _userModel;

  UserModel? get userModel => _userModel;
  bool get isLoading => _isLoading;

 registerUser({required String email,  required String password}){
   try{

   }catch(e){
     print(e);
   }

 }


}