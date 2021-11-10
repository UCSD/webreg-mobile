// To parse this JSON data, do
//
//     final scheduleOfClassesModel = scheduleOfClassesModelFromJson(jsonString);

import 'dart:convert';

ScheduleOfClassesModel scheduleOfClassesModelFromJson(String str) =>
    ScheduleOfClassesModel.fromJson(json.decode(str));

String scheduleOfClassesModelToJson(ScheduleOfClassesModel data) =>
    json.encode(data.toJson());

class ScheduleOfClassesModel {
  ScheduleOfClassesModel({
    this.metadata,
    this.data,
  });

  Metadata metadata;
  List<Datum> data;

  factory ScheduleOfClassesModel.fromJson(Map<String, dynamic> json) =>
      ScheduleOfClassesModel(
        metadata: json["metadata"] == null
            ? null
            : Metadata.fromJson(json["metadata"]),
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "metadata": metadata == null ? null : metadata.toJson(),
        "data": data == null
            ? null
            : List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.subjectCode,
    this.courseCode,
    this.departmentCode,
    this.courseTitle,
    this.unitsMin,
    this.unitsMax,
    this.unitsInc,
    this.academicLevel,
    this.sections,
  });

  String subjectCode;
  String courseCode;
  String departmentCode;
  String courseTitle;
  int unitsMin;
  int unitsMax;
  int unitsInc;
  String academicLevel;
  List<Section> sections;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        subjectCode: json["subjectCode"] == null ? null : json["subjectCode"],
        courseCode: json["courseCode"] == null ? null : json["courseCode"],
        departmentCode:
            json["departmentCode"] == null ? null : json["departmentCode"],
        courseTitle: json["courseTitle"] == null ? null : json["courseTitle"],
        unitsMin: json["unitsMin"] == null ? null : json["unitsMin"],
        unitsMax: json["unitsMax"] == null ? null : json["unitsMax"],
        unitsInc: json["unitsInc"] == null ? null : json["unitsInc"],
        academicLevel:
            json["academicLevel"] == null ? null : json["academicLevel"],
        sections: json["sections"] == null
            ? null
            : List<Section>.from(
                json["sections"].map((x) => Section.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "subjectCode": subjectCode == null ? null : subjectCode,
        "courseCode": courseCode == null ? null : courseCode,
        "departmentCode": departmentCode == null ? null : departmentCode,
        "courseTitle": courseTitle == null ? null : courseTitle,
        "unitsMin": unitsMin == null ? null : unitsMin,
        "unitsMax": unitsMax == null ? null : unitsMax,
        "unitsInc": unitsInc == null ? null : unitsInc,
        "academicLevel": academicLevel == null ? null : academicLevel,
        "sections": sections == null
            ? null
            : List<dynamic>.from(sections.map((x) => x.toJson())),
      };
}

class Section {
  Section({
    this.sectionId,
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
  });

  String sectionId;
  TermCode termCode;
  String sectionCode;
  InstructionType instructionType;
  SectionStatus sectionStatus;
  String subtitle;
  DateTime startDate;
  DateTime endDate;
  int enrolledQuantity;
  int capacityQuantity;
  bool stopEnrollmentFlag;
  String printFlag;
  String subterm;
  InstructionType planCode;
  List<RecurringMeeting> recurringMeetings;
  List<dynamic> additionalMeetings;
  List<Instructor> instructors;

  factory Section.fromJson(Map<String, dynamic> json) => Section(
        sectionId: json["sectionId"] == null ? null : json["sectionId"],
        termCode: json["termCode"] == null
            ? null
            : termCodeValues.map[json["termCode"]],
        sectionCode: json["sectionCode"] == null ? null : json["sectionCode"],
        instructionType: json["instructionType"] == null
            ? null
            : instructionTypeValues.map[json["instructionType"]],
        sectionStatus: json["sectionStatus"] == null
            ? null
            : sectionStatusValues.map[json["sectionStatus"]],
        subtitle: json["subtitle"] == null ? null : json["subtitle"],
        startDate: json["startDate"] == null
            ? null
            : DateTime.parse(json["startDate"]),
        endDate:
            json["endDate"] == null ? null : DateTime.parse(json["endDate"]),
        enrolledQuantity:
            json["enrolledQuantity"] == null ? null : json["enrolledQuantity"],
        capacityQuantity:
            json["capacityQuantity"] == null ? null : json["capacityQuantity"],
        stopEnrollmentFlag: json["stopEnrollmentFlag"] == null
            ? null
            : json["stopEnrollmentFlag"],
        printFlag: json["printFlag"] == null ? null : json["printFlag"],
        subterm: json["subterm"] == null ? null : json["subterm"],
        planCode: json["planCode"] == null
            ? null
            : instructionTypeValues.map[json["planCode"]],
        recurringMeetings: json["recurringMeetings"] == null
            ? null
            : List<RecurringMeeting>.from(json["recurringMeetings"]
                .map((x) => RecurringMeeting.fromJson(x))),
        additionalMeetings: json["additionalMeetings"] == null
            ? null
            : List<dynamic>.from(json["additionalMeetings"].map((x) => x)),
        instructors: json["instructors"] == null
            ? null
            : List<Instructor>.from(
                json["instructors"].map((x) => Instructor.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "sectionId": sectionId == null ? null : sectionId,
        "termCode": termCode == null ? null : termCodeValues.reverse[termCode],
        "sectionCode": sectionCode == null ? null : sectionCode,
        "instructionType": instructionType == null
            ? null
            : instructionTypeValues.reverse[instructionType],
        "sectionStatus": sectionStatus == null
            ? null
            : sectionStatusValues.reverse[sectionStatus],
        "subtitle": subtitle == null ? null : subtitle,
        "startDate": startDate == null
            ? null
            : "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
        "endDate": endDate == null
            ? null
            : "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
        "enrolledQuantity": enrolledQuantity == null ? null : enrolledQuantity,
        "capacityQuantity": capacityQuantity == null ? null : capacityQuantity,
        "stopEnrollmentFlag":
            stopEnrollmentFlag == null ? null : stopEnrollmentFlag,
        "printFlag": printFlag == null ? null : printFlag,
        "subterm": subterm == null ? null : subterm,
        "planCode":
            planCode == null ? null : instructionTypeValues.reverse[planCode],
        "recurringMeetings": recurringMeetings == null
            ? null
            : List<dynamic>.from(recurringMeetings.map((x) => x.toJson())),
        "additionalMeetings": additionalMeetings == null
            ? null
            : List<dynamic>.from(additionalMeetings.map((x) => x)),
        "instructors": instructors == null
            ? null
            : List<dynamic>.from(instructors.map((x) => x.toJson())),
      };
}

enum InstructionType { LE, ST, SE }

final instructionTypeValues = EnumValues({
  "LE": InstructionType.LE,
  "SE": InstructionType.SE,
  "ST": InstructionType.ST
});

class Instructor {
  Instructor({
    this.pid,
    this.instructorName,
    this.primaryInstructor,
    this.instructorEmailAddress,
    this.workLoadUnitQty,
    this.percentOfLoad,
  });

  Pid pid;
  InstructorName instructorName;
  bool primaryInstructor;
  InstructorEmailAddress instructorEmailAddress;
  int workLoadUnitQty;
  int percentOfLoad;

  factory Instructor.fromJson(Map<String, dynamic> json) => Instructor(
        pid: json["pid"] == null ? null : pidValues.map[json["pid"]],
        instructorName: json["instructorName"] == null
            ? null
            : instructorNameValues.map[json["instructorName"]],
        primaryInstructor: json["primaryInstructor"] == null
            ? null
            : json["primaryInstructor"],
        instructorEmailAddress: json["instructorEmailAddress"] == null
            ? null
            : instructorEmailAddressValues.map[json["instructorEmailAddress"]],
        workLoadUnitQty:
            json["workLoadUnitQty"] == null ? null : json["workLoadUnitQty"],
        percentOfLoad:
            json["percentOfLoad"] == null ? null : json["percentOfLoad"],
      );

  Map<String, dynamic> toJson() => {
        "pid": pid == null ? null : pidValues.reverse[pid],
        "instructorName": instructorName == null
            ? null
            : instructorNameValues.reverse[instructorName],
        "primaryInstructor":
            primaryInstructor == null ? null : primaryInstructor,
        "instructorEmailAddress": instructorEmailAddress == null
            ? null
            : instructorEmailAddressValues.reverse[instructorEmailAddress],
        "workLoadUnitQty": workLoadUnitQty == null ? null : workLoadUnitQty,
        "percentOfLoad": percentOfLoad == null ? null : percentOfLoad,
      };
}

class RecurringMeeting {
  RecurringMeeting({
    this.dayCode,
    this.dayCodeIsis,
    this.startTime,
    this.endTime,
    this.buildingCode,
    this.roomCode,
  });

  DayCode dayCode;
  DayCodeIsis dayCodeIsis;
  String startTime;
  String endTime;
  BuildingCode buildingCode;
  String roomCode;

  factory RecurringMeeting.fromJson(Map<String, dynamic> json) =>
      RecurringMeeting(
        dayCode:
            json["dayCode"] == null ? null : dayCodeValues.map[json["dayCode"]],
        dayCodeIsis: json["dayCodeIsis"] == null
            ? null
            : dayCodeIsisValues.map[json["dayCodeIsis"]],
        startTime: json["startTime"] == null ? null : json["startTime"],
        endTime: json["endTime"] == null ? null : json["endTime"],
        buildingCode: json["buildingCode"] == null
            ? null
            : buildingCodeValues.map[json["buildingCode"]],
        roomCode: json["roomCode"] == null ? null : json["roomCode"],
      );

  Map<String, dynamic> toJson() => {
        "dayCode": dayCode == null ? null : dayCodeValues.reverse[dayCode],
        "dayCodeIsis":
            dayCodeIsis == null ? null : dayCodeIsisValues.reverse[dayCodeIsis],
        "startTime": startTime == null ? null : startTime,
        "endTime": endTime == null ? null : endTime,
        "buildingCode": buildingCode == null
            ? null
            : buildingCodeValues.reverse[buildingCode],
        "roomCode": roomCode == null ? null : roomCode,
      };
}

class Metadata {
  Metadata({
    this.links,
    this.totalCount,
  });

  List<Link> links;
  int totalCount;

  factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
        links: json["links"] == null
            ? null
            : List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
        totalCount: json["totalCount"] == null ? null : json["totalCount"],
      );

  Map<String, dynamic> toJson() => {
        "links": links == null
            ? null
            : List<dynamic>.from(links.map((x) => x.toJson())),
        "totalCount": totalCount == null ? null : totalCount,
      };
}

class Link {
  Link({
    this.rel,
    this.href,
    this.method,
  });

  String rel;
  String href;
  String method;

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        rel: json["rel"] == null ? null : json["rel"],
        href: json["href"] == null ? null : json["href"],
        method: json["method"] == null ? null : json["method"],
      );

  Map<String, dynamic> toJson() => {
        "rel": rel == null ? null : rel,
        "href": href == null ? null : href,
        "method": method == null ? null : method,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
