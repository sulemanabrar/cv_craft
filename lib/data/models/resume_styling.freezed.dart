// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'resume_styling.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ResumeStyling {

 String get templateId; String get colorPresetId; String get fontFamily; double get fontSizeScale; double get headingSizeScale; double get lineSpacingScale;
/// Create a copy of ResumeStyling
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResumeStylingCopyWith<ResumeStyling> get copyWith => _$ResumeStylingCopyWithImpl<ResumeStyling>(this as ResumeStyling, _$identity);

  /// Serializes this ResumeStyling to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ResumeStyling;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResumeStyling&&(identical(other.templateId, _this.templateId) || other.templateId == _this.templateId)&&(identical(other.colorPresetId, _this.colorPresetId) || other.colorPresetId == _this.colorPresetId)&&(identical(other.fontFamily, _this.fontFamily) || other.fontFamily == _this.fontFamily)&&(identical(other.fontSizeScale, _this.fontSizeScale) || other.fontSizeScale == _this.fontSizeScale)&&(identical(other.headingSizeScale, _this.headingSizeScale) || other.headingSizeScale == _this.headingSizeScale)&&(identical(other.lineSpacingScale, _this.lineSpacingScale) || other.lineSpacingScale == _this.lineSpacingScale));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ResumeStyling;
  return Object.hash(runtimeType,_this.templateId,_this.colorPresetId,_this.fontFamily,_this.fontSizeScale,_this.headingSizeScale,_this.lineSpacingScale);
}

@override
String toString() {
  final _this = this as ResumeStyling;
  return 'ResumeStyling(templateId: ${_this.templateId}, colorPresetId: ${_this.colorPresetId}, fontFamily: ${_this.fontFamily}, fontSizeScale: ${_this.fontSizeScale}, headingSizeScale: ${_this.headingSizeScale}, lineSpacingScale: ${_this.lineSpacingScale})';
}


}

/// @nodoc
abstract mixin class $ResumeStylingCopyWith<$Res>  {
  factory $ResumeStylingCopyWith(ResumeStyling value, $Res Function(ResumeStyling) _then) = _$ResumeStylingCopyWithImpl;
@useResult
$Res call({
 String templateId, String colorPresetId, String fontFamily, double fontSizeScale, double headingSizeScale, double lineSpacingScale
});




}
/// @nodoc
class _$ResumeStylingCopyWithImpl<$Res>
    implements $ResumeStylingCopyWith<$Res> {
  _$ResumeStylingCopyWithImpl(this._self, this._then);

  final ResumeStyling _self;
  final $Res Function(ResumeStyling) _then;

/// Create a copy of ResumeStyling
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? templateId = null,Object? colorPresetId = null,Object? fontFamily = null,Object? fontSizeScale = null,Object? headingSizeScale = null,Object? lineSpacingScale = null,}) {
  return _then(ResumeStyling(
templateId: null == templateId ? _self.templateId : templateId // ignore: cast_nullable_to_non_nullable
as String,colorPresetId: null == colorPresetId ? _self.colorPresetId : colorPresetId // ignore: cast_nullable_to_non_nullable
as String,fontFamily: null == fontFamily ? _self.fontFamily : fontFamily // ignore: cast_nullable_to_non_nullable
as String,fontSizeScale: null == fontSizeScale ? _self.fontSizeScale : fontSizeScale // ignore: cast_nullable_to_non_nullable
as double,headingSizeScale: null == headingSizeScale ? _self.headingSizeScale : headingSizeScale // ignore: cast_nullable_to_non_nullable
as double,lineSpacingScale: null == lineSpacingScale ? _self.lineSpacingScale : lineSpacingScale // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [ResumeStyling].
extension ResumeStylingPatterns on ResumeStyling {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ResumeStyling value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ResumeStyling() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ResumeStyling value)  $default,){
final _that = this;
switch (_that) {
case _ResumeStyling():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ResumeStyling value)?  $default,){
final _that = this;
switch (_that) {
case _ResumeStyling() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String templateId,  String colorPresetId,  String fontFamily,  double fontSizeScale,  double headingSizeScale,  double lineSpacingScale)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResumeStyling() when $default != null:
return $default(_that.templateId,_that.colorPresetId,_that.fontFamily,_that.fontSizeScale,_that.headingSizeScale,_that.lineSpacingScale);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String templateId,  String colorPresetId,  String fontFamily,  double fontSizeScale,  double headingSizeScale,  double lineSpacingScale)  $default,) {final _that = this;
switch (_that) {
case _ResumeStyling():
return $default(_that.templateId,_that.colorPresetId,_that.fontFamily,_that.fontSizeScale,_that.headingSizeScale,_that.lineSpacingScale);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String templateId,  String colorPresetId,  String fontFamily,  double fontSizeScale,  double headingSizeScale,  double lineSpacingScale)?  $default,) {final _that = this;
switch (_that) {
case _ResumeStyling() when $default != null:
return $default(_that.templateId,_that.colorPresetId,_that.fontFamily,_that.fontSizeScale,_that.headingSizeScale,_that.lineSpacingScale);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ResumeStyling implements ResumeStyling {
  const _ResumeStyling({this.templateId = 'ats_classic', this.colorPresetId = 'navy', this.fontFamily = ResumeFontFamilyIds.firaSans, this.fontSizeScale = 1.0, this.headingSizeScale = 1.0, this.lineSpacingScale = 1.0});
  factory _ResumeStyling.fromJson(Map<String, dynamic> json) => _$ResumeStylingFromJson(json);

@override@JsonKey() final  String templateId;
@override@JsonKey() final  String colorPresetId;
@override@JsonKey() final  String fontFamily;
@override@JsonKey() final  double fontSizeScale;
@override@JsonKey() final  double headingSizeScale;
@override@JsonKey() final  double lineSpacingScale;

/// Create a copy of ResumeStyling
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResumeStylingCopyWith<_ResumeStyling> get copyWith => __$ResumeStylingCopyWithImpl<_ResumeStyling>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ResumeStylingToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResumeStyling&&(identical(other.templateId, templateId) || other.templateId == templateId)&&(identical(other.colorPresetId, colorPresetId) || other.colorPresetId == colorPresetId)&&(identical(other.fontFamily, fontFamily) || other.fontFamily == fontFamily)&&(identical(other.fontSizeScale, fontSizeScale) || other.fontSizeScale == fontSizeScale)&&(identical(other.headingSizeScale, headingSizeScale) || other.headingSizeScale == headingSizeScale)&&(identical(other.lineSpacingScale, lineSpacingScale) || other.lineSpacingScale == lineSpacingScale));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,templateId,colorPresetId,fontFamily,fontSizeScale,headingSizeScale,lineSpacingScale);
}

@override
String toString() {
    return 'ResumeStyling(templateId: $templateId, colorPresetId: $colorPresetId, fontFamily: $fontFamily, fontSizeScale: $fontSizeScale, headingSizeScale: $headingSizeScale, lineSpacingScale: $lineSpacingScale)';
}


}

/// @nodoc
abstract mixin class _$ResumeStylingCopyWith<$Res> implements $ResumeStylingCopyWith<$Res> {
  factory _$ResumeStylingCopyWith(_ResumeStyling value, $Res Function(_ResumeStyling) _then) = __$ResumeStylingCopyWithImpl;
@override @useResult
$Res call({
 String templateId, String colorPresetId, String fontFamily, double fontSizeScale, double headingSizeScale, double lineSpacingScale
});




}
/// @nodoc
class __$ResumeStylingCopyWithImpl<$Res>
    implements _$ResumeStylingCopyWith<$Res> {
  __$ResumeStylingCopyWithImpl(this._self, this._then);

  final _ResumeStyling _self;
  final $Res Function(_ResumeStyling) _then;

/// Create a copy of ResumeStyling
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? templateId = null,Object? colorPresetId = null,Object? fontFamily = null,Object? fontSizeScale = null,Object? headingSizeScale = null,Object? lineSpacingScale = null,}) {
  return _then(_ResumeStyling(
templateId: null == templateId ? _self.templateId : templateId // ignore: cast_nullable_to_non_nullable
as String,colorPresetId: null == colorPresetId ? _self.colorPresetId : colorPresetId // ignore: cast_nullable_to_non_nullable
as String,fontFamily: null == fontFamily ? _self.fontFamily : fontFamily // ignore: cast_nullable_to_non_nullable
as String,fontSizeScale: null == fontSizeScale ? _self.fontSizeScale : fontSizeScale // ignore: cast_nullable_to_non_nullable
as double,headingSizeScale: null == headingSizeScale ? _self.headingSizeScale : headingSizeScale // ignore: cast_nullable_to_non_nullable
as double,lineSpacingScale: null == lineSpacingScale ? _self.lineSpacingScale : lineSpacingScale // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
