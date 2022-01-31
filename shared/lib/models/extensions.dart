extension ListEx<T> on List<T> {
  List<T> addOrReplace(bool Function(T element) comparator, T newValue) {
    final index = indexWhere(comparator);
    if (index == -1) {
      add(newValue);
      return this;
    } else {
      return replace(comparator, newValue);
    }
  }

  // * Replace object in list with new value
  List<T> replace<T>(bool Function(T element) comparator, T newValue) {
    return map<T>((value) {
      if (comparator(value as T)) {
        return newValue;
      } else {
        return value;
      }
    }).toList();
  }
}
