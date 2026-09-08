import 'package:freezed_annotation/freezed_annotation.dart';

part 'experience.freezed.dart';
part 'experience.g.dart';

@freezed
abstract class Experience with _$Experience {
  const factory Experience({
    required String id,
    @Default('') String jobTitle,
    @Default('') String company,
    @Default('') String location,
    DateTime? startDate,
    DateTime? endDate,
    @Default(false) bool isCurrent,
    @Default('') String description,
  }) = _Experience;

  factory Experience.fromJson(Map<String, dynamic> json) =>
      _$ExperienceFromJson(json);
}
