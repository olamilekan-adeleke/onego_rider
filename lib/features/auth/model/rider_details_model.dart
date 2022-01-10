import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class RiderDetailsModel {
  RiderDetailsModel({
    required this.uid,
    required this.email,
    required this.fullName,
    required this.username,
    required this.phoneNumber,
    this.profilePicUrl,
    this.dateJoined,
    this.hasCreateWalletPin,
    this.isRiderFree,
  });

  factory RiderDetailsModel.fromMap(Map<String, dynamic>? map) {
    return RiderDetailsModel(
      uid: map!['uid'] as String,
      email: map['email'] as String,
      username: map['username'] as String,
      fullName: map['full_name'] as String,
      hasCreateWalletPin: (map['has_create_wallet_pin'] ?? false) as bool,
      phoneNumber: map['phone_number'] as String,
      profilePicUrl: map['profile_pic_url'] != null
          ? map['profile_pic_url'] as String
          : null,
      dateJoined:
          map['date_joined'] != null ? map['date_joined'] as Timestamp : null,
      isRiderFree:
          map['is_rider_free'] != null ? map['is_rider_free'] as bool : true,
    );
  }

  factory RiderDetailsModel.fromJson(String source) =>
      RiderDetailsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  final String uid;
  final String email;
  final String fullName;
  final String username;
  final String phoneNumber;
  final String? profilePicUrl;
  final Timestamp? dateJoined;
  final bool? isRiderFree;
  final bool? hasCreateWalletPin;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'email': email,
      'username': username,
      'full_name': fullName,
      'phone_number': phoneNumber,
      'profile_pic_url': profilePicUrl,
      'date_joined': dateJoined,
      'has_verify_number': false,
      'has_create_wallet_pin': hasCreateWalletPin ?? false,
      'is_rider_free': isRiderFree ?? true,
    };
  }

  Map<String, dynamic> toMapForLocalDb() {
    return <String, dynamic>{
      'uid': uid,
      'email': email,
      'full_name': fullName,
      'phone_number': phoneNumber,
      'profile_pic_url': profilePicUrl,
      'is_rider_free': isRiderFree ?? true,
    };
  }

  String toJson() => json.encode(toMap());

  RiderDetailsModel copyWith({
    String? uid,
    String? email,
    String? fullName,
    String? username,
    String? phoneNumber,
    String? profilePicUrl,
    Timestamp? dateJoined,
    double? walletBalance,
    bool? hasVerifyNumber,
    bool? hasCreateWalletPin,
  }) {
    return RiderDetailsModel(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      fullName: fullName ?? this.fullName,
      username: username ?? this.username,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      profilePicUrl: profilePicUrl ?? this.profilePicUrl,
      dateJoined: dateJoined ?? this.dateJoined,
      hasCreateWalletPin: hasCreateWalletPin ?? this.hasCreateWalletPin,
    );
  }
}
