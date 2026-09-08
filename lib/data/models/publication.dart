import 'package:freezed_annotation/freezed_annotation.dart';

part 'publication.freezed.dart';
part 'publication.g.dart';

@freezed
abstract class Publication with _$Publication {
  const factory Publication({
    required String id,
    @Default('') String title,
    @Default('') String publisher,
    DateTime? date,
    @Default('') String url,
    @Default('') String description,
  }) = _Publication;

  factory Publication.fromJson(Map<String, dynamic> json) =>
      _$PublicationFromJson(json);
}
