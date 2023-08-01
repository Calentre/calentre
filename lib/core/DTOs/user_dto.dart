import 'package:calentre/core/DTOs/data_transfer_object.dart';

class UserDTO implements BaseDTO {
  String? userName;
  String email;
  String? firstName;
  String? lastName;

  UserDTO({required this.email});
}
