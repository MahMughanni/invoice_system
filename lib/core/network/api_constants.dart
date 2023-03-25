class EndPoints {
  static const String baseUrl =
      'https://talents-valley-backend.herokuapp.com/api';

  static const int receiveTimeout = 35000;
  static const int connectTimeout = 35000;

  static const String login = '$baseUrl/user/login';
  static const String getInvoiceListing = '$baseUrl/invoice/listing';
  static const String getTransactions = '$baseUrl/transactions/list';
  static const String createInvoice = '$baseUrl/invoice/create';
  static const String invoiceDetails = '$baseUrl/invoice/';
  static const String getServiceListing = '$baseUrl/service/listing';
  static const String changeStatus = '$baseUrl/invoice/change-status/';

  static const String invoiceServiceListing =
      '$baseUrl/transactions/invoice-service-listing';

  static String getInvoiceById(String invoiceId) =>
      "$invoiceDetails/$invoiceId";

  static String changeStatusById(String invoiceId) =>
      "$changeStatus/$invoiceId";
}
