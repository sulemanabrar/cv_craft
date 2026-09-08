// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reference_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReferenceEntry {

 String get id; String get name; String get relationship; String get company; String get email; String get phone;
/// Create a copy of ReferenceEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReferenceEntryCopyWith<ReferenceEntry> get copyWith => _$ReferenceEntryCopyWithImpl<ReferenceEntry>(this as ReferenceEntry, _$identity);

  /// Serializes this ReferenceEntry to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ReferenceEntry;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReferenceEntry&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.relationship, _this.relationship) || other.relationship == _this.relationship)&&(identical(other.company, _this.company) || other.company == _this.company)&&(identical(other.email, _this.email) || other.email == _this.email)&&(identical(other.phone, _this.phone) || other.phone == _this.phone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ReferenceEntry;
  return Object.hash(runtimeType,_this.id,_this.name,_this.relationship,_this.company,_this.email,_this.phone);
}

@override
String toString() {
  final _this = this as ReferenceEntry;
  return 'ReferenceEntry(id: ${_this.id}, name: ${_this.name}, relationship: ${_this.relationship}, company: ${_this.company}, email: ${_this.email}, phone: ${_this.phone})';
}


}

/// @nodoc
abstract mixin class $ReferenceEntryCopyWith<$Res>  {
  factory $ReferenceEntryCopyWith(ReferenceEntry value, $Res Function(ReferenceEntry) _then) = _$ReferenceEntryCopyWithImpl;
@useResult
$Res call({
 String id, String name, String relationship, String company, String email, String phone
});




}
/// @nodoc
class _$ReferenceEntryCopyWithImpl<$Res>
    implements $ReferenceEntryCopyWith<$Res> {
  _$ReferenceEntryCopyWithImpl(this._self, this._then);

  final ReferenceEntry _self;
  final $Res Function(ReferenceEntry) _then;

/// Create a copy of ReferenceEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? relationship = null,Object? company = null,Object? email = null,Object? phone = null,}) {
  return _then(ReferenceEntry(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,relationship: null == relationship ? _self.relationship : relationship // ignore: cast_nullable_to_non_nullable
as String,company: null == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ReferenceEntry].
extension ReferenceEntryPatterns on ReferenceEntry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReferenceEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReferenceEntry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReferenceEntry value)  $default,){
final _that = this;
switch (_that) {
case _ReferenceEntry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReferenceEntry value)?  $default,){
final _that = this;
switch (_that) {
case _ReferenceEntry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String relationship,  String company,  String email,  String phone)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReferenceEntry() when $default != null:
return $default(_that.id,_that.name,_that.relationship,_that.company,_that.email,_that.phone);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String relationship,  String company,  String email,  String phone)  $default,) {final _that = this;
switch (_that) {
case _ReferenceEntry():
return $default(_that.id,_that.name,_that.relationship,_that.company,_that.email,_that.phone);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String relationship,  String company,  String email,  String phone)?  $default,) {final _that = this;
switch (_that) {
case _ReferenceEntry() when $default != null:
return $default(_that.id,_that.name,_that.relationship,_that.company,_that.email,_that.phone);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReferenceEntry implements ReferenceEntry {
  const _ReferenceEntry({required this.id, this.name = '', this.relationship = '', this.company = '', this.email = '', this.phone = ''});
  factory _ReferenceEntry.fromJson(Map<String, dynamic> json) => _$ReferenceEntryFromJson(json);

@override final  String id;
@override@JsonKey() final  String name;
@override@JsonKey() final  String relationship;
@override@JsonKey() final  String company;
@override@JsonKey() final  String email;
@override@JsonKey() final  String phone;

/// Create a copy of ReferenceEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReferenceEntryCopyWith<_ReferenceEntry> get copyWith => __$ReferenceEntryCopyWithImpl<_ReferenceEntry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReferenceEntryToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReferenceEntry&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.relationship, relationship) || other.relationship == relationship)&&(identical(other.company, company) || other.company == company)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,relationship,company,email,phone);
}

@override
String toString() {
    return 'ReferenceEntry(id: $id, name: $name, relationship: $relationship, company: $company, email: $email, phone: $phone)';
}


}

/// @nodoc
abstract mixin class _$ReferenceEntryCopyWith<$Res> implements $ReferenceEntryCopyWith<$Res> {
  factory _$ReferenceEntryCopyWith(_ReferenceEntry value, $Res Function(_ReferenceEntry) _then) = __$ReferenceEntryCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String relationship, String company, String email, String phone
});




}
/// @nodoc
class __$ReferenceEntryCopyWithImpl<$Res>
    implements _$ReferenceEntryCopyWith<$Res> {
  __$ReferenceEntryCopyWithImpl(this._self, this._then);

  final _ReferenceEntry _self;
  final $Res Function(_ReferenceEntry) _then;

/// Create a copy of ReferenceEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? relationship = null,Object? company = null,Object? email = null,Object? phone = null,}) {
  return _then(_ReferenceEntry(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,relationship: null == relationship ? _self.relationship : relationship // ignore: cast_nullable_to_non_nullable
as String,company: null == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
