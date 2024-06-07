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

  factory DetectedTime.fromString(String time) {
    final parts = time.split(':');
    final hour = int.parse(parts[0]);
    final minute = int.parse(parts[1]);
    final second = int.parse(parts[2]);
    const nano = 0;

    return DetectedTime(
      hour: hour,
      minute: minute,
      second: second,
      nano: nano
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
        detectedTime: DetectedTime.fromString(json['detectedTime']),
      );
    }

    return _$ObjectCheckFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ObjectCheckToJson(this);

}
