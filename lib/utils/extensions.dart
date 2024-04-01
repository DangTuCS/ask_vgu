extension MapExtension on Map<String,dynamic> {
  Map<String,dynamic> removeNull() {
    return Map.fromEntries(entries.where((e) => e.value != null));
  }
}