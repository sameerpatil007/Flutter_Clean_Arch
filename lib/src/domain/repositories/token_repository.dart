import '../../core/resources/data_state.dart';
import '../entities/token_response.dart';

abstract class TokenRepository {
  Future<DataState<TokenResponse>> getAuthToken();
  String? get token;
}
