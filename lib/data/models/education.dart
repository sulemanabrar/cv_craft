import 'package:freezed_annotation/freezed_annotation.dart';

part 'education.freezed.dart';
part 'education.g.dart';

@freezed
abstract class Education with _$Education {
  const factory Education({
    required String id,
    @Default('') String degree,
    @Default('') String institution,
    @Default('') String location,
    DateTime? startDate,
    DateTime? endDate,
    @Default(false) bool isCurrent,
    @Default('') String gradeOrGpa,
    @Default('') String description,
  }) = _Education;

  factory Education.fromJson(Map<String, dynamic> json) =>
      _$EducationFromJson(json);
}
