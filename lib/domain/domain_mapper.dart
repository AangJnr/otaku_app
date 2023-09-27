abstract class DomainMapper<S> {
  S mapToDomain();
}

abstract class DataMapper<T> {
  T mapToApi();
}

abstract class Mapper<S, T> extends DomainMapper<T> {
  S fromMap(Map<String, dynamic> data);
  Map<String, dynamic> toMap();
  @override
  T mapToDomain();
}
