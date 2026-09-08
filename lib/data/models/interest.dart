import 'package:freezed_annotation/freezed_annotation.dart';

part 'interest.freezed.dart';
part 'interest.g.dart';

@freezed
abstract class Interest with _$Interest {
  const factory Interest({required String id, @Default('') String name}) =
      _Interest;

  factory Interest.fromJson(Map<String, dynamic> json) =>
      _$InterestFromJson(json);
}
