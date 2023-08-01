import 'package:calentre/config/constants/constants.dart';
import 'package:calentre/core/DTOs/user_dto.dart';
import 'package:calentre/core/resources.dart';
import 'package:calentre/features/auth/data/models/user_model.dart';
import 'package:dio/dio.dart';

class AuthService {
  AuthService(this._dio, this._userDTO, this._remoteURLs);

  final Dio _dio;
  final UserDTO _userDTO;
  final RemoteURLs _remoteURLs;

  Future<DataState<User>?> getUser() async {
    _remoteURLs.supabaseUrl;

//1. get user from supabse via _userDTO.email
//2. check user existence
//return userDetails

    return null;
  }

//Update user

//delete user
}
