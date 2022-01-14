extension MapX on Map<String, dynamic> {
  Map<String, dynamic> withoutKeys(List<String> keys) {
    for (var key in keys) {
      remove(key);
    }
    return this;
  }
}
