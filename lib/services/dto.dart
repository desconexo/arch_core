abstract class DTO<T> {
  T toObject(Map<String, dynamic> response) {
    throw UnimplementedError("toObject must me implemented");
  }

  Map<String, dynamic> toMap(T data) {
    throw UnimplementedError("toObject must me implemented");
  }
}