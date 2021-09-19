class Listfy {
  List<T> toList<T>(List l) {
    List<T> list = <T>[];
    l.forEach((e) => list.add(e));

    return list;
  }
}
