class RequestResult<T> {
  RequestResult._();

  bool isSuccess() => this is Success;

  bool isFailure() => this is Failure;

  Future<void> onAction({
    Function(T value)? onSuccess,
    Function(Exception e)? onError,
  }) async {
    if (isSuccess()) {
      await onSuccess?.call((this as Success).value);
    } else {
      await onError?.call((this as Failure).error);
    }
  }

  RequestResult<T> onSuccess(Function(T value) action) {
    if (isSuccess()) action((this as Success).value);
    return this;
  }

  RequestResult<T> onFailure(Function(Exception e) action) {
    if (isFailure()) action((this as Failure).error);
    return this;
  }

  T? getOrNull() {
    if (isSuccess()) return (this as Success).value;
    return null;
  }

  T getOrThrow() {
    if (isSuccess()) {
      return (this as Success).value;
    } else {
      throw (this as Failure).error;
    }
  }

  T getOrElse(T Function(Object e) onFailure) {
    if (isSuccess()) {
      return (this as Success).value;
    } else {
      return onFailure((this as Failure).error);
    }
  }

  factory RequestResult.success(T value) = Success;

  factory RequestResult.failure(Exception e) = Failure;
}

class Success<T> extends RequestResult<T> {
  final T value;

  Success(this.value) : super._();
}

class Failure<T> extends RequestResult<T> {
  final Exception error;

  Failure(this.error) : super._();
}

Future<RequestResult<T>> handleRequest<T>(
    Future<T> Function() requestFunc) async {
  try {
    return RequestResult.success(await requestFunc());
  } catch (e) {
    if (e is Exception) {
      return RequestResult.failure(e);
    } else {
      return RequestResult.failure(
        Exception(
          'Unknown Exception...',
        ),
      );
    }
  }
}
