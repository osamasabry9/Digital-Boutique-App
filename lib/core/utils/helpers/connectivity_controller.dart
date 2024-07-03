import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class ConnectivityController{
ConnectivityController._();
  static final ConnectivityController instance = ConnectivityController._();

  ValueNotifier<bool> isConnected = ValueNotifier(true);

    /// Initializes the connectivity controller by checking the current connectivity status and listening for changes.
    ///
    /// This function does the following:
    /// 1. Calls `Connectivity().checkConnectivity()` to get the current connectivity status.
    /// 2. Calls `isInternetConnected(result)` to update the `isConnected` value based on the result.
    /// 3. Listens for changes in connectivity status using `Connectivity().onConnectivityChanged.listen(isInternetConnected)`.
    ///
    /// This function does not take any parameters and returns a `Future<void>`.
  Future<void> init() async {
    final result = await Connectivity().checkConnectivity();
    isInternetConnected(result);
    Connectivity().onConnectivityChanged.listen(isInternetConnected);
  }

    /// Checks if the internet connection is available based on the given [result].
    ///
    /// This function takes a list of [ConnectivityResult] as input and checks if the list is not empty and the first element is not equal to [ConnectivityResult.none]. If the condition is true, it sets the value of [isConnected] to true and returns the current value. Otherwise, it sets the value of [isConnected] to false and returns the current value.
    ///
    /// Parameters:
    /// - [result]: A list of [ConnectivityResult] representing the connectivity results.
    ///
    /// Returns:
    /// - A boolean value indicating whether the internet connection is available or not.
  bool isInternetConnected(List<ConnectivityResult> result) {
    isConnected.value = result.isNotEmpty && result.first != ConnectivityResult.none;
    return isConnected.value;
  }
}
