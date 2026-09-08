import 'package:freezed_annotation/freezed_annotation.dart';

part 'reference_entry.freezed.dart';
part 'reference_entry.g.dart';

@freezed
abstract class ReferenceEntry with _$ReferenceEntry {
  const factory ReferenceEntry({
    required String id,
    @Default('') String name,
    @Default('') String relationship,
    @Default('') String company,
    @Default('') String email,
    @Default('') String phone,
  }) = _ReferenceEntry;

  factory ReferenceEntry.fromJson(Map<String, dynamic> json) =>
      _$ReferenceEntryFromJson(json);
}
