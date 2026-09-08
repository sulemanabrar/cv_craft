import 'package:freezed_annotation/freezed_annotation.dart';

part 'project.freezed.dart';
part 'project.g.dart';

@freezed
abstract class Project with _$Project {
  const factory Project({
    required String id,
    @Default('') String name,
    @Default('') String role,
    @Default('') String description,
    @Default(<String>[]) List<String> technologies,
    @Default('') String url,
    @Default('') String githubUrl,
  }) = _Project;

  factory Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);
}
