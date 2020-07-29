import 'package:flutter/material.dart';

class User {
  final int id;
  final String fullName;
  final String firstName;
  final String middleName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String role;
  final String dateCreated;
  final String dateUpdated;
  final String dateDeleted;

  User({
    this.id,
    @required this.fullName,
    this.firstName,
    this.middleName: "Not specified",
    this.lastName,
    this.email,
    this.phoneNumber,
    this.role,
    this.dateCreated: "",
    this.dateUpdated: "",
    this.dateDeleted: "",
  });
}
