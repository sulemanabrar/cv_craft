import 'package:freezed_annotation/freezed_annotation.dart';

part 'certification.freezed.dart';
part 'certification.g.dart';

@freezed
abstract class Certification with _$Certification {
  const factory Certification({
    required String id,
    @Default('') String name,
    @Default('') String issuer,
    DateTime? issueDate,
    DateTime? expiryDate,
    @Default('') String credentialId,
    @Default('') String credentialUrl,
  }) = _Certification;

  factory Certification.fromJson(Map<String, dynamic> json) =>
      _$CertificationFromJson(json);
}
