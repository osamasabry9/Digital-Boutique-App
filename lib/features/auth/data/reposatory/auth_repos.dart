import 'package:digital_boutique/core/networking/api_result.dart';
import 'package:digital_boutique/core/utils/error/error_helper.dart';
import 'package:digital_boutique/features/auth/data/data_source/auth_data_source.dart';
import 'package:digital_boutique/features/auth/data/models/login_request_body.dart';
import 'package:digital_boutique/features/auth/data/models/login_response.dart';
import 'package:digital_boutique/features/auth/data/models/user_role_response.dart';

class AuthRepos {
  AuthRepos(this._authDataSource);
  final AuthDataSource _authDataSource;

  /// Asynchronous function to login with the provided login request body.
  /// Takes a required LoginRequestBody parameter 'body'.
  /// Returns a Future of ApiResult containing LoginResponse.
  Future<ApiResult<LoginResponse>> login({
    required LoginRequestBody body,
  }) async {
    try {
      final response = await _authDataSource.login(body: body);

      return ApiResult.success(response);
    } catch (error) {
      return const ApiResult.failure(ErrorHelper.errorMessage);
    }
  }


/// Retrieves the user role based on the provided token.
///
/// @param {String} token - The authentication token.
/// @return {Future<UserRoleResponse>} - A future that resolves to the user role.
  Future<UserRoleResponse> userRole(String token) async {
    final response = await _authDataSource.userRole(token);
    return response;
  }
}
