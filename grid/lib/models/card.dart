
class Card {
  final _value;

  const Card(this._value);

  get value => _value;

  String toString() {
    return '$_value';
  }
}
