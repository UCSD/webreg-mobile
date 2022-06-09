import 'dart:convert';
import 'dart:core';

import 'package:webreg_mobile_flutter/core/models/schedule_of_classes.dart';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel(
      {this.enrolledCourses, this.waitlistedCourses, this.plannedCourses});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      enrolledCourses: List<CourseData>.from(json['enrolledCourses']
          .map((Map<String, dynamic> x) => CourseData.fromJson(x))),
      waitlistedCourses: List<CourseData>.from(json['waitlistedCourses']
          .map((Map<String, dynamic> x) => CourseData.fromJson(x))),
      plannedCourses: List<CourseData>.from(json['plannedCourses']
          .map((Map<String, dynamic> x) => CourseData.fromJson(x))));

  List<CourseData>? enrolledCourses;
  List<CourseData>? waitlistedCourses;
  List<CourseData>? plannedCourses;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'enrolledCourses': List<dynamic>.from(
            enrolledCourses!.map((CourseData x) => x.toJson())),
        'waitlistedCourses': List<dynamic>.from(
            enrolledCourses!.map((CourseData x) => x.toJson())),
        'plannedCourses': List<dynamic>.from(
            enrolledCourses!.map((CourseData x) => x.toJson())),
      };
}
