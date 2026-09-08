import 'package:freezed_annotation/freezed_annotation.dart';

part 'custom_section.freezed.dart';
part 'custom_section.g.dart';

@freezed
abstract class CustomSectionItem with _$CustomSectionItem {
  const factory CustomSectionItem({
    required String id,
    @Default('') String title,
    @Default('') String description,
  }) = _CustomSectionItem;

  factory CustomSectionItem.fromJson(Map<String, dynamic> json) =>
      _$CustomSectionItemFromJson(json);
}

@freezed
abstract class CustomSection with _$CustomSection {
  const factory CustomSection({
    required String id,
    @Default('Custom Section') String title,
    @Default(<CustomSectionItem>[]) List<CustomSectionItem> items,
  }) = _CustomSection;

  factory CustomSection.fromJson(Map<String, dynamic> json) =>
      _$CustomSectionFromJson(json);
}
