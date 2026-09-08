/// Hive deserializes stored maps as `Map<dynamic, dynamic>` (and nested lists
/// as `List<dynamic>`), but `json_serializable`'s generated `fromJson`
/// factories expect `Map<String, dynamic>`. This recursively walks a value
/// read back from Hive and casts every map to `Map<String, dynamic>` so it
/// can be safely handed to a freezed model's `fromJson`.
dynamic deepCastJson(dynamic value) {
  if (value is Map) {
    return value.map(
      (key, val) => MapEntry(key.toString(), deepCastJson(val)),
    );
  }
  if (value is List) {
    return value.map(deepCastJson).toList();
  }
  return value;
}

/// Convenience wrapper that also asserts the top-level result is a proper
/// `Map<String, dynamic>`, as expected by `Resume.fromJson`.
Map<String, dynamic> deepCastToStringKeyedMap(dynamic value) {
  return deepCastJson(value) as Map<String, dynamic>;
}
