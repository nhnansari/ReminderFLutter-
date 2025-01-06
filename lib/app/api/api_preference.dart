import 'package:get_storage/get_storage.dart';

const String _apiToken = "api_token";
const String userName = "userName";
const String _authenticationData = "authentication_data";
const String _userId = "user_id";
const String appAuthQrCode = "qrCode";
const String userEmail = "userEmail";
const String userLoginTokken = "userLoginTokken";
const String Otp = "Otp";
const String VarifySession = "VarifySession";
const String userCockies = "userCockies";
const String deviceToken = "deviceToken";

const String currentRoute = "currentRoute";

class AppPreferences {
  /// Set Api Token
  static setApiToken(String value) => GetStorage().write(_apiToken, value);

  /// Get Api Token
  static get getApiToken => GetStorage().read<String>(_apiToken);

  /// Remove Api Token
  static removeApiToken() => GetStorage().remove(_apiToken);

// set device token
 static setDeviceToken(String value) => GetStorage().write(deviceToken, value);

  /// Get Api Token
  static get getDeviceToken => GetStorage().read<String>(deviceToken);

  /// Remove Api Token
  static removeDeviceToken() => GetStorage().remove(deviceToken);
  /// Set userName
  static setUserName(String value) =>
      GetStorage().write(userName, value);

  /// Get userName
  static get getUserName => GetStorage().read<String>(userName);

  /// Remove userName
  static removeUserName() => GetStorage().remove(userName);

  /// Set Authentication Data
  static setAuthenticationData(String value) =>
      GetStorage().write(_authenticationData, value);

  /// Get Authentication Data
  static get getAuthenticationData =>
      GetStorage().read<String>(_authenticationData);

  /// Remove Authentication Data
  static removeAuthenticationData() => GetStorage().remove(_authenticationData);

  // Set User Id
  static setUserId(String value) => GetStorage().write(_userId, value);

  /// Get User Id
  static get getUserId => GetStorage().read<String>(_userId);

  /// Remove User Id
  static removeUserId() => GetStorage().remove(_userId);

  static setCookies(String value) => GetStorage().write(userCockies, value);

  /// Get Cookies

  static get getCookies => GetStorage().read<String>(userCockies);

  /// Remove Cookies



  // set app authentication qr code
  static setAppAuthQrCode(String value) =>
      GetStorage().write(appAuthQrCode, value);

  /// Get app authentication qr code
  static get getAppAuthQrCode => GetStorage().read<String>(appAuthQrCode);

  /// Remove app authentication qr code
  static removeAppAuthQrCode() => GetStorage().remove(appAuthQrCode);

  // set user email for signup otp varify

  static setUserEmail(String value) => GetStorage().write(userEmail, value);

  /// Get user email for signup otp varify
  static get getUserEmail => GetStorage().read<String>(userEmail);

  /// Remove user email for signup otp varify
  static removeUserEmail() => GetStorage().remove(userEmail);

  // set reset password secret for reset password otp varify and reset password
  static setOtp(String value) =>
      GetStorage().write(Otp, value);

  /// Get eset password secret for reset password otp varify and reset password
  static get getOtp => GetStorage().read<String>(Otp);

  /// Remove eset password secret for reset password otp varify and reset password
  static removeOtp() => GetStorage().remove(Otp);

  /// Set VarifySession for varify app Authentication mfa
  static setVarifySession(String value) =>
      GetStorage().write(VarifySession, value);

  /// Get VarifySession for varify app Authentication mfa
  static get getVarifySession => GetStorage().read<String>(VarifySession);

  /// Remove VarifySession for varify app Authentication mfa
  static removeVarifySession() => GetStorage().remove(VarifySession);

  /// Set currentRoute
  static setCurrentRoute(value) => GetStorage().write(currentRoute, value);

  /// Get currentRoute
  static get getCurrentRoute => GetStorage().read<int>(currentRoute);

  /// Remove currentRoute
  static removeCurrentRoute() => GetStorage().remove(currentRoute);
}
