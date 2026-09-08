import '../models/resume.dart';

abstract class ResumeRepository {
  Future<List<Resume>> getAll();
  Future<Resume?> getById(String id);
  Future<void> save(Resume resume);
  Future<void> delete(String id);
}
