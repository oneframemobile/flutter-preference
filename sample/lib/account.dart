import 'package:preference/pref.dart';

class Account implements Pref<Account> {
  String name;
  int age;

  Account({this.name, this.age});

  Account.fromJson(Map<String, dynamic> json) {
    this.name = json['name'];
    this.age = json['age'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['age'] = this.age;
    return data;
  }

  @override
  Account read(Map<String, dynamic> map) {
    return Account.fromJson(map);
  }

  @override
  Map<String, dynamic> save() {
    return toJson();
  }

  @override
  String key() {
    return "account";
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Account &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          age == other.age;

  @override
  int get hashCode => name.hashCode ^ age.hashCode;

  @override
  String toString() {
    return '{"name" : "$name", "age" : $age}';
  }
}
