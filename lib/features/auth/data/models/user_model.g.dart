// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CalentreUser _$CalentreUserFromJson(Map<String, dynamic> json) => CalentreUser(
      currentSession: CurrentSession.fromJson(
          json['currentSession'] as Map<String, dynamic>),
      expiresAt: json['expiresAt'] as int,
    );

Map<String, dynamic> _$CalentreUserToJson(CalentreUser instance) =>
    <String, dynamic>{
      'currentSession': instance.currentSession,
      'expiresAt': instance.expiresAt,
    };

CurrentSession _$CurrentSessionFromJson(Map<String, dynamic> json) =>
    CurrentSession(
      accessToken: json['access_token'] as String,
      expiresIn: json['expires_in'] as int,
      refreshToken: json['refresh_token'] as String,
      tokenType: json['token_type'] as String,
      providerToken: json['provider_token'] as String,
      providerRefreshToken: json['provider_refresh_token'],
      user: User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CurrentSessionToJson(CurrentSession instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'expires_in': instance.expiresIn,
      'refresh_token': instance.refreshToken,
      'token_type': instance.tokenType,
      'provider_token': instance.providerToken,
      'provider_refresh_token': instance.providerRefreshToken,
      'user': instance.user,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String,
      appMetadata:
          AppMetadata.fromJson(json['app_metadata'] as Map<String, dynamic>),
      userMetadata:
          Data.fromJson(json['user_metadata'] as Map<String, dynamic>),
      aud: json['aud'] as String,
      confirmationSentAt: json['confirmation_sent_at'],
      recoverySentAt: json['recovery_sent_at'],
      emailChangeSentAt: json['email_change_sent_at'],
      newEmail: json['new_email'],
      invitedAt: json['invited_at'],
      actionLink: json['action_link'],
      email: json['email'] as String,
      phone: json['phone'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      confirmedAt: DateTime.parse(json['confirmed_at'] as String),
      emailConfirmedAt: DateTime.parse(json['email_confirmed_at'] as String),
      phoneConfirmedAt: json['phone_confirmed_at'],
      lastSignInAt: DateTime.parse(json['last_sign_in_at'] as String),
      role: json['role'] as String,
      updatedAt: DateTime.parse(json['updated_at'] as String),
      identities: (json['identities'] as List<dynamic>)
          .map((e) => Identity.fromJson(e as Map<String, dynamic>))
          .toList(),
      factors: json['factors'],
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'app_metadata': instance.appMetadata,
      'user_metadata': instance.userMetadata,
      'aud': instance.aud,
      'confirmation_sent_at': instance.confirmationSentAt,
      'recovery_sent_at': instance.recoverySentAt,
      'email_change_sent_at': instance.emailChangeSentAt,
      'new_email': instance.newEmail,
      'invited_at': instance.invitedAt,
      'action_link': instance.actionLink,
      'email': instance.email,
      'phone': instance.phone,
      'created_at': instance.createdAt.toIso8601String(),
      'confirmed_at': instance.confirmedAt.toIso8601String(),
      'email_confirmed_at': instance.emailConfirmedAt.toIso8601String(),
      'phone_confirmed_at': instance.phoneConfirmedAt,
      'last_sign_in_at': instance.lastSignInAt.toIso8601String(),
      'role': instance.role,
      'updated_at': instance.updatedAt.toIso8601String(),
      'identities': instance.identities,
      'factors': instance.factors,
    };

AppMetadata _$AppMetadataFromJson(Map<String, dynamic> json) => AppMetadata(
      provider: json['provider'] as String,
      providers:
          (json['providers'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$AppMetadataToJson(AppMetadata instance) =>
    <String, dynamic>{
      'provider': instance.provider,
      'providers': instance.providers,
    };

Identity _$IdentityFromJson(Map<String, dynamic> json) => Identity(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      identityData:
          Data.fromJson(json['identity_data'] as Map<String, dynamic>),
      provider: json['provider'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      lastSignInAt: DateTime.parse(json['last_sign_in_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$IdentityToJson(Identity instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'identity_data': instance.identityData,
      'provider': instance.provider,
      'created_at': instance.createdAt.toIso8601String(),
      'last_sign_in_at': instance.lastSignInAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      avatarUrl: json['avatar_url'] as String,
      customClaims:
          CustomClaims.fromJson(json['custom_claims'] as Map<String, dynamic>),
      email: json['email'] as String,
      emailVerified: json['email_verified'] as bool,
      fullName: json['full_name'] as String,
      iss: json['iss'] as String,
      name: json['name'] as String,
      picture: json['picture'] as String,
      providerId: json['provider_id'] as String,
      sub: json['sub'] as String,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'avatar_url': instance.avatarUrl,
      'custom_claims': instance.customClaims,
      'email': instance.email,
      'email_verified': instance.emailVerified,
      'full_name': instance.fullName,
      'iss': instance.iss,
      'name': instance.name,
      'picture': instance.picture,
      'provider_id': instance.providerId,
      'sub': instance.sub,
    };

CustomClaims _$CustomClaimsFromJson(Map<String, dynamic> json) => CustomClaims(
      hd: json['hd'] as String,
    );

Map<String, dynamic> _$CustomClaimsToJson(CustomClaims instance) =>
    <String, dynamic>{
      'hd': instance.hd,
    };
