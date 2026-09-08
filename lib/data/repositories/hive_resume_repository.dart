import 'package:hive/hive.dart';

import '../../core/utils/hive_json_cast.dart';
import '../models/resume.dart';
import 'resume_repository.dart';

/// Stores each resume as a plain JSON map (`resume.toJson()`) directly in a
/// Hive box — no type adapters needed. Hive returns `Map<dynamic, dynamic>`
/// on read, which is cast back via [deepCastToStringKeyedMap] before handing
/// it to `Resume.fromJson`.
class HiveResumeRepository implements ResumeRepository {
  HiveResumeRepository(this._box);

  static const String boxName = 'resumes';

  final Box<Map> _box;

  @override
  Future<List<Resume>> getAll() async {
    return _box.values
        .map((raw) => Resume.fromJson(deepCastToStringKeyedMap(raw)))
        .toList();
  }

  @override
  Future<Resume?> getById(String id) async {
    final raw = _box.get(id);
    if (raw == null) return null;
    return Resume.fromJson(deepCastToStringKeyedMap(raw));
  }

  @override
  Future<void> save(Resume resume) async {
    await _box.put(resume.id, resume.toJson());
  }

  @override
  Future<void> delete(String id) async {
    await _box.delete(id);
  }
}
