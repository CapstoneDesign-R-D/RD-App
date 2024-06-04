import 'package:json_annotation/json_annotation.dart';

part 'object_check.g.dart';

@JsonSerializable()
class DetectedTime {
  String? hour;
  String? minute;
  String? second;
  String? nano;

  DetectedTime({
    this.hour,
    this.minute,
    this.second,
    this.nano,
  });

  factory DetectedTime.fromJson(Map<String, dynamic> json) => _$DetectedTimeFromJson(json);
  Map<String, dynamic> toJson() => _$DetectedTimeToJson(this);

  factory DetectedTime.fromString(String time) {
    final parts = time.split(':');
    final hour = parts[0];
    final minute = parts[1];
    final second = parts[2];

    return DetectedTime(
      hour: hour,
      minute: minute,
      second: second,
    );
  }
}

@JsonSerializable()
class ObjectCheck {
  String? location;
  String? detectedClass;
  String? detectedDate;
  int? objId;
  bool? detectionCheck;
  DetectedTime? detectedTime;

  ObjectCheck({
    this.location,
    this.detectedClass,
    this.detectedDate,
    this.objId,
    this.detectionCheck,
    this.detectedTime,
  });

  factory ObjectCheck.fromJson(Map<String, dynamic> json) {
    if (json['detectedTime'] is String) {
      return ObjectCheck(
        location: json['location'] as String?,
        detectedClass: json['detectedClass'] as String?,
        detectedDate: json['detectedDate'] as String?,
        objId: json['objId'] as int?,
        detectionCheck: json['detectionCheck'] as bool?,
        detectedTime: DetectedTime.fromString(json['detectedTime'] as String),
      );
    }

    return _$ObjectCheckFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ObjectCheckToJson(this);
}
