import 'package:khelwa/screens/splash/data/onboarding_model.dart';

enum ApiServiceException {
  unknownError,
  connectionError,
  failedToLoadMainData,
  failedToLoadPosts,
  failedToLoadNotifications,
  failedToLoadCases,
  failedToLoadPayments,
  failedToLoadCurrentUserData,
  failedToSaveUserData,
  failedToLoadPaymentMethods,
  failedToDeletePaymentMethod,
  failedToAddPaymentMethod,
  invalidBankCard,
  failedToLoadWorkSchedule,
  failedToLoadCaseTypes,
  invalidCredentials,
  weakPassword,
  invalidPassword,
  emailAlreadyInUse,
  invalidForgotPasswordConfirmationCode,
  failedToRegisterWithEmailAndPassword,
  failedToLogout,
  failedToLoginWithGoogle,
  failedToSendForgotPasswordCode,
  failedToSendEmailVerificationMessage,
  emailNotFound,
}

abstract interface class BaseApiService {
  Future<void> initBaseApiService();


  Future<List<OnBoardingModel>> getOnBoarding();



  // Future<MessageModel> logout();



  // Future<String> getAboutUs();

  // Future<List<NotificationsModel>> getNotifications(int page);



  // Future<SupportTeamModel> getSupportTeamInfo();

  // Future<String> getTermsAndConditions();

  // Future<String> getPolicyAndPrivacy();


  // Future<List<HelpCenterModel>> searchHelpCenter(String search);

  // Future<List<HelpCenterModel>> getHelpCenter();

}
