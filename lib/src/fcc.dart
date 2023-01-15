abstract class FCC<E> extends Iterable<E> {
  List<E> get values;

  @override
  Iterator<E> get iterator => values.iterator;

  @override
  String toString() => 'list is $values';

  int count() {
    return values.length;
  }

  @override
  bool get isEmpty => values.isEmpty;
}
