part of 'model.dart';

class ApiReturnValue<T> {
  final T? value;
  final String? message;

  factory ApiReturnValue.getMessage(Map<String, dynamic> data) => ApiReturnValue(
    message: data['status_message'],
  );

  ApiReturnValue({
    this.value,
    this.message,
  });
}
