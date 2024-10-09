import 'package:flutter_dotenv/flutter_dotenv.dart';

enum EnvTypeEnum { dev, prod }

class EnvVariable {
  EnvVariable._();

  static final EnvVariable instance = EnvVariable._();

  String _envType = '';
  String _notificationBaseUrl= '';
  String _googleCloudProjectId = '';
  String _googleCloudPrivateKeyId = '';
  String _googleCloudPrivateKey = '';
  String _googleCloudClientEmail = '';
  String _googleCloudClientId = '';
  String _googleCloudAuthUri = '';
  String _googleCloudTokenUri = '';
  String _googleCloudAuthProviderX509CertUrl = '';
  String _googleCloudClientX509CertUrl = '';

  /// Initializes environment variables based on the provided environment type.
  Future<void> init({required EnvTypeEnum envType}) async {
    switch (envType) {
      case EnvTypeEnum.dev:
        await dotenv.load(fileName: '.env.dev');
      case EnvTypeEnum.prod:
        await dotenv.load(fileName: '.env.prod');
    }

    // Consider adding error handling if ENV_TYPE is not found
    _envType = dotenv.get('ENV_TYPE');
    _notificationBaseUrl = dotenv.get('NOTIFICATION_BASE_URL');
    _googleCloudProjectId = dotenv.get('GOOGLE_CLOUD_PROJECT_ID');
    _googleCloudPrivateKeyId = dotenv.get('GOOGLE_CLOUD_PRIVATE_KEY_ID');
    _googleCloudPrivateKey = dotenv.get('GOOGLE_CLOUD_PRIVATE_KEY');
    _googleCloudClientEmail = dotenv.get('GOOGLE_CLOUD_CLIENT_EMAIL');
    _googleCloudClientId = dotenv.get('GOOGLE_CLOUD_CLIENT_ID');
    _googleCloudAuthUri = dotenv.get('GOOGLE_CLOUD_AUTH_URI');
    _googleCloudTokenUri = dotenv.get('GOOGLE_CLOUD_TOKEN_URI');
    _googleCloudAuthProviderX509CertUrl = dotenv.get('GOOGLE_CLOUD_AUTH_PROVIDER_X509_CERT_URL');
    _googleCloudClientX509CertUrl = dotenv.get('GOOGLE_CLOUD_CLIENT_X509_CERT_URL');
  }

  /// Indicates if the current environment is for development.
  bool get debugMode => _envType == 'dev';

  String get notificationBaseUrl => _notificationBaseUrl;

  String get googleCloudProjectId => _googleCloudProjectId;
  String get googleCloudPrivateKeyId => _googleCloudPrivateKeyId;
  String get googleCloudPrivateKey => _googleCloudPrivateKey;
  String get googleCloudClientEmail => _googleCloudClientEmail;
  String get googleCloudClientId => _googleCloudClientId;
  String get googleCloudAuthUri => _googleCloudAuthUri;
  String get googleCloudTokenUri => _googleCloudTokenUri;
  String get googleCloudAuthProviderX509CertUrl => _googleCloudAuthProviderX509CertUrl;
  String get googleCloudClientX509CertUrl => _googleCloudClientX509CertUrl;

}
