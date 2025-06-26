import 'network_error_handler.dart';
import 'rest_client.dart';

class UnAuthRestClient extends RestClient {
  UnAuthRestClient(super.client)
    : super(errorHandler: NetworkErrorHandlerImpl());
}
