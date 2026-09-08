// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'publication.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Publication {

 String get id; String get title; String get publisher; DateTime? get date; String get url; String get description;
/// Create a copy of Publication
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PublicationCopyWith<Publication> get copyWith => _$PublicationCopyWithImpl<Publication>(this as Publication, _$identity);

  /// Serializes this Publication to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Publication;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Publication&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.publisher, _this.publisher) || other.publisher == _this.publisher)&&(identical(other.date, _this.date) || other.date == _this.date)&&(identical(other.url, _this.url) || other.url == _this.url)&&(identical(other.description, _this.description) || other.description == _this.description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Publication;
  return Object.hash(runtimeType,_this.id,_this.title,_this.publisher,_this.date,_this.url,_this.description);
}

@override
String toString() {
  final _this = this as Publication;
  return 'Publication(id: ${_this.id}, title: ${_this.title}, publisher: ${_this.publisher}, date: ${_this.date}, url: ${_this.url}, description: ${_this.description})';
}


}

/// @nodoc
abstract mixin class $PublicationCopyWith<$Res>  {
  factory $PublicationCopyWith(Publication value, $Res Function(Publication) _then) = _$PublicationCopyWithImpl;
@useResult
$Res call({
 String id, String title, String publisher, DateTime? date, String url, String description
});




}
/// @nodoc
class _$PublicationCopyWithImpl<$Res>
    implements $PublicationCopyWith<$Res> {
  _$PublicationCopyWithImpl(this._self, this._then);

  final Publication _self;
  final $Res Function(Publication) _then;

/// Create a copy of Publication
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? publisher = null,Object? date = freezed,Object? url = null,Object? description = null,}) {
  return _then(Publication(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,publisher: null == publisher ? _self.publisher : publisher // ignore: cast_nullable_to_non_nullable
as String,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime?,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Publication].
extension PublicationPatterns on Publication {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Publication value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Publication() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Publication value)  $default,){
final _that = this;
switch (_that) {
case _Publication():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Publication value)?  $default,){
final _that = this;
switch (_that) {
case _Publication() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String publisher,  DateTime? date,  String url,  String description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Publication() when $default != null:
return $default(_that.id,_that.title,_that.publisher,_that.date,_that.url,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String publisher,  DateTime? date,  String url,  String description)  $default,) {final _that = this;
switch (_that) {
case _Publication():
return $default(_that.id,_that.title,_that.publisher,_that.date,_that.url,_that.description);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String publisher,  DateTime? date,  String url,  String description)?  $default,) {final _that = this;
switch (_that) {
case _Publication() when $default != null:
return $default(_that.id,_that.title,_that.publisher,_that.date,_that.url,_that.description);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Publication implements Publication {
  const _Publication({required this.id, this.title = '', this.publisher = '', this.date, this.url = '', this.description = ''});
  factory _Publication.fromJson(Map<String, dynamic> json) => _$PublicationFromJson(json);

@override final  String id;
@override@JsonKey() final  String title;
@override@JsonKey() final  String publisher;
@override final  DateTime? date;
@override@JsonKey() final  String url;
@override@JsonKey() final  String description;

/// Create a copy of Publication
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PublicationCopyWith<_Publication> get copyWith => __$PublicationCopyWithImpl<_Publication>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PublicationToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Publication&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.publisher, publisher) || other.publisher == publisher)&&(identical(other.date, date) || other.date == date)&&(identical(other.url, url) || other.url == url)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,title,publisher,date,url,description);
}

@override
String toString() {
    return 'Publication(id: $id, title: $title, publisher: $publisher, date: $date, url: $url, description: $description)';
}


}

/// @nodoc
abstract mixin class _$PublicationCopyWith<$Res> implements $PublicationCopyWith<$Res> {
  factory _$PublicationCopyWith(_Publication value, $Res Function(_Publication) _then) = __$PublicationCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String publisher, DateTime? date, String url, String description
});




}
/// @nodoc
class __$PublicationCopyWithImpl<$Res>
    implements _$PublicationCopyWith<$Res> {
  __$PublicationCopyWithImpl(this._self, this._then);

  final _Publication _self;
  final $Res Function(_Publication) _then;

/// Create a copy of Publication
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? publisher = null,Object? date = freezed,Object? url = null,Object? description = null,}) {
  return _then(_Publication(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,publisher: null == publisher ? _self.publisher : publisher // ignore: cast_nullable_to_non_nullable
as String,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime?,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
