import 'package:freezed_annotation/freezed_annotation.dart';

part 'volunteer_experience.freezed.dart';
part 'volunteer_experience.g.dart';

@freezed
abstract class VolunteerExperience with _$VolunteerExperience {
  const factory VolunteerExperience({
    required String id,
    @Default('') String role,
    @Default('') String organization,
    @Default('') String location,
    DateTime? startDate,
    DateTime? endDate,
    @Default(false) bool isCurrent,
    @Default('') String description,
  }) = _VolunteerExperience;

  factory VolunteerExperience.fromJson(Map<String, dynamic> json) =>
      _$VolunteerExperienceFromJson(json);
}
