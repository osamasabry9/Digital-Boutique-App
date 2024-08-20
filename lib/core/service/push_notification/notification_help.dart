import 'package:digital_boutique/app/env.variables.dart';
import 'package:flutter/material.dart';
import 'package:googleapis_auth/auth_io.dart' as auth;
import 'package:http/http.dart' as http;

class NotificationHelp {
  factory NotificationHelp() => _instance;

  NotificationHelp._();

  static final NotificationHelp _instance = NotificationHelp._();

  Future<String?> getAccessToken() async {
    final serviceAccountJson = {
      'type': 'service_account',
      'project_id':  EnvVariable.instance.googleCloudProjectId,
      'private_key_id': EnvVariable.instance.googleCloudPrivateKeyId,
      'private_key': EnvVariable.instance.googleCloudPrivateKey,
      'client_email': EnvVariable.instance.googleCloudClientEmail,
      'client_id': EnvVariable.instance.googleCloudClientId,
      'auth_uri': EnvVariable.instance.googleCloudAuthUri,
      'token_uri': EnvVariable.instance.googleCloudTokenUri,
      'auth_provider_x509_cert_url':
          EnvVariable.instance.googleCloudAuthProviderX509CertUrl,
      'client_x509_cert_url':EnvVariable.instance.googleCloudClientX509CertUrl,
      'universe_domain': 'googleapis.com',
    };

    final List<String> scopes = [
      'https://www.googleapis.com/auth/userinfo.email',
      'https://www.googleapis.com/auth/firebase.database',
      'https://www.googleapis.com/auth/firebase.messaging',
    ];

    try {
      final http.Client client = await auth.clientViaServiceAccount(
        auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
        scopes,
      );

      final credentials = await auth.obtainAccessCredentialsViaServiceAccount(
        auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
        scopes,
        client,
      );

      client.close();
      debugPrint(
        'Access Token: ${credentials.accessToken.data}',
      ); // Print Access Token
      return credentials.accessToken.data;
    } catch (e) {
      debugPrint('Error getting access token: $e');
      return null;
    }
  }
}
