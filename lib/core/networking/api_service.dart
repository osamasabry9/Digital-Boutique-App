import 'package:digital_boutique/core/constants/app_constants.dart';
import 'package:digital_boutique/features/auth/data/models/login_response.dart';
import 'package:digital_boutique/features/auth/data/models/user_role_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

const String baseUrl = AppConstants.baseUrl;
const String graphql = AppConstants.graphql;

@RestApi(baseUrl: baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(graphql)
  Future<LoginResponse> login(
    @Body() Map<String, dynamic> mutation,
  );

  @GET(AppConstants.userRoleUrl)
  Future<UserRoleResponse> userRole();
}
