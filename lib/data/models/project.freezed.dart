// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Project {

 String get id; String get name; String get role; String get description; List<String> get technologies; String get url; String get githubUrl;
/// Create a copy of Project
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectCopyWith<Project> get copyWith => _$ProjectCopyWithImpl<Project>(this as Project, _$identity);

  /// Serializes this Project to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Project;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Project&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.role, _this.role) || other.role == _this.role)&&(identical(other.description, _this.description) || other.description == _this.description)&&const DeepCollectionEquality().equals(other.technologies, _this.technologies)&&(identical(other.url, _this.url) || other.url == _this.url)&&(identical(other.githubUrl, _this.githubUrl) || other.githubUrl == _this.githubUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Project;
  return Object.hash(runtimeType,_this.id,_this.name,_this.role,_this.description,const DeepCollectionEquality().hash(_this.technologies),_this.url,_this.githubUrl);
}

@override
String toString() {
  final _this = this as Project;
  return 'Project(id: ${_this.id}, name: ${_this.name}, role: ${_this.role}, description: ${_this.description}, technologies: ${_this.technologies}, url: ${_this.url}, githubUrl: ${_this.githubUrl})';
}


}

/// @nodoc
abstract mixin class $ProjectCopyWith<$Res>  {
  factory $ProjectCopyWith(Project value, $Res Function(Project) _then) = _$ProjectCopyWithImpl;
@useResult
$Res call({
 String id, String name, String role, String description, List<String> technologies, String url, String githubUrl
});




}
/// @nodoc
class _$ProjectCopyWithImpl<$Res>
    implements $ProjectCopyWith<$Res> {
  _$ProjectCopyWithImpl(this._self, this._then);

  final Project _self;
  final $Res Function(Project) _then;

/// Create a copy of Project
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? role = null,Object? description = null,Object? technologies = null,Object? url = null,Object? githubUrl = null,}) {
  return _then(Project(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,technologies: null == technologies ? _self.technologies : technologies // ignore: cast_nullable_to_non_nullable
as List<String>,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,githubUrl: null == githubUrl ? _self.githubUrl : githubUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Project].
extension ProjectPatterns on Project {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Project value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Project() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Project value)  $default,){
final _that = this;
switch (_that) {
case _Project():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Project value)?  $default,){
final _that = this;
switch (_that) {
case _Project() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String role,  String description,  List<String> technologies,  String url,  String githubUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Project() when $default != null:
return $default(_that.id,_that.name,_that.role,_that.description,_that.technologies,_that.url,_that.githubUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String role,  String description,  List<String> technologies,  String url,  String githubUrl)  $default,) {final _that = this;
switch (_that) {
case _Project():
return $default(_that.id,_that.name,_that.role,_that.description,_that.technologies,_that.url,_that.githubUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String role,  String description,  List<String> technologies,  String url,  String githubUrl)?  $default,) {final _that = this;
switch (_that) {
case _Project() when $default != null:
return $default(_that.id,_that.name,_that.role,_that.description,_that.technologies,_that.url,_that.githubUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Project implements Project {
  const _Project({required this.id, this.name = '', this.role = '', this.description = '',  List<String> technologies = const <String>[], this.url = '', this.githubUrl = ''}): _technologies = technologies;
  factory _Project.fromJson(Map<String, dynamic> json) => _$ProjectFromJson(json);

@override final  String id;
@override@JsonKey() final  String name;
@override@JsonKey() final  String role;
@override@JsonKey() final  String description;
 final  List<String> _technologies;
@override@JsonKey() List<String> get technologies {
  if (_technologies is EqualUnmodifiableListView) return _technologies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_technologies);
}

@override@JsonKey() final  String url;
@override@JsonKey() final  String githubUrl;

/// Create a copy of Project
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProjectCopyWith<_Project> get copyWith => __$ProjectCopyWithImpl<_Project>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProjectToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Project&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.role, role) || other.role == role)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.technologies, _technologies)&&(identical(other.url, url) || other.url == url)&&(identical(other.githubUrl, githubUrl) || other.githubUrl == githubUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,role,description,const DeepCollectionEquality().hash(_technologies),url,githubUrl);
}

@override
String toString() {
    return 'Project(id: $id, name: $name, role: $role, description: $description, technologies: $technologies, url: $url, githubUrl: $githubUrl)';
}


}

/// @nodoc
abstract mixin class _$ProjectCopyWith<$Res> implements $ProjectCopyWith<$Res> {
  factory _$ProjectCopyWith(_Project value, $Res Function(_Project) _then) = __$ProjectCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String role, String description, List<String> technologies, String url, String githubUrl
});




}
/// @nodoc
class __$ProjectCopyWithImpl<$Res>
    implements _$ProjectCopyWith<$Res> {
  __$ProjectCopyWithImpl(this._self, this._then);

  final _Project _self;
  final $Res Function(_Project) _then;

/// Create a copy of Project
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? role = null,Object? description = null,Object? technologies = null,Object? url = null,Object? githubUrl = null,}) {
  return _then(_Project(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,technologies: null == technologies ? _self._technologies : technologies // ignore: cast_nullable_to_non_nullable
as List<String>,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,githubUrl: null == githubUrl ? _self.githubUrl : githubUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
