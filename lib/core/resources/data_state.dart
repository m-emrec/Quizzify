abstract class DataState<T> {
  final String? exception;
  final T? data;

  DataState({
    this.exception,
    this.data,
  });
}

class DataSuccess extends DataState {
  DataSuccess(data) : super(data: data);
}

class DataFailed extends DataState {
  DataFailed(exception) : super(exception: exception);
}
