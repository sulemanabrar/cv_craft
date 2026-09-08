// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'volunteer_experience.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VolunteerExperience {

 String get id; String get role; String get organization; String get location; DateTime? get startDate; DateTime? get endDate; bool get isCurrent; String get description;
/// Create a copy of VolunteerExperience
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VolunteerExperienceCopyWith<VolunteerExperience> get copyWith => _$VolunteerExperienceCopyWithImpl<VolunteerExperience>(this as VolunteerExperience, _$identity);

  /// Serializes this VolunteerExperience to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as VolunteerExperience;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VolunteerExperience&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.role, _this.role) || other.role == _this.role)&&(identical(other.organization, _this.organization) || other.organization == _this.organization)&&(identical(other.location, _this.location) || other.location == _this.location)&&(identical(other.startDate, _this.startDate) || other.startDate == _this.startDate)&&(identical(other.endDate, _this.endDate) || other.endDate == _this.endDate)&&(identical(other.isCurrent, _this.isCurrent) || other.isCurrent == _this.isCurrent)&&(identical(other.description, _this.description) || other.description == _this.description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as VolunteerExperience;
  return Object.hash(runtimeType,_this.id,_this.role,_this.organization,_this.location,_this.startDate,_this.endDate,_this.isCurrent,_this.description);
}

@override
String toString() {
  final _this = this as VolunteerExperience;
  return 'VolunteerExperience(id: ${_this.id}, role: ${_this.role}, organization: ${_this.organization}, location: ${_this.location}, startDate: ${_this.startDate}, endDate: ${_this.endDate}, isCurrent: ${_this.isCurrent}, description: ${_this.description})';
}


}

/// @nodoc
abstract mixin class $VolunteerExperienceCopyWith<$Res>  {
  factory $VolunteerExperienceCopyWith(VolunteerExperience value, $Res Function(VolunteerExperience) _then) = _$VolunteerExperienceCopyWithImpl;
@useResult
$Res call({
 String id, String role, String organization, String location, DateTime? startDate, DateTime? endDate, bool isCurrent, String description
});




}
/// @nodoc
class _$VolunteerExperienceCopyWithImpl<$Res>
    implements $VolunteerExperienceCopyWith<$Res> {
  _$VolunteerExperienceCopyWithImpl(this._self, this._then);

  final VolunteerExperience _self;
  final $Res Function(VolunteerExperience) _then;

/// Create a copy of VolunteerExperience
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? role = null,Object? organization = null,Object? location = null,Object? startDate = freezed,Object? endDate = freezed,Object? isCurrent = null,Object? description = null,}) {
  return _then(VolunteerExperience(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,organization: null == organization ? _self.organization : organization // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,isCurrent: null == isCurrent ? _self.isCurrent : isCurrent // ignore: cast_nullable_to_non_nullable
as bool,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [VolunteerExperience].
extension VolunteerExperiencePatterns on VolunteerExperience {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VolunteerExperience value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VolunteerExperience() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VolunteerExperience value)  $default,){
final _that = this;
switch (_that) {
case _VolunteerExperience():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VolunteerExperience value)?  $default,){
final _that = this;
switch (_that) {
case _VolunteerExperience() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String role,  String organization,  String location,  DateTime? startDate,  DateTime? endDate,  bool isCurrent,  String description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VolunteerExperience() when $default != null:
return $default(_that.id,_that.role,_that.organization,_that.location,_that.startDate,_that.endDate,_that.isCurrent,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String role,  String organization,  String location,  DateTime? startDate,  DateTime? endDate,  bool isCurrent,  String description)  $default,) {final _that = this;
switch (_that) {
case _VolunteerExperience():
return $default(_that.id,_that.role,_that.organization,_that.location,_that.startDate,_that.endDate,_that.isCurrent,_that.description);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String role,  String organization,  String location,  DateTime? startDate,  DateTime? endDate,  bool isCurrent,  String description)?  $default,) {final _that = this;
switch (_that) {
case _VolunteerExperience() when $default != null:
return $default(_that.id,_that.role,_that.organization,_that.location,_that.startDate,_that.endDate,_that.isCurrent,_that.description);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VolunteerExperience implements VolunteerExperience {
  const _VolunteerExperience({required this.id, this.role = '', this.organization = '', this.location = '', this.startDate, this.endDate, this.isCurrent = false, this.description = ''});
  factory _VolunteerExperience.fromJson(Map<String, dynamic> json) => _$VolunteerExperienceFromJson(json);

@override final  String id;
@override@JsonKey() final  String role;
@override@JsonKey() final  String organization;
@override@JsonKey() final  String location;
@override final  DateTime? startDate;
@override final  DateTime? endDate;
@override@JsonKey() final  bool isCurrent;
@override@JsonKey() final  String description;

/// Create a copy of VolunteerExperience
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VolunteerExperienceCopyWith<_VolunteerExperience> get copyWith => __$VolunteerExperienceCopyWithImpl<_VolunteerExperience>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VolunteerExperienceToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _VolunteerExperience&&(identical(other.id, id) || other.id == id)&&(identical(other.role, role) || other.role == role)&&(identical(other.organization, organization) || other.organization == organization)&&(identical(other.location, location) || other.location == location)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.isCurrent, isCurrent) || other.isCurrent == isCurrent)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,role,organization,location,startDate,endDate,isCurrent,description);
}

@override
String toString() {
    return 'VolunteerExperience(id: $id, role: $role, organization: $organization, location: $location, startDate: $startDate, endDate: $endDate, isCurrent: $isCurrent, description: $description)';
}


}

/// @nodoc
abstract mixin class _$VolunteerExperienceCopyWith<$Res> implements $VolunteerExperienceCopyWith<$Res> {
  factory _$VolunteerExperienceCopyWith(_VolunteerExperience value, $Res Function(_VolunteerExperience) _then) = __$VolunteerExperienceCopyWithImpl;
@override @useResult
$Res call({
 String id, String role, String organization, String location, DateTime? startDate, DateTime? endDate, bool isCurrent, String description
});




}
/// @nodoc
class __$VolunteerExperienceCopyWithImpl<$Res>
    implements _$VolunteerExperienceCopyWith<$Res> {
  __$VolunteerExperienceCopyWithImpl(this._self, this._then);

  final _VolunteerExperience _self;
  final $Res Function(_VolunteerExperience) _then;

/// Create a copy of VolunteerExperience
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? role = null,Object? organization = null,Object? location = null,Object? startDate = freezed,Object? endDate = freezed,Object? isCurrent = null,Object? description = null,}) {
  return _then(_VolunteerExperience(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,organization: null == organization ? _self.organization : organization // ignore: cast_nullable_to_non_nullable
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
