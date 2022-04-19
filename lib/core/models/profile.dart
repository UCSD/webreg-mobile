// ignore_for_file: always_specify_types

import 'dart:convert';
import 'dart:core';

import 'package:webreg_mobile_flutter/core/models/schedule_of_classes.dart';

ProfileModel profileModelFromJson(String str) =>
    ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  ProfileModel({this.enrolledCourses});

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
      enrolledCourses: List<CourseData>.from(
          json['enrolledCourses'].map((x) => CourseData.fromJson(x))));

  List<CourseData>? enrolledCourses;

  Map<String, dynamic> toJson() => {
        'enrolledCourses':
            List<dynamic>.from(enrolledCourses!.map((x) => x.toJson()))
      };
}
