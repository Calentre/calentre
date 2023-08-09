// This file is "main.dart"
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.g.dart';

//Build command
//flutter pub run build_runner build --delete-conflicting-outputs

// @freezed
@JsonSerializable()
class CalentreUser {
  @JsonKey(name: "currentSession")
  CurrentSession currentSession;
  @JsonKey(name: "expiresAt")
  int expiresAt;

  CalentreUser({
    required this.currentSession,
    required this.expiresAt,
  });

  factory CalentreUser.fromJson(Map<String, dynamic> json) =>
      _$CalentreUserFromJson(json);

  Map<String, dynamic> toJson() => _$CalentreUserToJson(this);
}

@JsonSerializable()
class CurrentSession {
  @JsonKey(name: "access_token")
  String accessToken;
  @JsonKey(name: "expires_in")
  int expiresIn;
  @JsonKey(name: "refresh_token")
  String refreshToken;
  @JsonKey(name: "token_type")
  String tokenType;
  @JsonKey(name: "provider_token")
  String providerToken;
  @JsonKey(name: "provider_refresh_token")
  dynamic providerRefreshToken;
  @JsonKey(name: "user")
  User user;

  CurrentSession({
    required this.accessToken,
    required this.expiresIn,
    required this.refreshToken,
    required this.tokenType,
    required this.providerToken,
    this.providerRefreshToken,
    required this.user,
  });

  factory CurrentSession.fromJson(Map<String, dynamic> json) =>
      _$CurrentSessionFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentSessionToJson(this);
}

@JsonSerializable()
class User {
  @JsonKey(name: "id")
  String id;
  @JsonKey(name: "app_metadata")
  AppMetadata appMetadata;
  @JsonKey(name: "user_metadata")
  Data userMetadata;
  @JsonKey(name: "aud")
  String aud;
  @JsonKey(name: "confirmation_sent_at")
  dynamic confirmationSentAt;
  @JsonKey(name: "recovery_sent_at")
  dynamic recoverySentAt;
  @JsonKey(name: "email_change_sent_at")
  dynamic emailChangeSentAt;
  @JsonKey(name: "new_email")
  dynamic newEmail;
  @JsonKey(name: "invited_at")
  dynamic invitedAt;
  @JsonKey(name: "action_link")
  dynamic actionLink;
  @JsonKey(name: "email")
  String email;
  @JsonKey(name: "phone")
  String phone;
  @JsonKey(name: "created_at")
  DateTime createdAt;
  @JsonKey(name: "confirmed_at")
  DateTime confirmedAt;
  @JsonKey(name: "email_confirmed_at")
  DateTime emailConfirmedAt;
  @JsonKey(name: "phone_confirmed_at")
  dynamic phoneConfirmedAt;
  @JsonKey(name: "last_sign_in_at")
  DateTime lastSignInAt;
  @JsonKey(name: "role")
  String role;
  @JsonKey(name: "updated_at")
  DateTime updatedAt;
  @JsonKey(name: "identities")
  List<Identity> identities;
  @JsonKey(name: "factors")
  dynamic factors;

  User({
    required this.id,
    required this.appMetadata,
    required this.userMetadata,
    required this.aud,
    this.confirmationSentAt,
    this.recoverySentAt,
    this.emailChangeSentAt,
    this.newEmail,
    this.invitedAt,
    this.actionLink,
    required this.email,
    required this.phone,
    required this.createdAt,
    required this.confirmedAt,
    required this.emailConfirmedAt,
    this.phoneConfirmedAt,
    required this.lastSignInAt,
    required this.role,
    required this.updatedAt,
    required this.identities,
    this.factors,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class AppMetadata {
  @JsonKey(name: "provider")
  String provider;
  @JsonKey(name: "providers")
  List<String> providers;

  AppMetadata({
    required this.provider,
    required this.providers,
  });

  factory AppMetadata.fromJson(Map<String, dynamic> json) =>
      _$AppMetadataFromJson(json);

  Map<String, dynamic> toJson() => _$AppMetadataToJson(this);
}

@JsonSerializable()
class Identity {
  @JsonKey(name: "id")
  String id;
  @JsonKey(name: "user_id")
  String userId;
  @JsonKey(name: "identity_data")
  Data identityData;
  @JsonKey(name: "provider")
  String provider;
  @JsonKey(name: "created_at")
  DateTime createdAt;
  @JsonKey(name: "last_sign_in_at")
  DateTime lastSignInAt;
  @JsonKey(name: "updated_at")
  DateTime updatedAt;

  Identity({
    required this.id,
    required this.userId,
    required this.identityData,
    required this.provider,
    required this.createdAt,
    required this.lastSignInAt,
    required this.updatedAt,
  });

  factory Identity.fromJson(Map<String, dynamic> json) =>
      _$IdentityFromJson(json);

  Map<String, dynamic> toJson() => _$IdentityToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "avatar_url")
  String avatarUrl;
  @JsonKey(name: "custom_claims")
  CustomClaims customClaims;
  @JsonKey(name: "email")
  String email;
  @JsonKey(name: "email_verified")
  bool emailVerified;
  @JsonKey(name: "full_name")
  String fullName;
  @JsonKey(name: "iss")
  String iss;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "picture")
  String picture;
  @JsonKey(name: "provider_id")
  String providerId;
  @JsonKey(name: "sub")
  String sub;

  Data({
    required this.avatarUrl,
    required this.customClaims,
    required this.email,
    required this.emailVerified,
    required this.fullName,
    required this.iss,
    required this.name,
    required this.picture,
    required this.providerId,
    required this.sub,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class CustomClaims {
  @JsonKey(name: "hd")
  String hd;

  CustomClaims({
    required this.hd,
  });

  factory CustomClaims.fromJson(Map<String, dynamic> json) =>
      _$CustomClaimsFromJson(json);

  Map<String, dynamic> toJson() => _$CustomClaimsToJson(this);
}
