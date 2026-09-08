// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'custom_section.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CustomSectionItem {

 String get id; String get title; String get description;
/// Create a copy of CustomSectionItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomSectionItemCopyWith<CustomSectionItem> get copyWith => _$CustomSectionItemCopyWithImpl<CustomSectionItem>(this as CustomSectionItem, _$identity);

  /// Serializes this CustomSectionItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CustomSectionItem;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomSectionItem&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.description, _this.description) || other.description == _this.description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CustomSectionItem;
  return Object.hash(runtimeType,_this.id,_this.title,_this.description);
}

@override
String toString() {
  final _this = this as CustomSectionItem;
  return 'CustomSectionItem(id: ${_this.id}, title: ${_this.title}, description: ${_this.description})';
}


}

/// @nodoc
abstract mixin class $CustomSectionItemCopyWith<$Res>  {
  factory $CustomSectionItemCopyWith(CustomSectionItem value, $Res Function(CustomSectionItem) _then) = _$CustomSectionItemCopyWithImpl;
@useResult
$Res call({
 String id, String title, String description
});




}
/// @nodoc
class _$CustomSectionItemCopyWithImpl<$Res>
    implements $CustomSectionItemCopyWith<$Res> {
  _$CustomSectionItemCopyWithImpl(this._self, this._then);

  final CustomSectionItem _self;
  final $Res Function(CustomSectionItem) _then;

/// Create a copy of CustomSectionItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = null,}) {
  return _then(CustomSectionItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CustomSectionItem].
extension CustomSectionItemPatterns on CustomSectionItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CustomSectionItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CustomSectionItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CustomSectionItem value)  $default,){
final _that = this;
switch (_that) {
case _CustomSectionItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CustomSectionItem value)?  $default,){
final _that = this;
switch (_that) {
case _CustomSectionItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CustomSectionItem() when $default != null:
return $default(_that.id,_that.title,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String description)  $default,) {final _that = this;
switch (_that) {
case _CustomSectionItem():
return $default(_that.id,_that.title,_that.description);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String description)?  $default,) {final _that = this;
switch (_that) {
case _CustomSectionItem() when $default != null:
return $default(_that.id,_that.title,_that.description);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CustomSectionItem implements CustomSectionItem {
  const _CustomSectionItem({required this.id, this.title = '', this.description = ''});
  factory _CustomSectionItem.fromJson(Map<String, dynamic> json) => _$CustomSectionItemFromJson(json);

@override final  String id;
@override@JsonKey() final  String title;
@override@JsonKey() final  String description;

/// Create a copy of CustomSectionItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CustomSectionItemCopyWith<_CustomSectionItem> get copyWith => __$CustomSectionItemCopyWithImpl<_CustomSectionItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomSectionItemToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CustomSectionItem&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,title,description);
}

@override
String toString() {
    return 'CustomSectionItem(id: $id, title: $title, description: $description)';
}


}

/// @nodoc
abstract mixin class _$CustomSectionItemCopyWith<$Res> implements $CustomSectionItemCopyWith<$Res> {
  factory _$CustomSectionItemCopyWith(_CustomSectionItem value, $Res Function(_CustomSectionItem) _then) = __$CustomSectionItemCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String description
});




}
/// @nodoc
class __$CustomSectionItemCopyWithImpl<$Res>
    implements _$CustomSectionItemCopyWith<$Res> {
  __$CustomSectionItemCopyWithImpl(this._self, this._then);

  final _CustomSectionItem _self;
  final $Res Function(_CustomSectionItem) _then;

/// Create a copy of CustomSectionItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = null,}) {
  return _then(_CustomSectionItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$CustomSection {

 String get id; String get title; List<CustomSectionItem> get items;
/// Create a copy of CustomSection
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomSectionCopyWith<CustomSection> get copyWith => _$CustomSectionCopyWithImpl<CustomSection>(this as CustomSection, _$identity);

  /// Serializes this CustomSection to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CustomSection;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomSection&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.title, _this.title) || other.title == _this.title)&&const DeepCollectionEquality().equals(other.items, _this.items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CustomSection;
  return Object.hash(runtimeType,_this.id,_this.title,const DeepCollectionEquality().hash(_this.items));
}

@override
String toString() {
  final _this = this as CustomSection;
  return 'CustomSection(id: ${_this.id}, title: ${_this.title}, items: ${_this.items})';
}


}

/// @nodoc
abstract mixin class $CustomSectionCopyWith<$Res>  {
  factory $CustomSectionCopyWith(CustomSection value, $Res Function(CustomSection) _then) = _$CustomSectionCopyWithImpl;
@useResult
$Res call({
 String id, String title, List<CustomSectionItem> items
});




}
/// @nodoc
class _$CustomSectionCopyWithImpl<$Res>
    implements $CustomSectionCopyWith<$Res> {
  _$CustomSectionCopyWithImpl(this._self, this._then);

  final CustomSection _self;
  final $Res Function(CustomSection) _then;

/// Create a copy of CustomSection
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? items = null,}) {
  return _then(CustomSection(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<CustomSectionItem>,
  ));
}

}


/// Adds pattern-matching-related methods to [CustomSection].
extension CustomSectionPatterns on CustomSection {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CustomSection value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CustomSection() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CustomSection value)  $default,){
final _that = this;
switch (_that) {
case _CustomSection():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CustomSection value)?  $default,){
final _that = this;
switch (_that) {
case _CustomSection() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  List<CustomSectionItem> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CustomSection() when $default != null:
return $default(_that.id,_that.title,_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  List<CustomSectionItem> items)  $default,) {final _that = this;
switch (_that) {
case _CustomSection():
return $default(_that.id,_that.title,_that.items);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  List<CustomSectionItem> items)?  $default,) {final _that = this;
switch (_that) {
case _CustomSection() when $default != null:
return $default(_that.id,_that.title,_that.items);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CustomSection implements CustomSection {
  const _CustomSection({required this.id, this.title = 'Custom Section',  List<CustomSectionItem> items = const <CustomSectionItem>[]}): _items = items;
  factory _CustomSection.fromJson(Map<String, dynamic> json) => _$CustomSectionFromJson(json);

@override final  String id;
@override@JsonKey() final  String title;
 final  List<CustomSectionItem> _items;
@override@JsonKey() List<CustomSectionItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of CustomSection
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CustomSectionCopyWith<_CustomSection> get copyWith => __$CustomSectionCopyWithImpl<_CustomSection>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomSectionToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CustomSection&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other.items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,title,const DeepCollectionEquality().hash(_items));
}

@override
String toString() {
    return 'CustomSection(id: $id, title: $title, items: $items)';
}


}

/// @nodoc
abstract mixin class _$CustomSectionCopyWith<$Res> implements $CustomSectionCopyWith<$Res> {
  factory _$CustomSectionCopyWith(_CustomSection value, $Res Function(_CustomSection) _then) = __$CustomSectionCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, List<CustomSectionItem> items
});




}
/// @nodoc
class __$CustomSectionCopyWithImpl<$Res>
    implements _$CustomSectionCopyWith<$Res> {
  __$CustomSectionCopyWithImpl(this._self, this._then);

  final _CustomSection _self;
  final $Res Function(_CustomSection) _then;

/// Create a copy of CustomSection
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? items = null,}) {
  return _then(_CustomSection(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<CustomSectionItem>,
  ));
}


}

// dart format on
