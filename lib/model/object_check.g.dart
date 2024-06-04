// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'object_check.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetectedTime _$DetectedTimeFromJson(Map<String, dynamic> json) => DetectedTime(
      hour: json['hour'] as String?,
      minute: json['minute'] as String?,
      second: json['second'] as String?,
      nano: json['nano'] as String,
    );

Map<String, dynamic> _$DetectedTimeToJson(DetectedTime instance) =>
    <String, dynamic>{
      'hour': instance.hour,
      'minute': instance.minute,
      'second': instance.second,
      'nano': instance.nano,
    };

ObjectCheck _$ObjectCheckFromJson(Map<String, dynamic> json) => ObjectCheck(
      location: json['location'] as String?,
      detectedClass: json['detectedClass'] as String?,
      detectedDate: json['detectedDate'] as String?,
      detectionCheck: json['detectionCheck'] as bool?,
      detectedTime: json['detectedTime'] == null
          ? null
          : DetectedTime.fromJson(json['detectedTime'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ObjectCheckToJson(ObjectCheck instance) =>
    <String, dynamic>{
      'location': instance.location,
      'detectedClass': instance.detectedClass,
      'detectedDate': instance.detectedDate,
      'detectionCheck': instance.detectionCheck,
      'detectedTime': instance.detectedTime,
    };
