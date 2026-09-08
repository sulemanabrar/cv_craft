import 'package:freezed_annotation/freezed_annotation.dart';

part 'language_entry.freezed.dart';
part 'language_entry.g.dart';

@freezed
abstract class LanguageEntry with _$LanguageEntry {
  const factory LanguageEntry({
    required String id,
    @Default('') String name,
    @Default('Conversational') String proficiency,
  }) = _LanguageEntry;

  factory LanguageEntry.fromJson(Map<String, dynamic> json) =>
      _$LanguageEntryFromJson(json);
}
