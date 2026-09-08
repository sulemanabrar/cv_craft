// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'education.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Education {

 String get id; String get degree; String get institution; String get location; DateTime? get startDate; DateTime? get endDate; bool get isCurrent; String get gradeOrGpa; String get description;
/// Create a copy of Education
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EducationCopyWith<Education> get copyWith => _$EducationCopyWithImpl<Education>(this as Education, _$identity);

  /// Serializes this Education to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Education;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Education&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.degree, _this.degree) || other.degree == _this.degree)&&(identical(other.institution, _this.institution) || other.institution == _this.institution)&&(identical(other.location, _this.location) || other.location == _this.location)&&(identical(other.startDate, _this.startDate) || other.startDate == _this.startDate)&&(identical(other.endDate, _this.endDate) || other.endDate == _this.endDate)&&(identical(other.isCurrent, _this.isCurrent) || other.isCurrent == _this.isCurrent)&&(identical(other.gradeOrGpa, _this.gradeOrGpa) || other.gradeOrGpa == _this.gradeOrGpa)&&(identical(other.description, _this.description) || other.description == _this.description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Education;
  return Object.hash(runtimeType,_this.id,_this.degree,_this.institution,_this.location,_this.startDate,_this.endDate,_this.isCurrent,_this.gradeOrGpa,_this.description);
}

@override
String toString() {
  final _this = this as Education;
  return 'Education(id: ${_this.id}, degree: ${_this.degree}, institution: ${_this.institution}, location: ${_this.location}, startDate: ${_this.startDate}, endDate: ${_this.endDate}, isCurrent: ${_this.isCurrent}, gradeOrGpa: ${_this.gradeOrGpa}, description: ${_this.description})';
}


}

/// @nodoc
abstract mixin class $EducationCopyWith<$Res>  {
  factory $EducationCopyWith(Education value, $Res Function(Education) _then) = _$EducationCopyWithImpl;
@useResult
$Res call({
 String id, String degree, String institution, String location, DateTime? startDate, DateTime? endDate, bool isCurrent, String gradeOrGpa, String description
});




}
/// @nodoc
class _$EducationCopyWithImpl<$Res>
    implements $EducationCopyWith<$Res> {
  _$EducationCopyWithImpl(this._self, this._then);

  final Education _self;
  final $Res Function(Education) _then;

/// Create a copy of Education
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? degree = null,Object? institution = null,Object? location = null,Object? startDate = freezed,Object? endDate = freezed,Object? isCurrent = null,Object? gradeOrGpa = null,Object? description = null,}) {
  return _then(Education(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,degree: null == degree ? _self.degree : degree // ignore: cast_nullable_to_non_nullable
as String,institution: null == institution ? _self.institution : institution // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,isCurrent: null == isCurrent ? _self.isCurrent : isCurrent // ignore: cast_nullable_to_non_nullable
as bool,gradeOrGpa: null == gradeOrGpa ? _self.gradeOrGpa : gradeOrGpa // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Education].
extension EducationPatterns on Education {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Education value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Education() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Education value)  $default,){
final _that = this;
switch (_that) {
case _Education():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Education value)?  $default,){
final _that = this;
switch (_that) {
case _Education() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String degree,  String institution,  String location,  DateTime? startDate,  DateTime? endDate,  bool isCurrent,  String gradeOrGpa,  String description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Education() when $default != null:
return $default(_that.id,_that.degree,_that.institution,_that.location,_that.startDate,_that.endDate,_that.isCurrent,_that.gradeOrGpa,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String degree,  String institution,  String location,  DateTime? startDate,  DateTime? endDate,  bool isCurrent,  String gradeOrGpa,  String description)  $default,) {final _that = this;
switch (_that) {
case _Education():
return $default(_that.id,_that.degree,_that.institution,_that.location,_that.startDate,_that.endDate,_that.isCurrent,_that.gradeOrGpa,_that.description);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String degree,  String institution,  String location,  DateTime? startDate,  DateTime? endDate,  bool isCurrent,  String gradeOrGpa,  String description)?  $default,) {final _that = this;
switch (_that) {
case _Education() when $default != null:
return $default(_that.id,_that.degree,_that.institution,_that.location,_that.startDate,_that.endDate,_that.isCurrent,_that.gradeOrGpa,_that.description);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Education implements Education {
  const _Education({required this.id, this.degree = '', this.institution = '', this.location = '', this.startDate, this.endDate, this.isCurrent = false, this.gradeOrGpa = '', this.description = ''});
  factory _Education.fromJson(Map<String, dynamic> json) => _$EducationFromJson(json);

@override final  String id;
@override@JsonKey() final  String degree;
@override@JsonKey() final  String institution;
@override@JsonKey() final  String location;
@override final  DateTime? startDate;
@override final  DateTime? endDate;
@override@JsonKey() final  bool isCurrent;
@override@JsonKey() final  String gradeOrGpa;
@override@JsonKey() final  String description;

/// Create a copy of Education
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EducationCopyWith<_Education> get copyWith => __$EducationCopyWithImpl<_Education>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EducationToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Education&&(identical(other.id, id) || other.id == id)&&(identical(other.degree, degree) || other.degree == degree)&&(identical(other.institution, institution) || other.institution == institution)&&(identical(other.location, location) || other.location == location)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.isCurrent, isCurrent) || other.isCurrent == isCurrent)&&(identical(other.gradeOrGpa, gradeOrGpa) || other.gradeOrGpa == gradeOrGpa)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,degree,institution,location,startDate,endDate,isCurrent,gradeOrGpa,description);
}

@override
String toString() {
    return 'Education(id: $id, degree: $degree, institution: $institution, location: $location, startDate: $startDate, endDate: $endDate, isCurrent: $isCurrent, gradeOrGpa: $gradeOrGpa, description: $description)';
}


}

/// @nodoc
abstract mixin class _$EducationCopyWith<$Res> implements $EducationCopyWith<$Res> {
  factory _$EducationCopyWith(_Education value, $Res Function(_Education) _then) = __$EducationCopyWithImpl;
@override @useResult
$Res call({
 String id, String degree, String institution, String location, DateTime? startDate, DateTime? endDate, bool isCurrent, String gradeOrGpa, String description
});




}
/// @nodoc
class __$EducationCopyWithImpl<$Res>
    implements _$EducationCopyWith<$Res> {
  __$EducationCopyWithImpl(this._self, this._then);

  final _Education _self;
  final $Res Function(_Education) _then;

/// Create a copy of Education
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? degree = null,Object? institution = null,Object? location = null,Object? startDate = freezed,Object? endDate = freezed,Object? isCurrent = null,Object? gradeOrGpa = null,Object? description = null,}) {
  return _then(_Education(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,degree: null == degree ? _self.degree : degree // ignore: cast_nullable_to_non_nullable
as String,institution: null == institution ? _self.institution : institution // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,isCurrent: null == isCurrent ? _self.isCurrent : isCurrent // ignore: cast_nullable_to_non_nullable
as bool,gradeOrGpa: null == gradeOrGpa ? _self.gradeOrGpa : gradeOrGpa // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
