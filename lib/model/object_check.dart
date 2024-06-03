import 'package:json_annotation/json_annotation.dart';

part 'object_check.g.dart';

@JsonSerializable()
class DetectedTime {
  int? hour;
  int? minute;
  int? second;
  int? nano;

  DetectedTime({
    this.hour,
    this.minute,
    this.second,
    this.nano,
  });

  factory DetectedTime.fromJson(Map<String, dynamic> json) => _$DetectedTimeFromJson(json);
  Map<String, dynamic> toJson() => _$DetectedTimeToJson(this);
}

@JsonSerializable()
class ObjectCheck {
  String? location;
  String? detectedClass;
  String? detectedDate;
  bool? detectionCheck;
  DetectedTime? detectedTime;

  ObjectCheck({
    this.location,
    this.detectedClass,
    this.detectedDate,
    this.detectionCheck,
    this.detectedTime,
  });

  factory ObjectCheck.fromJson(Map<String, dynamic> json) => _$ObjectCheckFromJson(json);
  Map<String, dynamic> toJson() => _$ObjectCheckToJson(this);
}
