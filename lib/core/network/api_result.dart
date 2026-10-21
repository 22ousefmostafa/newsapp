sealed class ApiResult<T> {}

class Success<T> extends ApiResult<T> {
  final T data;

  Success(this.data);
}

class Error<T> extends ApiResult<T> {
  String error;
  Error(this.error);
}
