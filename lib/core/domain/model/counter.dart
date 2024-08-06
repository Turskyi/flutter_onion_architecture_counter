// Domain Model Layer
class Counter {
  const Counter(this.value);

  final int value;

  Counter copyWith({int? value}) {
    return Counter(value ?? this.value);
  }
}
