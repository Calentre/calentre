import 'package:calentre/core/DTOs/data_transfer_object.dart';

class UserDTO implements BaseDTO {
  String? userName;
  String email;
  String? fullName;
  String? userId;

  UserDTO({required this.email});
}
