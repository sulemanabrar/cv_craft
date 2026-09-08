import 'package:freezed_annotation/freezed_annotation.dart';

part 'personal_info.freezed.dart';
part 'personal_info.g.dart';

@freezed
abstract class PersonalInfo with _$PersonalInfo {
  const factory PersonalInfo({
    @Default('') String fullName,
    @Default('') String professionalTitle,
    @Default('') String email,
    @Default('') String phone,
    @Default('') String location,
    @Default('') String linkedIn,
    @Default('') String portfolio,
    @Default('') String github,
    @Default('') String website,
  }) = _PersonalInfo;

  factory PersonalInfo.fromJson(Map<String, dynamic> json) =>
      _$PersonalInfoFromJson(json);
}
