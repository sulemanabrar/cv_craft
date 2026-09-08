import 'package:uuid/uuid.dart';

const _uuid = Uuid();

/// Generates a new unique id for resumes, sections, and list entries.
String generateId() => _uuid.v4();
