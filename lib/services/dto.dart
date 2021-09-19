abstract class DTO {
  T toObject<T>(Object response) {
    throw UnimplementedError("toObject must me implemented");
  }

  Map<String, dynamic> toMap<T>(T t) {
    throw UnimplementedError("toObject must me implemented");
  }
}