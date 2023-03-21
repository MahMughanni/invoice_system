class EndPoints {
  static const String baseUrl =
      'https://talents-valley-backend.herokuapp.com/api';

  static const int receiveTimeout = 35000;
  static const int connectTimeout = 35000;

  static const String getInvoiceListing = '$baseUrl/invoice/listing';

  static const String getOfficeListRequest = '$baseUrl/withdraw/office-list';
  static const String getAllWithdrawList = '$baseUrl/withdraw/list';
  static const String addRecipient = '$baseUrl/recipient/create';

  static String getWithdrawDetails(String withdrawId) =>
      "$baseUrl/withdraw/details/$withdrawId";

  static const String token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7ImlkIjoiNjNlMTA0YWE4YmJhMmNiM2Y3NTRkN2RiIiwicm9sZSI6MH0sImV4cCI6MTY3OTQ5NDc3MiwiaWF0IjoxNjc5NDA4MzcyfQ.YAUHK4OrmIjEM4MEd04x7rOig-9kwbjQcbZAUCO1DKc';
}