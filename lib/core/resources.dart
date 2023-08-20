//Data states for remote data
abstract class DataState<T, E> {
  final T? data;
  final E? exception;

  const DataState({
    this.data,
    this.exception,
  });
}

class DataSuccess<T, E> extends DataState<T, E> {
  DataSuccess(T data) : super(data: data);

//These overides are for testing purposes, and allow us compare the same instance of
//this class when testing.
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataSuccess &&
          runtimeType == other.runtimeType &&
          data == other.data;

  @override
  int get hashCode => data.hashCode;
}

class DataFailure<T, E> extends DataState<T, E> {
  DataFailure(E exception) : super(exception: exception);

//These overides are for testing purposes, and allow us compare the same instance of
//this class when testing.

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataFailure &&
          runtimeType == other.runtimeType &&
          exception == other.exception;

  @override
  int get hashCode => exception.hashCode;
}
