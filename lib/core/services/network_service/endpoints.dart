class EndPoints {
  static const String baseUrl = 'https://transportation.cowdly.sa/api';
  static const String login = '$baseUrl/login';
  static const String logout = '$baseUrl/logout';
  static const String updateDriverLocation = '$baseUrl/change-location';
  static const String getOperations = '$baseUrl/operations?page=';
  static const String getCompletedOperations =
      '$baseUrl/operations/completed?page=';
  static const String updateOperationStatus =
      '$baseUrl/operations/update-driver-status';
}
