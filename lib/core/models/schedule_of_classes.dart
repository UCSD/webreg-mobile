import 'dart:convert';

import 'dart:core';

import 'dart:core';

ScheduleOfClassesModel classScheduleModelFromJson(String str) =>
    ScheduleOfClassesModel.fromJson(json.decode(str));

String classScheduleModelToJson(ScheduleOfClassesModel data) =>
    json.encode(data.toJson());

class ScheduleOfClassesModel {
  Metadata? metadata;
  List<CourseData>? courses;

  ScheduleOfClassesModel({
    this.metadata,
    this.courses,
  });

  factory ScheduleOfClassesModel.fromJson(Map<String, dynamic> json) =>
      ScheduleOfClassesModel(
          metadata: Metadata.fromJson(json['metadata']), courses:List<CourseData>.from( json["data"].map((x) => CourseData.fromJson(x))));

  // List<ClassData>.from(
  // json["data"].map((x) => ClassData.fromJson(x)))
  Map<String, dynamic> toJson() => {
        "metadata": metadata!.toJson(),
        "data": List<dynamic>.from(courses!.map((x) => x.toJson()))
      };
}

class Metadata {
  Metadata();

  factory Metadata.fromJson(Map<String, dynamic>? json) => Metadata();

  Map<String, dynamic> toJson() => {};
}

class CourseData {
  String? subjectCode;
  String? courseCode;
  String? departmentCode;
  String? courseTitle;
  double? unitsMin;
  double? unitsMax;
  double? unitsInc;
  String? academicLevel;
  List<SectionData>? sections;

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
      unitsMin: 0.0,
      unitsMax: 0.0,
      unitsInc: 0.0,
      academicLevel: json['academicLevel'] ?? '',
      sections: List<SectionData>.from(
          json["sections"].map((x) => SectionData.fromJson(x))));

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
      this.instructors});

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
          json["recurringMeetings"].map((x) => MeetingData.fromJson(x))),
      additionalMeetings: List<MeetingData>.from(
          json["additionalMeetings"].map((x) => MeetingData.fromJson(x))),
      instructors: List<Instructor>.from(
          json["instructors"].map((x) => Instructor.fromJson(x))));

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
        'instructors': List<dynamic>.from(instructors!.map((x) => x.toJson()))
      };
}

class MeetingData {
  String? meetingType;
  String? meetingDate;
  String? dayCode;
  String? dayCodeIsis;
  String? startTime;
  String? endTime;
  String? buildingCode;
  String? roomCode;

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
  String? pid;
  String? instructorName;
  bool? primaryInstructor;
  String? instructorEmailAddress;
  double? workLoadUnitQty;
  double? percentOfLoad;

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
      workLoadUnitQty: json['workLoadUnitQty'] ?? '',
      percentOfLoad: json['percentOfLoad'] ?? '');

  Map<String, dynamic> toJson() => {
        'pid': pid,
        'instructorName': instructorName,
        'primaryInstructor': primaryInstructor,
        'instructorEmailAddress': instructorEmailAddress,
        'workLoadUnityQty': workLoadUnitQty,
        'percentOfLoad': percentOfLoad
      };
}
