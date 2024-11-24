import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';

import '/auth/base_auth_user_provider.dart';

import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? const NavBarPage() : const SplashWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? const NavBarPage() : const SplashWidget(),
        ),
        FFRoute(
          name: 'onboarding',
          path: '/onboarding',
          builder: (context, params) => const OnboardingWidget(),
        ),
        FFRoute(
          name: 'BuyerRegister',
          path: '/buyerRegister',
          builder: (context, params) => const BuyerRegisterWidget(),
        ),
        FFRoute(
          name: 'BuyerVerifyEmail',
          path: '/buyerverifyemail',
          builder: (context, params) => const BuyerVerifyEmailWidget(),
        ),
        FFRoute(
          name: 'BuyerVerificationsuccessful',
          path: '/buyerVerificationsuccessful',
          builder: (context, params) => const BuyerVerificationsuccessfulWidget(),
        ),
        FFRoute(
          name: 'BuyerInterest',
          path: '/buyerInterest',
          builder: (context, params) => const BuyerInterestWidget(),
        ),
        FFRoute(
          name: 'BuyerLogin',
          path: '/buyer_login',
          builder: (context, params) => const BuyerLoginWidget(),
        ),
        FFRoute(
          name: 'ForgottenPassword',
          path: '/forgottenPassword',
          builder: (context, params) => const ForgottenPasswordWidget(),
        ),
        FFRoute(
          name: 'OTPreset',
          path: '/oTPreset',
          builder: (context, params) => const OTPresetWidget(),
        ),
        FFRoute(
          name: 'Newpassword',
          path: '/newpassword',
          builder: (context, params) => const NewpasswordWidget(),
        ),
        FFRoute(
          name: 'PasswordResetSuccessful',
          path: '/passwordResetSuccessful',
          builder: (context, params) => const PasswordResetSuccessfulWidget(),
        ),
        FFRoute(
          name: 'Discountpricegoods',
          path: '/discountpricegoods',
          builder: (context, params) => const DiscountpricegoodsWidget(),
        ),
        FFRoute(
          name: 'Details25QuizPage',
          path: '/details25QuizPage',
          builder: (context, params) => const Details25QuizPageWidget(),
        ),
        FFRoute(
          name: 'SellerRegister',
          path: '/sellerRegister',
          builder: (context, params) => SellerRegisterWidget(
            buyerRef: params.getParam(
              'buyerRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['buyer'],
            ),
          ),
        ),
        FFRoute(
          name: 'SellerVerifyemail',
          path: '/sellerVerifyemail',
          builder: (context, params) => const SellerVerifyemailWidget(),
        ),
        FFRoute(
          name: 'SellerVerificationsuccessful',
          path: '/sellerVerificationsuccessful',
          builder: (context, params) => const SellerVerificationsuccessfulWidget(),
        ),
        FFRoute(
          name: 'SellingPoints',
          path: '/sellingPoints',
          builder: (context, params) => const SellingPointsWidget(),
        ),
        FFRoute(
          name: 'OTPtimeoutCopy',
          path: '/oTPtimeoutCopy',
          builder: (context, params) => const OTPtimeoutCopyWidget(),
        ),
        FFRoute(
          name: 'Sellerlogin',
          path: '/sellerlogin',
          builder: (context, params) => const SellerloginWidget(),
        ),
        FFRoute(
          name: 'ViewItem',
          path: '/viewItem',
          builder: (context, params) => ViewItemWidget(
            productRef: params.getParam(
              'productRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['products'],
            ),
          ),
        ),
        FFRoute(
          name: 'Cart',
          path: '/cart',
          builder: (context, params) =>
              params.isEmpty ? const NavBarPage(initialPage: 'Cart') : const CartWidget(),
        ),
        FFRoute(
          name: 'Viewcart_SingleiItem',
          path: '/viewcartSingleiItem',
          builder: (context, params) => const ViewcartSingleiItemWidget(),
        ),
        FFRoute(
          name: 'Create_NewAddress',
          path: '/createNewAddress',
          builder: (context, params) => CreateNewAddressWidget(
            finalPrice: params.getParam(
              'finalPrice',
              ParamType.double,
            ),
          ),
        ),
        FFRoute(
          name: 'EditAddress',
          path: '/editAddress',
          builder: (context, params) => EditAddressWidget(
            addressRef: params.getParam(
              'addressRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['address'],
            ),
            finalPrice: params.getParam(
              'finalPrice',
              ParamType.double,
            ),
          ),
        ),
        FFRoute(
          name: 'Pay_NoaddressRegistered',
          path: '/payNoaddressRegistered',
          builder: (context, params) => const PayNoaddressRegisteredWidget(),
        ),
        FFRoute(
          name: 'Pay_Workplace',
          path: '/payWorkplace',
          builder: (context, params) => PayWorkplaceWidget(
            finalPrice: params.getParam(
              'finalPrice',
              ParamType.double,
            ),
          ),
        ),
        FFRoute(
          name: 'PaymentMethod',
          path: '/paymentMethod',
          builder: (context, params) => const PaymentMethodWidget(),
        ),
        FFRoute(
          name: 'PaymentSuccess',
          path: '/paymentSuccess',
          builder: (context, params) => const PaymentSuccessWidget(),
        ),
        FFRoute(
          name: 'Processing_Packages',
          path: '/processingPackages',
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'Processing_Packages')
              : const ProcessingPackagesWidget(),
        ),
        FFRoute(
          name: 'OrdersPage',
          path: '/CartCopy',
          builder: (context, params) => const OrdersPageWidget(),
        ),
        FFRoute(
          name: 'ProductDetailsProcessing',
          path: '/productDetailsProcessing',
          builder: (context, params) => const ProductDetailsProcessingWidget(),
        ),
        FFRoute(
          name: 'Create_NewAddressPackages',
          path: '/createNewAddressPackages',
          builder: (context, params) => const CreateNewAddressPackagesWidget(),
        ),
        FFRoute(
          name: 'EditPackages',
          path: '/editPackages',
          builder: (context, params) => const EditPackagesWidget(),
        ),
        FFRoute(
          name: 'BuyerProfile',
          path: '/BuyerProfile',
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'BuyerProfile')
              : const BuyerProfileWidget(),
        ),
        FFRoute(
          name: 'AccountSetting',
          path: '/accountSetting',
          builder: (context, params) => const AccountSettingWidget(),
        ),
        FFRoute(
          name: 'Wishlist',
          path: '/wishlist',
          builder: (context, params) => WishlistWidget(
            productRef: params.getParam(
              'productRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['products'],
            ),
          ),
        ),
        FFRoute(
          name: 'AccountInformation',
          path: '/accountInformation',
          builder: (context, params) => const AccountInformationWidget(),
        ),
        FFRoute(
          name: 'Changepassword',
          path: '/changepassword',
          builder: (context, params) => const ChangepasswordWidget(),
        ),
        FFRoute(
          name: 'ChangeOTPPassword',
          path: '/changeOTPPassword',
          builder: (context, params) => const ChangeOTPPasswordWidget(),
        ),
        FFRoute(
          name: 'BuyerNewPassword',
          path: '/buyerNewPassword',
          builder: (context, params) => const BuyerNewPasswordWidget(),
        ),
        FFRoute(
          name: 'VendorProfile',
          path: '/vendorProfile',
          builder: (context, params) => const VendorProfileWidget(),
        ),
        FFRoute(
          name: 'SellerUserProfile',
          path: '/sellerUserProfile',
          builder: (context, params) => const SellerUserProfileWidget(),
        ),
        FFRoute(
          name: 'SellerAccountSetting',
          path: '/sellerAccountSetting',
          builder: (context, params) => const SellerAccountSettingWidget(),
        ),
        FFRoute(
          name: 'SellerAccountInformation',
          path: '/sellerAccountInformation',
          builder: (context, params) => const SellerAccountInformationWidget(),
        ),
        FFRoute(
          name: 'CreateDiscount',
          path: '/createDiscount',
          builder: (context, params) => const CreateDiscountWidget(),
        ),
        FFRoute(
          name: 'SellerChangepassword',
          path: '/sellerChangepassword',
          builder: (context, params) => const SellerChangepasswordWidget(),
        ),
        FFRoute(
          name: 'SellerChangeOTPPassword',
          path: '/sellerChangeOTPPassword',
          builder: (context, params) => const SellerChangeOTPPasswordWidget(),
        ),
        FFRoute(
          name: 'SelleNewPassword',
          path: '/selleNewPassword',
          builder: (context, params) => const SelleNewPasswordWidget(),
        ),
        FFRoute(
          name: 'Customers',
          path: '/customers',
          builder: (context, params) => const CustomersWidget(),
        ),
        FFRoute(
          name: 'CustomersDetails',
          path: '/customersDetails',
          builder: (context, params) => const CustomersDetailsWidget(),
        ),
        FFRoute(
          name: 'wq4t34',
          path: '/wq4t34',
          builder: (context, params) => const Wq4t34Widget(),
        ),
        FFRoute(
          name: 'createProduct',
          path: '/createProduct',
          builder: (context, params) => const CreateProductWidget(),
        ),
        FFRoute(
          name: 'createProductChoice',
          path: '/createProductChoice',
          builder: (context, params) => CreateProductChoiceWidget(
            productDoc: params.getParam(
              'productDoc',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['products'],
            ),
          ),
        ),
        FFRoute(
          name: 'SubmitForVerification',
          path: '/submitForVerification',
          builder: (context, params) => SubmitForVerificationWidget(
            productDoc: params.getParam(
              'productDoc',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['products'],
            ),
          ),
        ),
        FFRoute(
          name: 'OrderDetail',
          path: '/orderDetail',
          asyncParams: {
            'productRef': getDoc(['products'], ProductsRecord.fromSnapshot),
            'orderRef': getDoc(['Order'], OrderRecord.fromSnapshot),
          },
          builder: (context, params) => OrderDetailWidget(
            productRef: params.getParam(
              'productRef',
              ParamType.Document,
            ),
            orderRef: params.getParam(
              'orderRef',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'SellerProducts',
          path: '/sellerProducts',
          builder: (context, params) => const SellerProductsWidget(),
        ),
        FFRoute(
          name: 'ProductDetails',
          path: '/productDetails',
          builder: (context, params) => ProductDetailsWidget(
            productRef: params.getParam(
              'productRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['products'],
            ),
          ),
        ),
        FFRoute(
          name: 'EditProduct',
          path: '/editProduct',
          builder: (context, params) => EditProductWidget(
            productRef: params.getParam(
              'productRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['products'],
            ),
          ),
        ),
        FFRoute(
          name: 'SellerNewPassword2',
          path: '/sellerNewPassword2',
          builder: (context, params) => const SellerNewPassword2Widget(),
        ),
        FFRoute(
          name: 'SellerOTPReset2',
          path: '/sellerOTPReset2',
          builder: (context, params) => const SellerOTPReset2Widget(),
        ),
        FFRoute(
          name: 'SellerPasswordRestSuccess',
          path: '/sellerPasswordRestSuccess',
          builder: (context, params) => const SellerPasswordRestSuccessWidget(),
        ),
        FFRoute(
          name: 'Discount',
          path: '/discount',
          builder: (context, params) => const DiscountWidget(),
        ),
        FFRoute(
          name: 'BuyerHome',
          path: '/buyerHome',
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'BuyerHome')
              : const BuyerHomeWidget(),
        ),
        FFRoute(
          name: 'Splash',
          path: '/splash',
          builder: (context, params) => const SplashWidget(),
        ),
        FFRoute(
          name: 'SellerHome',
          path: '/sellerHome',
          builder: (context, params) => const SellerHomeWidget(),
        ),
        FFRoute(
          name: 'UnverifiedProducts',
          path: '/unverifiedProducts',
          builder: (context, params) => const UnverifiedProductsWidget(),
        ),
        FFRoute(
          name: 'SellerFOrgottenPassword',
          path: '/sellerFOrgottenPassword',
          builder: (context, params) => const SellerFOrgottenPasswordWidget(),
        ),
        FFRoute(
          name: 'OrderDetailCopy',
          path: '/orderDetailCopy',
          asyncParams: {
            'productRef': getDoc(['products'], ProductsRecord.fromSnapshot),
            'orderRef': getDoc(['Order'], OrderRecord.fromSnapshot),
          },
          builder: (context, params) => OrderDetailCopyWidget(
            productRef: params.getParam(
              'productRef',
              ParamType.Document,
            ),
            orderRef: params.getParam(
              'orderRef',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'SellerVerifyemailCopy',
          path: '/sellerVerifyemailCopy',
          builder: (context, params) => const SellerVerifyemailCopyWidget(),
        ),
        FFRoute(
          name: 'UserSelectionPage',
          path: '/userSelectionPage',
          builder: (context, params) => const UserSelectionPageWidget(),
        ),
        FFRoute(
          name: 'AuthGate',
          path: '/authGate',
          builder: (context, params) => const AuthGateWidget(),
        ),
        FFRoute(
          name: 'FilterPage',
          path: '/filterPage',
          builder: (context, params) => const FilterPageWidget(),
        ),
        FFRoute(
          name: 'SearchResult',
          path: '/searchResult',
          builder: (context, params) => SearchResultWidget(
            searchText: params.getParam(
              'searchText',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'NotificationPage',
          path: '/notificationPage',
          builder: (context, params) => const NotificationPageWidget(),
        ),
        FFRoute(
          name: 'RecommendItemPage',
          path: '/recommendItemPage',
          builder: (context, params) => const RecommendItemPageWidget(),
        ),
        FFRoute(
          name: 'TrendingItemsPage',
          path: '/trendingPage',
          builder: (context, params) => const TrendingItemsPageWidget(),
        ),
        FFRoute(
          name: 'ViewProductScreen',
          path: '/viewProductScreen',
          builder: (context, params) => ViewProductScreenWidget(
            productRef: params.getParam(
              'productRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['products'],
            ),
          ),
        ),
        FFRoute(
          name: 'AllProductsPage',
          path: '/allproduct',
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'AllProductsPage')
              : const AllProductsPageWidget(),
        ),
        FFRoute(
          name: 'passwordMailPage',
          path: '/passwordMailPage',
          builder: (context, params) => const PasswordMailPageWidget(),
        ),
        FFRoute(
          name: 'PhoneLogin',
          path: '/phoneLogin',
          builder: (context, params) => const PhoneLoginWidget(),
        ),
        FFRoute(
          name: 'PhoneOTP',
          path: '/phoneOTP',
          builder: (context, params) => PhoneOTPWidget(
            phoneNumber: params.getParam(
              'phoneNumber',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: 'paymentScreen',
          path: '/paymentScreen',
          builder: (context, params) => PaymentScreenWidget(
            addressRef: params.getParam(
              'addressRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['address'],
            ),
            finalPrice: params.getParam(
              'finalPrice',
              ParamType.double,
            ),
            deliveryInstruction: params.getParam(
              'deliveryInstruction',
              ParamType.String,
            ),
            deliveryType: params.getParam(
              'deliveryType',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'pendingProducts',
          path: '/pendingProducts',
          builder: (context, params) => const PendingProductsWidget(),
        ),
        FFRoute(
          name: 'sellerChat',
          path: '/sellerChat',
          builder: (context, params) => SellerChatWidget(
            messageRef: params.getParam(
              'messageRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['messages'],
            ),
          ),
        ),
        FFRoute(
          name: 'OrderPage',
          path: '/orderPage',
          builder: (context, params) => const OrderPageWidget(),
        ),
        FFRoute(
          name: 'ChatUsers',
          path: '/chatUsers',
          builder: (context, params) => const ChatUsersWidget(),
        ),
        FFRoute(
          name: 'OnboardingScreen',
          path: '/onboardingScreen',
          builder: (context, params) => const OnboardingScreenWidget(),
        ),
        FFRoute(
          name: 'sellerRegisterMain',
          path: '/sellerRegisterMain',
          builder: (context, params) => const SellerRegisterMainWidget(),
        ),
        FFRoute(
          name: 'OrderedProductDetails',
          path: '/orderedProductDetails',
          builder: (context, params) => OrderedProductDetailsWidget(
            orderRef: params.getParam(
              'orderRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Order'],
            ),
            productRef: params.getParam(
              'productRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['products'],
            ),
          ),
        ),
        FFRoute(
          name: 'ProductDetailsCopy',
          path: '/productDetailsCopy',
          builder: (context, params) => ProductDetailsCopyWidget(
            productRef: params.getParam(
              'productRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['products'],
            ),
          ),
        ),
        FFRoute(
          name: 'pendingProductsCopy',
          path: '/pendingProductsCopy',
          builder: (context, params) => const PendingProductsCopyWidget(),
        ),
        FFRoute(
          name: 'SellerCheck',
          path: '/sellerCheck',
          builder: (context, params) => const SellerCheckWidget(),
        ),
        FFRoute(
          name: 'PrivacyPolicyPage',
          path: '/privacyPolicyPage',
          builder: (context, params) => const PrivacyPolicyPageWidget(),
        ),
        FFRoute(
          name: 'RefundPolicyPage',
          path: '/RefundPolicyPage',
          builder: (context, params) => const RefundPolicyPageWidget(),
        ),
        FFRoute(
          name: 'PrivacyPages',
          path: '/privacyPages',
          builder: (context, params) => const PrivacyPagesWidget(),
        ),
        FFRoute(
          name: 'LoginOrRegister',
          path: '/loginOrRegister',
          builder: (context, params) => const LoginOrRegisterWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/splash';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: Colors.transparent,
                  child: Image.asset(
                    'assets/images/Logo_1_(1).png',
                    fit: BoxFit.contain,
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => const TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
