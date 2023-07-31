import 'package:dio/dio.dart';

abstract class DataState<DataType> {
  final DataType? data;
  final DioException? exception;

  const DataState({this.data, this.exception});
}

class DataSuccess<T> extends DataState {
  DataSuccess(T data) : super(data: data);
}

class DataFailure extends DataState {
  DataFailure(DioException? exception) : super(exception: exception);
}
