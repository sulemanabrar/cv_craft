// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'personal_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PersonalInfo {

 String get fullName; String get professionalTitle; String get email; String get phone; String get location; String get linkedIn; String get portfolio; String get github; String get website;
/// Create a copy of PersonalInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PersonalInfoCopyWith<PersonalInfo> get copyWith => _$PersonalInfoCopyWithImpl<PersonalInfo>(this as PersonalInfo, _$identity);

  /// Serializes this PersonalInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PersonalInfo;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PersonalInfo&&(identical(other.fullName, _this.fullName) || other.fullName == _this.fullName)&&(identical(other.professionalTitle, _this.professionalTitle) || other.professionalTitle == _this.professionalTitle)&&(identical(other.email, _this.email) || other.email == _this.email)&&(identical(other.phone, _this.phone) || other.phone == _this.phone)&&(identical(other.location, _this.location) || other.location == _this.location)&&(identical(other.linkedIn, _this.linkedIn) || other.linkedIn == _this.linkedIn)&&(identical(other.portfolio, _this.portfolio) || other.portfolio == _this.portfolio)&&(identical(other.github, _this.github) || other.github == _this.github)&&(identical(other.website, _this.website) || other.website == _this.website));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PersonalInfo;
  return Object.hash(runtimeType,_this.fullName,_this.professionalTitle,_this.email,_this.phone,_this.location,_this.linkedIn,_this.portfolio,_this.github,_this.website);
}

@override
String toString() {
  final _this = this as PersonalInfo;
  return 'PersonalInfo(fullName: ${_this.fullName}, professionalTitle: ${_this.professionalTitle}, email: ${_this.email}, phone: ${_this.phone}, location: ${_this.location}, linkedIn: ${_this.linkedIn}, portfolio: ${_this.portfolio}, github: ${_this.github}, website: ${_this.website})';
}


}

/// @nodoc
abstract mixin class $PersonalInfoCopyWith<$Res>  {
  factory $PersonalInfoCopyWith(PersonalInfo value, $Res Function(PersonalInfo) _then) = _$PersonalInfoCopyWithImpl;
@useResult
$Res call({
 String fullName, String professionalTitle, String email, String phone, String location, String linkedIn, String portfolio, String github, String website
});




}
/// @nodoc
class _$PersonalInfoCopyWithImpl<$Res>
    implements $PersonalInfoCopyWith<$Res> {
  _$PersonalInfoCopyWithImpl(this._self, this._then);

  final PersonalInfo _self;
  final $Res Function(PersonalInfo) _then;

/// Create a copy of PersonalInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fullName = null,Object? professionalTitle = null,Object? email = null,Object? phone = null,Object? location = null,Object? linkedIn = null,Object? portfolio = null,Object? github = null,Object? website = null,}) {
  return _then(PersonalInfo(
fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,professionalTitle: null == professionalTitle ? _self.professionalTitle : professionalTitle // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,linkedIn: null == linkedIn ? _self.linkedIn : linkedIn // ignore: cast_nullable_to_non_nullable
as String,portfolio: null == portfolio ? _self.portfolio : portfolio // ignore: cast_nullable_to_non_nullable
as String,github: null == github ? _self.github : github // ignore: cast_nullable_to_non_nullable
as String,website: null == website ? _self.website : website // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PersonalInfo].
extension PersonalInfoPatterns on PersonalInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PersonalInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PersonalInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PersonalInfo value)  $default,){
final _that = this;
switch (_that) {
case _PersonalInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PersonalInfo value)?  $default,){
final _that = this;
switch (_that) {
case _PersonalInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String fullName,  String professionalTitle,  String email,  String phone,  String location,  String linkedIn,  String portfolio,  String github,  String website)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PersonalInfo() when $default != null:
return $default(_that.fullName,_that.professionalTitle,_that.email,_that.phone,_that.location,_that.linkedIn,_that.portfolio,_that.github,_that.website);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String fullName,  String professionalTitle,  String email,  String phone,  String location,  String linkedIn,  String portfolio,  String github,  String website)  $default,) {final _that = this;
switch (_that) {
case _PersonalInfo():
return $default(_that.fullName,_that.professionalTitle,_that.email,_that.phone,_that.location,_that.linkedIn,_that.portfolio,_that.github,_that.website);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String fullName,  String professionalTitle,  String email,  String phone,  String location,  String linkedIn,  String portfolio,  String github,  String website)?  $default,) {final _that = this;
switch (_that) {
case _PersonalInfo() when $default != null:
return $default(_that.fullName,_that.professionalTitle,_that.email,_that.phone,_that.location,_that.linkedIn,_that.portfolio,_that.github,_that.website);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PersonalInfo implements PersonalInfo {
  const _PersonalInfo({this.fullName = '', this.professionalTitle = '', this.email = '', this.phone = '', this.location = '', this.linkedIn = '', this.portfolio = '', this.github = '', this.website = ''});
  factory _PersonalInfo.fromJson(Map<String, dynamic> json) => _$PersonalInfoFromJson(json);

@override@JsonKey() final  String fullName;
@override@JsonKey() final  String professionalTitle;
@override@JsonKey() final  String email;
@override@JsonKey() final  String phone;
@override@JsonKey() final  String location;
@override@JsonKey() final  String linkedIn;
@override@JsonKey() final  String portfolio;
@override@JsonKey() final  String github;
@override@JsonKey() final  String website;

/// Create a copy of PersonalInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PersonalInfoCopyWith<_PersonalInfo> get copyWith => __$PersonalInfoCopyWithImpl<_PersonalInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PersonalInfoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PersonalInfo&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.professionalTitle, professionalTitle) || other.professionalTitle == professionalTitle)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.location, location) || other.location == location)&&(identical(other.linkedIn, linkedIn) || other.linkedIn == linkedIn)&&(identical(other.portfolio, portfolio) || other.portfolio == portfolio)&&(identical(other.github, github) || other.github == github)&&(identical(other.website, website) || other.website == website));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,fullName,professionalTitle,email,phone,location,linkedIn,portfolio,github,website);
}

@override
String toString() {
    return 'PersonalInfo(fullName: $fullName, professionalTitle: $professionalTitle, email: $email, phone: $phone, location: $location, linkedIn: $linkedIn, portfolio: $portfolio, github: $github, website: $website)';
}


}

/// @nodoc
abstract mixin class _$PersonalInfoCopyWith<$Res> implements $PersonalInfoCopyWith<$Res> {
  factory _$PersonalInfoCopyWith(_PersonalInfo value, $Res Function(_PersonalInfo) _then) = __$PersonalInfoCopyWithImpl;
@override @useResult
$Res call({
 String fullName, String professionalTitle, String email, String phone, String location, String linkedIn, String portfolio, String github, String website
});




}
/// @nodoc
class __$PersonalInfoCopyWithImpl<$Res>
    implements _$PersonalInfoCopyWith<$Res> {
  __$PersonalInfoCopyWithImpl(this._self, this._then);

  final _PersonalInfo _self;
  final $Res Function(_PersonalInfo) _then;

/// Create a copy of PersonalInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fullName = null,Object? professionalTitle = null,Object? email = null,Object? phone = null,Object? location = null,Object? linkedIn = null,Object? portfolio = null,Object? github = null,Object? website = null,}) {
  return _then(_PersonalInfo(
fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,professionalTitle: null == professionalTitle ? _self.professionalTitle : professionalTitle // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,linkedIn: null == linkedIn ? _self.linkedIn : linkedIn // ignore: cast_nullable_to_non_nullable
as String,portfolio: null == portfolio ? _self.portfolio : portfolio // ignore: cast_nullable_to_non_nullable
as String,github: null == github ? _self.github : github // ignore: cast_nullable_to_non_nullable
as String,website: null == website ? _self.website : website // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
