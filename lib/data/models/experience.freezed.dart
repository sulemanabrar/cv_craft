// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'experience.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Experience {

 String get id; String get jobTitle; String get company; String get location; DateTime? get startDate; DateTime? get endDate; bool get isCurrent; String get description;
/// Create a copy of Experience
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExperienceCopyWith<Experience> get copyWith => _$ExperienceCopyWithImpl<Experience>(this as Experience, _$identity);

  /// Serializes this Experience to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Experience;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Experience&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.jobTitle, _this.jobTitle) || other.jobTitle == _this.jobTitle)&&(identical(other.company, _this.company) || other.company == _this.company)&&(identical(other.location, _this.location) || other.location == _this.location)&&(identical(other.startDate, _this.startDate) || other.startDate == _this.startDate)&&(identical(other.endDate, _this.endDate) || other.endDate == _this.endDate)&&(identical(other.isCurrent, _this.isCurrent) || other.isCurrent == _this.isCurrent)&&(identical(other.description, _this.description) || other.description == _this.description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Experience;
  return Object.hash(runtimeType,_this.id,_this.jobTitle,_this.company,_this.location,_this.startDate,_this.endDate,_this.isCurrent,_this.description);
}

@override
String toString() {
  final _this = this as Experience;
  return 'Experience(id: ${_this.id}, jobTitle: ${_this.jobTitle}, company: ${_this.company}, location: ${_this.location}, startDate: ${_this.startDate}, endDate: ${_this.endDate}, isCurrent: ${_this.isCurrent}, description: ${_this.description})';
}


}

/// @nodoc
abstract mixin class $ExperienceCopyWith<$Res>  {
  factory $ExperienceCopyWith(Experience value, $Res Function(Experience) _then) = _$ExperienceCopyWithImpl;
@useResult
$Res call({
 String id, String jobTitle, String company, String location, DateTime? startDate, DateTime? endDate, bool isCurrent, String description
});




}
/// @nodoc
class _$ExperienceCopyWithImpl<$Res>
    implements $ExperienceCopyWith<$Res> {
  _$ExperienceCopyWithImpl(this._self, this._then);

  final Experience _self;
  final $Res Function(Experience) _then;

/// Create a copy of Experience
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? jobTitle = null,Object? company = null,Object? location = null,Object? startDate = freezed,Object? endDate = freezed,Object? isCurrent = null,Object? description = null,}) {
  return _then(Experience(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,jobTitle: null == jobTitle ? _self.jobTitle : jobTitle // ignore: cast_nullable_to_non_nullable
as String,company: null == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,isCurrent: null == isCurrent ? _self.isCurrent : isCurrent // ignore: cast_nullable_to_non_nullable
as bool,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Experience].
extension ExperiencePatterns on Experience {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Experience value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Experience() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Experience value)  $default,){
final _that = this;
switch (_that) {
case _Experience():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Experience value)?  $default,){
final _that = this;
switch (_that) {
case _Experience() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String jobTitle,  String company,  String location,  DateTime? startDate,  DateTime? endDate,  bool isCurrent,  String description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Experience() when $default != null:
return $default(_that.id,_that.jobTitle,_that.company,_that.location,_that.startDate,_that.endDate,_that.isCurrent,_that.description);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String jobTitle,  String company,  String location,  DateTime? startDate,  DateTime? endDate,  bool isCurrent,  String description)  $default,) {final _that = this;
switch (_that) {
case _Experience():
return $default(_that.id,_that.jobTitle,_that.company,_that.location,_that.startDate,_that.endDate,_that.isCurrent,_that.description);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String jobTitle,  String company,  String location,  DateTime? startDate,  DateTime? endDate,  bool isCurrent,  String description)?  $default,) {final _that = this;
switch (_that) {
case _Experience() when $default != null:
return $default(_that.id,_that.jobTitle,_that.company,_that.location,_that.startDate,_that.endDate,_that.isCurrent,_that.description);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Experience implements Experience {
  const _Experience({required this.id, this.jobTitle = '', this.company = '', this.location = '', this.startDate, this.endDate, this.isCurrent = false, this.description = ''});
  factory _Experience.fromJson(Map<String, dynamic> json) => _$ExperienceFromJson(json);

@override final  String id;
@override@JsonKey() final  String jobTitle;
@override@JsonKey() final  String company;
@override@JsonKey() final  String location;
@override final  DateTime? startDate;
@override final  DateTime? endDate;
@override@JsonKey() final  bool isCurrent;
@override@JsonKey() final  String description;

/// Create a copy of Experience
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExperienceCopyWith<_Experience> get copyWith => __$ExperienceCopyWithImpl<_Experience>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExperienceToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Experience&&(identical(other.id, id) || other.id == id)&&(identical(other.jobTitle, jobTitle) || other.jobTitle == jobTitle)&&(identical(other.company, company) || other.company == company)&&(identical(other.location, location) || other.location == location)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.isCurrent, isCurrent) || other.isCurrent == isCurrent)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,jobTitle,company,location,startDate,endDate,isCurrent,description);
}

@override
String toString() {
    return 'Experience(id: $id, jobTitle: $jobTitle, company: $company, location: $location, startDate: $startDate, endDate: $endDate, isCurrent: $isCurrent, description: $description)';
}


}

/// @nodoc
abstract mixin class _$ExperienceCopyWith<$Res> implements $ExperienceCopyWith<$Res> {
  factory _$ExperienceCopyWith(_Experience value, $Res Function(_Experience) _then) = __$ExperienceCopyWithImpl;
@override @useResult
$Res call({
 String id, String jobTitle, String company, String location, DateTime? startDate, DateTime? endDate, bool isCurrent, String description
});




}
/// @nodoc
class __$ExperienceCopyWithImpl<$Res>
    implements _$ExperienceCopyWith<$Res> {
  __$ExperienceCopyWithImpl(this._self, this._then);

  final _Experience _self;
  final $Res Function(_Experience) _then;

/// Create a copy of Experience
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? jobTitle = null,Object? company = null,Object? location = null,Object? startDate = freezed,Object? endDate = freezed,Object? isCurrent = null,Object? description = null,}) {
  return _then(_Experience(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,jobTitle: null == jobTitle ? _self.jobTitle : jobTitle // ignore: cast_nullable_to_non_nullable
as String,company: null == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,isCurrent: null == isCurrent ? _self.isCurrent : isCurrent // ignore: cast_nullable_to_non_nullable
as bool,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
