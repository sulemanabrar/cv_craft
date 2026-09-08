// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'language_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LanguageEntry {

 String get id; String get name; String get proficiency;
/// Create a copy of LanguageEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LanguageEntryCopyWith<LanguageEntry> get copyWith => _$LanguageEntryCopyWithImpl<LanguageEntry>(this as LanguageEntry, _$identity);

  /// Serializes this LanguageEntry to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as LanguageEntry;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LanguageEntry&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.proficiency, _this.proficiency) || other.proficiency == _this.proficiency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as LanguageEntry;
  return Object.hash(runtimeType,_this.id,_this.name,_this.proficiency);
}

@override
String toString() {
  final _this = this as LanguageEntry;
  return 'LanguageEntry(id: ${_this.id}, name: ${_this.name}, proficiency: ${_this.proficiency})';
}


}

/// @nodoc
abstract mixin class $LanguageEntryCopyWith<$Res>  {
  factory $LanguageEntryCopyWith(LanguageEntry value, $Res Function(LanguageEntry) _then) = _$LanguageEntryCopyWithImpl;
@useResult
$Res call({
 String id, String name, String proficiency
});




}
/// @nodoc
class _$LanguageEntryCopyWithImpl<$Res>
    implements $LanguageEntryCopyWith<$Res> {
  _$LanguageEntryCopyWithImpl(this._self, this._then);

  final LanguageEntry _self;
  final $Res Function(LanguageEntry) _then;

/// Create a copy of LanguageEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? proficiency = null,}) {
  return _then(LanguageEntry(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,proficiency: null == proficiency ? _self.proficiency : proficiency // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [LanguageEntry].
extension LanguageEntryPatterns on LanguageEntry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LanguageEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LanguageEntry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LanguageEntry value)  $default,){
final _that = this;
switch (_that) {
case _LanguageEntry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LanguageEntry value)?  $default,){
final _that = this;
switch (_that) {
case _LanguageEntry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String proficiency)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LanguageEntry() when $default != null:
return $default(_that.id,_that.name,_that.proficiency);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String proficiency)  $default,) {final _that = this;
switch (_that) {
case _LanguageEntry():
return $default(_that.id,_that.name,_that.proficiency);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String proficiency)?  $default,) {final _that = this;
switch (_that) {
case _LanguageEntry() when $default != null:
return $default(_that.id,_that.name,_that.proficiency);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LanguageEntry implements LanguageEntry {
  const _LanguageEntry({required this.id, this.name = '', this.proficiency = 'Conversational'});
  factory _LanguageEntry.fromJson(Map<String, dynamic> json) => _$LanguageEntryFromJson(json);

@override final  String id;
@override@JsonKey() final  String name;
@override@JsonKey() final  String proficiency;

/// Create a copy of LanguageEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LanguageEntryCopyWith<_LanguageEntry> get copyWith => __$LanguageEntryCopyWithImpl<_LanguageEntry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LanguageEntryToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _LanguageEntry&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.proficiency, proficiency) || other.proficiency == proficiency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,proficiency);
}

@override
String toString() {
    return 'LanguageEntry(id: $id, name: $name, proficiency: $proficiency)';
}


}

/// @nodoc
abstract mixin class _$LanguageEntryCopyWith<$Res> implements $LanguageEntryCopyWith<$Res> {
  factory _$LanguageEntryCopyWith(_LanguageEntry value, $Res Function(_LanguageEntry) _then) = __$LanguageEntryCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String proficiency
});




}
/// @nodoc
class __$LanguageEntryCopyWithImpl<$Res>
    implements _$LanguageEntryCopyWith<$Res> {
  __$LanguageEntryCopyWithImpl(this._self, this._then);

  final _LanguageEntry _self;
  final $Res Function(_LanguageEntry) _then;

/// Create a copy of LanguageEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? proficiency = null,}) {
  return _then(_LanguageEntry(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,proficiency: null == proficiency ? _self.proficiency : proficiency // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
