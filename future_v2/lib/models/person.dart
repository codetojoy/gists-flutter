class Person {
  final String name;

  const Person(this.name);

  String toString() {
    return '$name';
  }
}

class Result {
  List<Person> people = [];

  Result(this.people);

  factory Result.fromJson(Map<String, dynamic> json) {
    var msg = json['message'];
    print('REST message: $msg');
    var peopleJson = json['people'] as List<dynamic>;
    var peopleList = peopleJson.map<Person>((personJson) {
      var name = personJson['name'];
      return Person(name);
    }).toList();
    /*
    var peopleJson = json['people'];
    peopleJson.forEach((person) {
      final name = person['name'];
      final person = new Person(name);
      peopleList.add(person);
    });
    */
    return Result(peopleList); // [Person('test')]); // json['players']);
  }
}
