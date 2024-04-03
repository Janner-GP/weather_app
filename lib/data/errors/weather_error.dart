class CustomError extends Error {
  final String message;
  final int? errorCode;

  CustomError({required this.message, this.errorCode});
}