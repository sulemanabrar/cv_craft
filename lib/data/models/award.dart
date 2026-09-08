import 'package:freezed_annotation/freezed_annotation.dart';

part 'award.freezed.dart';
part 'award.g.dart';

@freezed
abstract class Award with _$Award {
  const factory Award({
    required String id,
    @Default('') String title,
    @Default('') String issuer,
    DateTime? date,
    @Default('') String description,
  }) = _Award;

  factory Award.fromJson(Map<String, dynamic> json) => _$AwardFromJson(json);
}
