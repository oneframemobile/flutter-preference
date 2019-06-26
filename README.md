# preference

Preference package written in flutter and supports complex objects in sync or async ways.
## Getting Started
Add these lines to *pubspec.yaml*.
~~~~
dependencies:
   preference:
     url: <url_comes_here>
~~~~



#### Custom models
Custom models should implement *Preference*. *save() and read(Map<String, dynamic>)* methods must be implemented. 
~~~~
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
~~~~

~~~~
Account tus = Account(
      name: "Emre",
      age: 29,
    );

// sync
PrefManager prefs = PrefManager();
bool saved = await prefs.save(account);
Account account = await prefs.read<Account>(account);

// async
PrefManager prefs = PrefManager();
prefs.save(tus).then((saved) {});
prefs.read<Account>(Account()).then((account) {});
~~~~

#### Primitive types
~~~~
PrefManager prefs = PrefManager();

// Save
prefs.saveInt("key", 0);
prefs.saveInt("key", 0).then((saved) {});;

await prefs.saveBool("key", true);
prefs.saveBool("key", true).then((saved) {});;

await prefs.saveDouble("key", 0d);
prefs.saveDouble("key", 0d).then((saved) {});

await prefs.saveString("key", "name");
prefs.saveString("key", "name").then((saved) {});

await prefs.saveStringList("key", 0);
prefs.saveStringList("key", 0).then((saved) {});


// Read
await prefs.readInt("key");
prefs.readInt("key").then((value) {});

await prefs.readBool("key");
prefs.readBool("key").then((bool) {});

await prefs.readDouble("key");
prefs.readDouble("key").then((double) {});

await prefs.readString("key");
prefs.readString("key").then((string) {});

await prefs.readStringList("key");
prefs.readStringList("key").then((list) {});
~~~~