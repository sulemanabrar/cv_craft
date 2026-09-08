import 'package:freezed_annotation/freezed_annotation.dart';

part 'resume_styling.freezed.dart';
part 'resume_styling.g.dart';

/// Font families available in the PDF renderer. Values are stable ids
/// (never renamed) since they're persisted inside `ResumeStyling.fontFamily`.
abstract final class ResumeFontFamilyIds {
  static const String firaSans = 'fira_sans';
  static const String ptSerif = 'pt_serif';
}

/// Styling is purely presentational — changing it must never modify resume
/// content. `templateId` selects the layout; everything else tunes it.
@freezed
abstract class ResumeStyling with _$ResumeStyling {
  const factory ResumeStyling({
    @Default('ats_classic') String templateId,
    @Default('navy') String colorPresetId,
    @Default(ResumeFontFamilyIds.firaSans) String fontFamily,
    @Default(1.0) double fontSizeScale,
    @Default(1.0) double headingSizeScale,
    @Default(1.0) double lineSpacingScale,
  }) = _ResumeStyling;

  factory ResumeStyling.fromJson(Map<String, dynamic> json) =>
      _$ResumeStylingFromJson(json);
}
