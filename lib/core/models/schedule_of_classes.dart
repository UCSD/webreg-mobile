// ignore_for_file: always_specify_types

import 'dart:convert';
import 'dart:core';

ScheduleOfClassesModel classScheduleModelFromJson(String str) =>
    ScheduleOfClassesModel.fromJson(json.decode(str));

String classScheduleModelToJson(ScheduleOfClassesModel data) =>
    json.encode(data.toJson());

class ScheduleOfClassesModel {
  ScheduleOfClassesModel({
    this.metadata,
    this.courses,
  });

  factory ScheduleOfClassesModel.fromJson(Map<String, dynamic> json) =>
      ScheduleOfClassesModel(
          metadata: Metadata.fromJson(),
          courses: List<CourseData>.from(
              json['data'].map((x) => CourseData.fromJson(x))));

  Metadata? metadata;
  List<CourseData>? courses;

  Map<String, dynamic> toJson() => {
        'metadata': metadata!.toJson(),
        'data': List<dynamic>.from(courses!.map((x) => x.toJson()))
      };
}

class Metadata {
  Metadata();

  factory Metadata.fromJson() => Metadata();

  Map<String, dynamic> toJson() => {};
}

class CourseData {
  CourseData(
      {this.subjectCode,
      this.courseCode,
      this.departmentCode,
      this.courseTitle,
      this.unitsMin,
      this.unitsMax,
      this.unitsInc,
      this.academicLevel,
      this.sections});

  factory CourseData.fromJson(Map<String, dynamic> json) => CourseData(
      subjectCode: json['subjectCode'] ?? '',
      courseCode: json['courseCode'] ?? '',
      departmentCode: json['departmentCode'] ?? '',
      courseTitle: json['courseTitle'] ?? '',
      unitsMin: json['unitsMin'] ?? '',
      unitsMax: json['unitsMax'] ?? '',
      unitsInc: json['unitsInc'] ?? '',
      academicLevel: json['academicLevel'] ?? '',
      sections: List<SectionData>.from(
          json['sections'].map((x) => SectionData.fromJson(x))));

  String? subjectCode;
  String? courseCode;
  String? departmentCode;
  String? courseTitle;
  double? unitsMin;
  double? unitsMax;
  double? unitsInc;
  String? academicLevel;
  List<SectionData>? sections;

  Map<String, dynamic> toJson() => {
        'subjectCode': subjectCode,
        'courseCode': courseCode,
        'departmentCode': departmentCode,
        'courseTitle': courseTitle,
        'unitsMin': unitsMin,
        'unitsMax': unitsMax,
        'unitsInc': unitsInc,
        'academicLevel': academicLevel,
        'sections': List<dynamic>.from(sections!.map((x) => x.toJson()))
      };
}

class SectionData {
  SectionData(
      {this.sectionId,
      this.termCode,
      this.sectionCode,
      this.instructionType,
      this.sectionStatus,
      this.subtitle,
      this.startDate,
      this.endDate,
      this.enrolledQuantity,
      this.capacityQuantity,
      this.stopEnrollmentFlag,
      this.printFlag,
      this.subterm,
      this.planCode,
      this.recurringMeetings,
      this.additionalMeetings,
      this.instructors,
      //***********************// Only for prototpying purposes (p8gonzal)
      this.units,
      this.subjectCode,
      this.courseCode});

  factory SectionData.fromJson(Map<String, dynamic> json) => SectionData(
      sectionId: json['sectionId'] ?? '',
      termCode: json['termCode'] ?? '',
      sectionCode: json['sectionCode'] ?? '',
      instructionType: json['instructionType'] ?? '',
      sectionStatus: json['sectionStatus'] ?? '',
      subtitle: json['subtitle'] ?? '',
      startDate: json['startDate'] ?? '',
      endDate: json['endDate'] ?? '',
      enrolledQuantity: json['enrolledQuantity'] ?? 0,
      capacityQuantity: json['capacityQuantity'] ?? 0,
      stopEnrollmentFlag: json['stopEnrollmentFlag'] ?? false,
      printFlag: json['printFlag'] ?? '',
      subterm: json['subterm'] ?? '',
      planCode: json['planCode'] ?? '',
      recurringMeetings: List<MeetingData>.from(
          json['recurringMeetings'].map((x) => MeetingData.fromJson(x))),
      additionalMeetings: List<MeetingData>.from(
          json['additionalMeetings'].map((x) => MeetingData.fromJson(x))),
      instructors: List<Instructor>.from(
          json['instructors'].map((x) => Instructor.fromJson(x))),
      //***********************// Only for prototpying purposes (p8gonzal)
      units: json['units'] ?? 0,
      subjectCode: json['subjectCode'] ?? '',
      courseCode: json['courseCode'] ?? '');

  String? sectionId;
  String? termCode;
  String? sectionCode;
  String? instructionType;
  String? sectionStatus;
  String? subtitle;
  String? startDate;
  String? endDate;
  int? enrolledQuantity;
  int? capacityQuantity;
  bool? stopEnrollmentFlag;
  String? printFlag;
  String? subterm;
  String? planCode;
  List<MeetingData>? recurringMeetings;
  List<MeetingData>? additionalMeetings;
  List<Instructor>? instructors;
  //***********************// Only for prototpying purposes (p8gonzal)
  double? units;
  String? subjectCode;
  String? courseCode;

  Map<String, dynamic> toJson() => {
        'sectionId': sectionId,
        'termCode': termCode,
        'sectionCode': sectionCode,
        'instructionType': instructionType,
        'sectionStatus': sectionStatus,
        'subtitle': subtitle,
        'startDate': startDate,
        'endDate': endDate,
        'enrolledQuantity': enrolledQuantity,
        'capacityQuantity': capacityQuantity,
        'stopEnrollmentFlag': stopEnrollmentFlag,
        'printFlag': printFlag,
        'subterm': subterm,
        'planCode': planCode,
        'recurringMeetings':
            List<dynamic>.from(recurringMeetings!.map((x) => x.toJson())),
        'additionalMeetings':
            List<dynamic>.from(additionalMeetings!.map((x) => x.toJson())),
        'instructors': List<dynamic>.from(instructors!.map((x) => x.toJson())),
        //***********************// Only for prototpying purposes (p8gonzal)
        'units': units,
        'subjectCode': subjectCode,
        'courseCode': courseCode
      };
}

class MeetingData {
  MeetingData(
      {this.meetingType,
      this.meetingDate,
      this.dayCode,
      this.dayCodeIsis,
      this.startTime,
      this.endTime,
      this.buildingCode,
      this.roomCode});

  factory MeetingData.fromJson(Map<String, dynamic> json) => MeetingData(
      meetingType: json['meetingType'] ?? '',
      meetingDate: json['meetingDate'] ?? '',
      dayCode: json['dayCode'] ?? '',
      dayCodeIsis: json['dayCodeIsis'] ?? '',
      startTime: json['startTime'] ?? '',
      endTime: json['endTime'] ?? '',
      buildingCode: json['buildingCode'] ?? '',
      roomCode: json['roomCode'] ?? '');

  String? meetingType;
  String? meetingDate;
  String? dayCode;
  String? dayCodeIsis;
  String? startTime;
  String? endTime;
  String? buildingCode;
  String? roomCode;

  Map<String, dynamic> toJson() => {
        'meetingType': meetingType,
        'meetingDate': meetingDate,
        'dayCode': dayCode,
        'dayCodeIsis': dayCodeIsis,
        'startTime': startTime,
        'endTime': endTime,
        'buildingCode': buildingCode,
        'roomCode': roomCode
      };
}

class Instructor {
  Instructor(
      {this.pid,
      this.instructorName,
      this.primaryInstructor,
      this.instructorEmailAddress,
      this.workLoadUnitQty,
      this.percentOfLoad});

  factory Instructor.fromJson(Map<String, dynamic> json) => Instructor(
      pid: json['pid'] ?? '',
      instructorName: json['instructorName'] ?? '',
      primaryInstructor: json['primaryInstructor'] ?? false,
      instructorEmailAddress: json['instructorEmailAddress'] ?? '',
      workLoadUnitQty: json['workLoadUnitQty'] ?? 1,
      percentOfLoad: json['percentOfLoad'] ?? 100);

  String? pid;
  String? instructorName;
  bool? primaryInstructor;
  String? instructorEmailAddress;
  double? workLoadUnitQty;
  double? percentOfLoad;

  Map<String, dynamic> toJson() => {
        'pid': pid,
        'instructorName': instructorName,
        'primaryInstructor': primaryInstructor,
        'instructorEmailAddress': instructorEmailAddress,
        'workLoadUnityQty': workLoadUnitQty,
        'percentOfLoad': percentOfLoad
      };
}
