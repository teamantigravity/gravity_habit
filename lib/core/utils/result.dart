import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

@freezed
sealed class Result<T> with _$Result<T> {
  const factory Result.success(T data) = Success<T>;
  const factory Result.failure(String message, [Object? error]) = Failure<T>;
}

extension ResultX<T> on Result<T> {
  T? get dataOrNull => switch (this) {
        Success(:final data) => data,
        Failure() => null,
      };

  bool get isSuccess => this is Success<T>;
  bool get isFailure => this is Failure<T>;
}
