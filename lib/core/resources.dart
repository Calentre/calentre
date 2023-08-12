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
}

class DataFailure<T, E> extends DataState<T, E> {
  DataFailure(E? exception) : super(exception: exception);
}
