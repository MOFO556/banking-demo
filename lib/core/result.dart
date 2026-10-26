sealed class Result<T> {
  const Result();

  R when<R>({
    required R Function(T data) ok,
    required R Function(String message) err,
  });
}

final class Ok<T> extends Result<T> {
  const Ok(this.data);
  final T data;

  @override
  R when<R>({
    required R Function(T data) ok,
    required R Function(String message) err,
  }) => ok(data);
}

final class Err<T> extends Result<T> {
  const Err(this.message);
  final String message;

  @override
  R when<R>({
    required R Function(T data) ok,
    required R Function(String message) err,
  }) => err(message);
}
