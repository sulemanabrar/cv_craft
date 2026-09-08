// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'certification.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Certification {

 String get id; String get name; String get issuer; DateTime? get issueDate; DateTime? get expiryDate; String get credentialId; String get credentialUrl;
/// Create a copy of Certification
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CertificationCopyWith<Certification> get copyWith => _$CertificationCopyWithImpl<Certification>(this as Certification, _$identity);

  /// Serializes this Certification to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Certification;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Certification&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.issuer, _this.issuer) || other.issuer == _this.issuer)&&(identical(other.issueDate, _this.issueDate) || other.issueDate == _this.issueDate)&&(identical(other.expiryDate, _this.expiryDate) || other.expiryDate == _this.expiryDate)&&(identical(other.credentialId, _this.credentialId) || other.credentialId == _this.credentialId)&&(identical(other.credentialUrl, _this.credentialUrl) || other.credentialUrl == _this.credentialUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Certification;
  return Object.hash(runtimeType,_this.id,_this.name,_this.issuer,_this.issueDate,_this.expiryDate,_this.credentialId,_this.credentialUrl);
}

@override
String toString() {
  final _this = this as Certification;
  return 'Certification(id: ${_this.id}, name: ${_this.name}, issuer: ${_this.issuer}, issueDate: ${_this.issueDate}, expiryDate: ${_this.expiryDate}, credentialId: ${_this.credentialId}, credentialUrl: ${_this.credentialUrl})';
}


}

/// @nodoc
abstract mixin class $CertificationCopyWith<$Res>  {
  factory $CertificationCopyWith(Certification value, $Res Function(Certification) _then) = _$CertificationCopyWithImpl;
@useResult
$Res call({
 String id, String name, String issuer, DateTime? issueDate, DateTime? expiryDate, String credentialId, String credentialUrl
});




}
/// @nodoc
class _$CertificationCopyWithImpl<$Res>
    implements $CertificationCopyWith<$Res> {
  _$CertificationCopyWithImpl(this._self, this._then);

  final Certification _self;
  final $Res Function(Certification) _then;

/// Create a copy of Certification
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? issuer = null,Object? issueDate = freezed,Object? expiryDate = freezed,Object? credentialId = null,Object? credentialUrl = null,}) {
  return _then(Certification(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,issuer: null == issuer ? _self.issuer : issuer // ignore: cast_nullable_to_non_nullable
as String,issueDate: freezed == issueDate ? _self.issueDate : issueDate // ignore: cast_nullable_to_non_nullable
as DateTime?,expiryDate: freezed == expiryDate ? _self.expiryDate : expiryDate // ignore: cast_nullable_to_non_nullable
as DateTime?,credentialId: null == credentialId ? _self.credentialId : credentialId // ignore: cast_nullable_to_non_nullable
as String,credentialUrl: null == credentialUrl ? _self.credentialUrl : credentialUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Certification].
extension CertificationPatterns on Certification {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Certification value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Certification() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Certification value)  $default,){
final _that = this;
switch (_that) {
case _Certification():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Certification value)?  $default,){
final _that = this;
switch (_that) {
case _Certification() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String issuer,  DateTime? issueDate,  DateTime? expiryDate,  String credentialId,  String credentialUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Certification() when $default != null:
return $default(_that.id,_that.name,_that.issuer,_that.issueDate,_that.expiryDate,_that.credentialId,_that.credentialUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String issuer,  DateTime? issueDate,  DateTime? expiryDate,  String credentialId,  String credentialUrl)  $default,) {final _that = this;
switch (_that) {
case _Certification():
return $default(_that.id,_that.name,_that.issuer,_that.issueDate,_that.expiryDate,_that.credentialId,_that.credentialUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String issuer,  DateTime? issueDate,  DateTime? expiryDate,  String credentialId,  String credentialUrl)?  $default,) {final _that = this;
switch (_that) {
case _Certification() when $default != null:
return $default(_that.id,_that.name,_that.issuer,_that.issueDate,_that.expiryDate,_that.credentialId,_that.credentialUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Certification implements Certification {
  const _Certification({required this.id, this.name = '', this.issuer = '', this.issueDate, this.expiryDate, this.credentialId = '', this.credentialUrl = ''});
  factory _Certification.fromJson(Map<String, dynamic> json) => _$CertificationFromJson(json);

@override final  String id;
@override@JsonKey() final  String name;
@override@JsonKey() final  String issuer;
@override final  DateTime? issueDate;
@override final  DateTime? expiryDate;
@override@JsonKey() final  String credentialId;
@override@JsonKey() final  String credentialUrl;

/// Create a copy of Certification
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CertificationCopyWith<_Certification> get copyWith => __$CertificationCopyWithImpl<_Certification>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CertificationToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Certification&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.issuer, issuer) || other.issuer == issuer)&&(identical(other.issueDate, issueDate) || other.issueDate == issueDate)&&(identical(other.expiryDate, expiryDate) || other.expiryDate == expiryDate)&&(identical(other.credentialId, credentialId) || other.credentialId == credentialId)&&(identical(other.credentialUrl, credentialUrl) || other.credentialUrl == credentialUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,issuer,issueDate,expiryDate,credentialId,credentialUrl);
}

@override
String toString() {
    return 'Certification(id: $id, name: $name, issuer: $issuer, issueDate: $issueDate, expiryDate: $expiryDate, credentialId: $credentialId, credentialUrl: $credentialUrl)';
}


}

/// @nodoc
abstract mixin class _$CertificationCopyWith<$Res> implements $CertificationCopyWith<$Res> {
  factory _$CertificationCopyWith(_Certification value, $Res Function(_Certification) _then) = __$CertificationCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String issuer, DateTime? issueDate, DateTime? expiryDate, String credentialId, String credentialUrl
});




}
/// @nodoc
class __$CertificationCopyWithImpl<$Res>
    implements _$CertificationCopyWith<$Res> {
  __$CertificationCopyWithImpl(this._self, this._then);

  final _Certification _self;
  final $Res Function(_Certification) _then;

/// Create a copy of Certification
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? issuer = null,Object? issueDate = freezed,Object? expiryDate = freezed,Object? credentialId = null,Object? credentialUrl = null,}) {
  return _then(_Certification(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,issuer: null == issuer ? _self.issuer : issuer // ignore: cast_nullable_to_non_nullable
as String,issueDate: freezed == issueDate ? _self.issueDate : issueDate // ignore: cast_nullable_to_non_nullable
as DateTime?,expiryDate: freezed == expiryDate ? _self.expiryDate : expiryDate // ignore: cast_nullable_to_non_nullable
as DateTime?,credentialId: null == credentialId ? _self.credentialId : credentialId // ignore: cast_nullable_to_non_nullable
as String,credentialUrl: null == credentialUrl ? _self.credentialUrl : credentialUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
