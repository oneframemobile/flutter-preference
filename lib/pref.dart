abstract class Pref<T> {
  String key();

  Map<String, dynamic> save();

  T read(Map<String, dynamic> map);
}
