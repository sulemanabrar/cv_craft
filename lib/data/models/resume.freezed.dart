// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'resume.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Resume {

 String get id; String get name; PersonalInfo get personalInfo; String get summary; List<Experience> get experiences; List<Education> get education; List<Skill> get skills; List<Project> get projects; List<Certification> get certifications; List<LanguageEntry> get languages; List<Award> get awards; List<Achievement> get achievements; List<Publication> get publications; List<VolunteerExperience> get volunteerExperience; List<ReferenceEntry> get references; List<Interest> get interests; List<CustomSection> get customSections; List<String> get sectionOrder; Set<String> get enabledOptionalSections; ResumeStyling get styling; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of Resume
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResumeCopyWith<Resume> get copyWith => _$ResumeCopyWithImpl<Resume>(this as Resume, _$identity);

  /// Serializes this Resume to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Resume;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Resume&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.personalInfo, _this.personalInfo) || other.personalInfo == _this.personalInfo)&&(identical(other.summary, _this.summary) || other.summary == _this.summary)&&const DeepCollectionEquality().equals(other.experiences, _this.experiences)&&const DeepCollectionEquality().equals(other.education, _this.education)&&const DeepCollectionEquality().equals(other.skills, _this.skills)&&const DeepCollectionEquality().equals(other.projects, _this.projects)&&const DeepCollectionEquality().equals(other.certifications, _this.certifications)&&const DeepCollectionEquality().equals(other.languages, _this.languages)&&const DeepCollectionEquality().equals(other.awards, _this.awards)&&const DeepCollectionEquality().equals(other.achievements, _this.achievements)&&const DeepCollectionEquality().equals(other.publications, _this.publications)&&const DeepCollectionEquality().equals(other.volunteerExperience, _this.volunteerExperience)&&const DeepCollectionEquality().equals(other.references, _this.references)&&const DeepCollectionEquality().equals(other.interests, _this.interests)&&const DeepCollectionEquality().equals(other.customSections, _this.customSections)&&const DeepCollectionEquality().equals(other.sectionOrder, _this.sectionOrder)&&const DeepCollectionEquality().equals(other.enabledOptionalSections, _this.enabledOptionalSections)&&(identical(other.styling, _this.styling) || other.styling == _this.styling)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Resume;
  return Object.hashAll([runtimeType,_this.id,_this.name,_this.personalInfo,_this.summary,const DeepCollectionEquality().hash(_this.experiences),const DeepCollectionEquality().hash(_this.education),const DeepCollectionEquality().hash(_this.skills),const DeepCollectionEquality().hash(_this.projects),const DeepCollectionEquality().hash(_this.certifications),const DeepCollectionEquality().hash(_this.languages),const DeepCollectionEquality().hash(_this.awards),const DeepCollectionEquality().hash(_this.achievements),const DeepCollectionEquality().hash(_this.publications),const DeepCollectionEquality().hash(_this.volunteerExperience),const DeepCollectionEquality().hash(_this.references),const DeepCollectionEquality().hash(_this.interests),const DeepCollectionEquality().hash(_this.customSections),const DeepCollectionEquality().hash(_this.sectionOrder),const DeepCollectionEquality().hash(_this.enabledOptionalSections),_this.styling,_this.createdAt,_this.updatedAt]);
}

@override
String toString() {
  final _this = this as Resume;
  return 'Resume(id: ${_this.id}, name: ${_this.name}, personalInfo: ${_this.personalInfo}, summary: ${_this.summary}, experiences: ${_this.experiences}, education: ${_this.education}, skills: ${_this.skills}, projects: ${_this.projects}, certifications: ${_this.certifications}, languages: ${_this.languages}, awards: ${_this.awards}, achievements: ${_this.achievements}, publications: ${_this.publications}, volunteerExperience: ${_this.volunteerExperience}, references: ${_this.references}, interests: ${_this.interests}, customSections: ${_this.customSections}, sectionOrder: ${_this.sectionOrder}, enabledOptionalSections: ${_this.enabledOptionalSections}, styling: ${_this.styling}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt})';
}


}

/// @nodoc
abstract mixin class $ResumeCopyWith<$Res>  {
  factory $ResumeCopyWith(Resume value, $Res Function(Resume) _then) = _$ResumeCopyWithImpl;
@useResult
$Res call({
 String id, String name, PersonalInfo personalInfo, String summary, List<Experience> experiences, List<Education> education, List<Skill> skills, List<Project> projects, List<Certification> certifications, List<LanguageEntry> languages, List<Award> awards, List<Achievement> achievements, List<Publication> publications, List<VolunteerExperience> volunteerExperience, List<ReferenceEntry> references, List<Interest> interests, List<CustomSection> customSections, List<String> sectionOrder, Set<String> enabledOptionalSections, ResumeStyling styling, DateTime createdAt, DateTime updatedAt
});


$PersonalInfoCopyWith<$Res> get personalInfo;$ResumeStylingCopyWith<$Res> get styling;

}
/// @nodoc
class _$ResumeCopyWithImpl<$Res>
    implements $ResumeCopyWith<$Res> {
  _$ResumeCopyWithImpl(this._self, this._then);

  final Resume _self;
  final $Res Function(Resume) _then;

/// Create a copy of Resume
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? personalInfo = null,Object? summary = null,Object? experiences = null,Object? education = null,Object? skills = null,Object? projects = null,Object? certifications = null,Object? languages = null,Object? awards = null,Object? achievements = null,Object? publications = null,Object? volunteerExperience = null,Object? references = null,Object? interests = null,Object? customSections = null,Object? sectionOrder = null,Object? enabledOptionalSections = null,Object? styling = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(Resume(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,personalInfo: null == personalInfo ? _self.personalInfo : personalInfo // ignore: cast_nullable_to_non_nullable
as PersonalInfo,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String,experiences: null == experiences ? _self.experiences : experiences // ignore: cast_nullable_to_non_nullable
as List<Experience>,education: null == education ? _self.education : education // ignore: cast_nullable_to_non_nullable
as List<Education>,skills: null == skills ? _self.skills : skills // ignore: cast_nullable_to_non_nullable
as List<Skill>,projects: null == projects ? _self.projects : projects // ignore: cast_nullable_to_non_nullable
as List<Project>,certifications: null == certifications ? _self.certifications : certifications // ignore: cast_nullable_to_non_nullable
as List<Certification>,languages: null == languages ? _self.languages : languages // ignore: cast_nullable_to_non_nullable
as List<LanguageEntry>,awards: null == awards ? _self.awards : awards // ignore: cast_nullable_to_non_nullable
as List<Award>,achievements: null == achievements ? _self.achievements : achievements // ignore: cast_nullable_to_non_nullable
as List<Achievement>,publications: null == publications ? _self.publications : publications // ignore: cast_nullable_to_non_nullable
as List<Publication>,volunteerExperience: null == volunteerExperience ? _self.volunteerExperience : volunteerExperience // ignore: cast_nullable_to_non_nullable
as List<VolunteerExperience>,references: null == references ? _self.references : references // ignore: cast_nullable_to_non_nullable
as List<ReferenceEntry>,interests: null == interests ? _self.interests : interests // ignore: cast_nullable_to_non_nullable
as List<Interest>,customSections: null == customSections ? _self.customSections : customSections // ignore: cast_nullable_to_non_nullable
as List<CustomSection>,sectionOrder: null == sectionOrder ? _self.sectionOrder : sectionOrder // ignore: cast_nullable_to_non_nullable
as List<String>,enabledOptionalSections: null == enabledOptionalSections ? _self.enabledOptionalSections : enabledOptionalSections // ignore: cast_nullable_to_non_nullable
as Set<String>,styling: null == styling ? _self.styling : styling // ignore: cast_nullable_to_non_nullable
as ResumeStyling,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}
/// Create a copy of Resume
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PersonalInfoCopyWith<$Res> get personalInfo {
  
  return $PersonalInfoCopyWith<$Res>(_self.personalInfo, (value) {
    return _then(_self.copyWith(personalInfo: value));
  });
}/// Create a copy of Resume
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResumeStylingCopyWith<$Res> get styling {
  
  return $ResumeStylingCopyWith<$Res>(_self.styling, (value) {
    return _then(_self.copyWith(styling: value));
  });
}
}


/// Adds pattern-matching-related methods to [Resume].
extension ResumePatterns on Resume {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Resume value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Resume() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Resume value)  $default,){
final _that = this;
switch (_that) {
case _Resume():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Resume value)?  $default,){
final _that = this;
switch (_that) {
case _Resume() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  PersonalInfo personalInfo,  String summary,  List<Experience> experiences,  List<Education> education,  List<Skill> skills,  List<Project> projects,  List<Certification> certifications,  List<LanguageEntry> languages,  List<Award> awards,  List<Achievement> achievements,  List<Publication> publications,  List<VolunteerExperience> volunteerExperience,  List<ReferenceEntry> references,  List<Interest> interests,  List<CustomSection> customSections,  List<String> sectionOrder,  Set<String> enabledOptionalSections,  ResumeStyling styling,  DateTime createdAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Resume() when $default != null:
return $default(_that.id,_that.name,_that.personalInfo,_that.summary,_that.experiences,_that.education,_that.skills,_that.projects,_that.certifications,_that.languages,_that.awards,_that.achievements,_that.publications,_that.volunteerExperience,_that.references,_that.interests,_that.customSections,_that.sectionOrder,_that.enabledOptionalSections,_that.styling,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  PersonalInfo personalInfo,  String summary,  List<Experience> experiences,  List<Education> education,  List<Skill> skills,  List<Project> projects,  List<Certification> certifications,  List<LanguageEntry> languages,  List<Award> awards,  List<Achievement> achievements,  List<Publication> publications,  List<VolunteerExperience> volunteerExperience,  List<ReferenceEntry> references,  List<Interest> interests,  List<CustomSection> customSections,  List<String> sectionOrder,  Set<String> enabledOptionalSections,  ResumeStyling styling,  DateTime createdAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _Resume():
return $default(_that.id,_that.name,_that.personalInfo,_that.summary,_that.experiences,_that.education,_that.skills,_that.projects,_that.certifications,_that.languages,_that.awards,_that.achievements,_that.publications,_that.volunteerExperience,_that.references,_that.interests,_that.customSections,_that.sectionOrder,_that.enabledOptionalSections,_that.styling,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  PersonalInfo personalInfo,  String summary,  List<Experience> experiences,  List<Education> education,  List<Skill> skills,  List<Project> projects,  List<Certification> certifications,  List<LanguageEntry> languages,  List<Award> awards,  List<Achievement> achievements,  List<Publication> publications,  List<VolunteerExperience> volunteerExperience,  List<ReferenceEntry> references,  List<Interest> interests,  List<CustomSection> customSections,  List<String> sectionOrder,  Set<String> enabledOptionalSections,  ResumeStyling styling,  DateTime createdAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _Resume() when $default != null:
return $default(_that.id,_that.name,_that.personalInfo,_that.summary,_that.experiences,_that.education,_that.skills,_that.projects,_that.certifications,_that.languages,_that.awards,_that.achievements,_that.publications,_that.volunteerExperience,_that.references,_that.interests,_that.customSections,_that.sectionOrder,_that.enabledOptionalSections,_that.styling,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Resume implements Resume {
  const _Resume({required this.id, required this.name, this.personalInfo = const PersonalInfo(), this.summary = '',  List<Experience> experiences = const <Experience>[],  List<Education> education = const <Education>[],  List<Skill> skills = const <Skill>[],  List<Project> projects = const <Project>[],  List<Certification> certifications = const <Certification>[],  List<LanguageEntry> languages = const <LanguageEntry>[],  List<Award> awards = const <Award>[],  List<Achievement> achievements = const <Achievement>[],  List<Publication> publications = const <Publication>[],  List<VolunteerExperience> volunteerExperience = const <VolunteerExperience>[],  List<ReferenceEntry> references = const <ReferenceEntry>[],  List<Interest> interests = const <Interest>[],  List<CustomSection> customSections = const <CustomSection>[],  List<String> sectionOrder = const <String>[],  Set<String> enabledOptionalSections = const <String>{}, this.styling = const ResumeStyling(), required this.createdAt, required this.updatedAt}): _experiences = experiences,_education = education,_skills = skills,_projects = projects,_certifications = certifications,_languages = languages,_awards = awards,_achievements = achievements,_publications = publications,_volunteerExperience = volunteerExperience,_references = references,_interests = interests,_customSections = customSections,_sectionOrder = sectionOrder,_enabledOptionalSections = enabledOptionalSections;
  factory _Resume.fromJson(Map<String, dynamic> json) => _$ResumeFromJson(json);

@override final  String id;
@override final  String name;
@override@JsonKey() final  PersonalInfo personalInfo;
@override@JsonKey() final  String summary;
 final  List<Experience> _experiences;
@override@JsonKey() List<Experience> get experiences {
  if (_experiences is EqualUnmodifiableListView) return _experiences;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_experiences);
}

 final  List<Education> _education;
@override@JsonKey() List<Education> get education {
  if (_education is EqualUnmodifiableListView) return _education;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_education);
}

 final  List<Skill> _skills;
@override@JsonKey() List<Skill> get skills {
  if (_skills is EqualUnmodifiableListView) return _skills;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_skills);
}

 final  List<Project> _projects;
@override@JsonKey() List<Project> get projects {
  if (_projects is EqualUnmodifiableListView) return _projects;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_projects);
}

 final  List<Certification> _certifications;
@override@JsonKey() List<Certification> get certifications {
  if (_certifications is EqualUnmodifiableListView) return _certifications;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_certifications);
}

 final  List<LanguageEntry> _languages;
@override@JsonKey() List<LanguageEntry> get languages {
  if (_languages is EqualUnmodifiableListView) return _languages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_languages);
}

 final  List<Award> _awards;
@override@JsonKey() List<Award> get awards {
  if (_awards is EqualUnmodifiableListView) return _awards;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_awards);
}

 final  List<Achievement> _achievements;
@override@JsonKey() List<Achievement> get achievements {
  if (_achievements is EqualUnmodifiableListView) return _achievements;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_achievements);
}

 final  List<Publication> _publications;
@override@JsonKey() List<Publication> get publications {
  if (_publications is EqualUnmodifiableListView) return _publications;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_publications);
}

 final  List<VolunteerExperience> _volunteerExperience;
@override@JsonKey() List<VolunteerExperience> get volunteerExperience {
  if (_volunteerExperience is EqualUnmodifiableListView) return _volunteerExperience;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_volunteerExperience);
}

 final  List<ReferenceEntry> _references;
@override@JsonKey() List<ReferenceEntry> get references {
  if (_references is EqualUnmodifiableListView) return _references;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_references);
}

 final  List<Interest> _interests;
@override@JsonKey() List<Interest> get interests {
  if (_interests is EqualUnmodifiableListView) return _interests;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_interests);
}

 final  List<CustomSection> _customSections;
@override@JsonKey() List<CustomSection> get customSections {
  if (_customSections is EqualUnmodifiableListView) return _customSections;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_customSections);
}

 final  List<String> _sectionOrder;
@override@JsonKey() List<String> get sectionOrder {
  if (_sectionOrder is EqualUnmodifiableListView) return _sectionOrder;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sectionOrder);
}

 final  Set<String> _enabledOptionalSections;
@override@JsonKey() Set<String> get enabledOptionalSections {
  if (_enabledOptionalSections is EqualUnmodifiableSetView) return _enabledOptionalSections;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_enabledOptionalSections);
}

@override@JsonKey() final  ResumeStyling styling;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of Resume
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResumeCopyWith<_Resume> get copyWith => __$ResumeCopyWithImpl<_Resume>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ResumeToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Resume&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.personalInfo, personalInfo) || other.personalInfo == personalInfo)&&(identical(other.summary, summary) || other.summary == summary)&&const DeepCollectionEquality().equals(other.experiences, _experiences)&&const DeepCollectionEquality().equals(other.education, _education)&&const DeepCollectionEquality().equals(other.skills, _skills)&&const DeepCollectionEquality().equals(other.projects, _projects)&&const DeepCollectionEquality().equals(other.certifications, _certifications)&&const DeepCollectionEquality().equals(other.languages, _languages)&&const DeepCollectionEquality().equals(other.awards, _awards)&&const DeepCollectionEquality().equals(other.achievements, _achievements)&&const DeepCollectionEquality().equals(other.publications, _publications)&&const DeepCollectionEquality().equals(other.volunteerExperience, _volunteerExperience)&&const DeepCollectionEquality().equals(other.references, _references)&&const DeepCollectionEquality().equals(other.interests, _interests)&&const DeepCollectionEquality().equals(other.customSections, _customSections)&&const DeepCollectionEquality().equals(other.sectionOrder, _sectionOrder)&&const DeepCollectionEquality().equals(other.enabledOptionalSections, _enabledOptionalSections)&&(identical(other.styling, styling) || other.styling == styling)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hashAll([runtimeType,id,name,personalInfo,summary,const DeepCollectionEquality().hash(_experiences),const DeepCollectionEquality().hash(_education),const DeepCollectionEquality().hash(_skills),const DeepCollectionEquality().hash(_projects),const DeepCollectionEquality().hash(_certifications),const DeepCollectionEquality().hash(_languages),const DeepCollectionEquality().hash(_awards),const DeepCollectionEquality().hash(_achievements),const DeepCollectionEquality().hash(_publications),const DeepCollectionEquality().hash(_volunteerExperience),const DeepCollectionEquality().hash(_references),const DeepCollectionEquality().hash(_interests),const DeepCollectionEquality().hash(_customSections),const DeepCollectionEquality().hash(_sectionOrder),const DeepCollectionEquality().hash(_enabledOptionalSections),styling,createdAt,updatedAt]);
}

@override
String toString() {
    return 'Resume(id: $id, name: $name, personalInfo: $personalInfo, summary: $summary, experiences: $experiences, education: $education, skills: $skills, projects: $projects, certifications: $certifications, languages: $languages, awards: $awards, achievements: $achievements, publications: $publications, volunteerExperience: $volunteerExperience, references: $references, interests: $interests, customSections: $customSections, sectionOrder: $sectionOrder, enabledOptionalSections: $enabledOptionalSections, styling: $styling, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ResumeCopyWith<$Res> implements $ResumeCopyWith<$Res> {
  factory _$ResumeCopyWith(_Resume value, $Res Function(_Resume) _then) = __$ResumeCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, PersonalInfo personalInfo, String summary, List<Experience> experiences, List<Education> education, List<Skill> skills, List<Project> projects, List<Certification> certifications, List<LanguageEntry> languages, List<Award> awards, List<Achievement> achievements, List<Publication> publications, List<VolunteerExperience> volunteerExperience, List<ReferenceEntry> references, List<Interest> interests, List<CustomSection> customSections, List<String> sectionOrder, Set<String> enabledOptionalSections, ResumeStyling styling, DateTime createdAt, DateTime updatedAt
});


@override $PersonalInfoCopyWith<$Res> get personalInfo;@override $ResumeStylingCopyWith<$Res> get styling;

}
/// @nodoc
class __$ResumeCopyWithImpl<$Res>
    implements _$ResumeCopyWith<$Res> {
  __$ResumeCopyWithImpl(this._self, this._then);

  final _Resume _self;
  final $Res Function(_Resume) _then;

/// Create a copy of Resume
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? personalInfo = null,Object? summary = null,Object? experiences = null,Object? education = null,Object? skills = null,Object? projects = null,Object? certifications = null,Object? languages = null,Object? awards = null,Object? achievements = null,Object? publications = null,Object? volunteerExperience = null,Object? references = null,Object? interests = null,Object? customSections = null,Object? sectionOrder = null,Object? enabledOptionalSections = null,Object? styling = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_Resume(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,personalInfo: null == personalInfo ? _self.personalInfo : personalInfo // ignore: cast_nullable_to_non_nullable
as PersonalInfo,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String,experiences: null == experiences ? _self._experiences : experiences // ignore: cast_nullable_to_non_nullable
as List<Experience>,education: null == education ? _self._education : education // ignore: cast_nullable_to_non_nullable
as List<Education>,skills: null == skills ? _self._skills : skills // ignore: cast_nullable_to_non_nullable
as List<Skill>,projects: null == projects ? _self._projects : projects // ignore: cast_nullable_to_non_nullable
as List<Project>,certifications: null == certifications ? _self._certifications : certifications // ignore: cast_nullable_to_non_nullable
as List<Certification>,languages: null == languages ? _self._languages : languages // ignore: cast_nullable_to_non_nullable
as List<LanguageEntry>,awards: null == awards ? _self._awards : awards // ignore: cast_nullable_to_non_nullable
as List<Award>,achievements: null == achievements ? _self._achievements : achievements // ignore: cast_nullable_to_non_nullable
as List<Achievement>,publications: null == publications ? _self._publications : publications // ignore: cast_nullable_to_non_nullable
as List<Publication>,volunteerExperience: null == volunteerExperience ? _self._volunteerExperience : volunteerExperience // ignore: cast_nullable_to_non_nullable
as List<VolunteerExperience>,references: null == references ? _self._references : references // ignore: cast_nullable_to_non_nullable
as List<ReferenceEntry>,interests: null == interests ? _self._interests : interests // ignore: cast_nullable_to_non_nullable
as List<Interest>,customSections: null == customSections ? _self._customSections : customSections // ignore: cast_nullable_to_non_nullable
as List<CustomSection>,sectionOrder: null == sectionOrder ? _self._sectionOrder : sectionOrder // ignore: cast_nullable_to_non_nullable
as List<String>,enabledOptionalSections: null == enabledOptionalSections ? _self._enabledOptionalSections : enabledOptionalSections // ignore: cast_nullable_to_non_nullable
as Set<String>,styling: null == styling ? _self.styling : styling // ignore: cast_nullable_to_non_nullable
as ResumeStyling,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

/// Create a copy of Resume
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PersonalInfoCopyWith<$Res> get personalInfo {
  
  return $PersonalInfoCopyWith<$Res>(_self.personalInfo, (value) {
    return _then(_self.copyWith(personalInfo: value));
  });
}/// Create a copy of Resume
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResumeStylingCopyWith<$Res> get styling {
  
  return $ResumeStylingCopyWith<$Res>(_self.styling, (value) {
    return _then(_self.copyWith(styling: value));
  });
}
}

// dart format on
