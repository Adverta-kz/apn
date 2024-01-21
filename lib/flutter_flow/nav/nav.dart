import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';

import '/auth/base_auth_user_provider.dart';

import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

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
          appStateNotifier.loggedIn ? MainWidget() : MainWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? MainWidget() : MainWidget(),
        ),
        FFRoute(
          name: 'chooseCategory',
          path: '/chooseCategory',
          builder: (context, params) => ChooseCategoryWidget(),
        ),
        FFRoute(
          name: 'newsDetailVideo',
          path: '/newsDetailVideo',
          builder: (context, params) => NewsDetailVideoWidget(
            videoRef: params.getParam(
                'videoRef', ParamType.DocumentReference, false, ['video']),
          ),
        ),
        FFRoute(
          name: 'newsDetailImage',
          path: '/newsDetailImage',
          builder: (context, params) => NewsDetailImageWidget(
            newsRef: params.getParam(
                'newsRef', ParamType.DocumentReference, false, ['news']),
          ),
        ),
        FFRoute(
          name: 'radioPage',
          path: '/radioPage',
          builder: (context, params) => RadioPageWidget(),
        ),
        FFRoute(
          name: 'Career',
          path: '/career',
          builder: (context, params) => CareerWidget(),
        ),
        FFRoute(
          name: 'CareerDetail',
          path: '/careerDetail',
          asyncParams: {
            'career': getDoc(['career'], CareerRecord.fromSnapshot),
          },
          builder: (context, params) => CareerDetailWidget(
            career: params.getParam('career', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'Profile',
          path: '/profile',
          builder: (context, params) => ProfileWidget(
            active: params.getParam('active', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'menu',
          path: '/menu',
          builder: (context, params) => MenuWidget(),
        ),
        FFRoute(
          name: 'Radio',
          path: '/radio',
          builder: (context, params) => RadioWidget(),
        ),
        FFRoute(
          name: 'newsList',
          path: '/newsList',
          builder: (context, params) => NewsListWidget(),
        ),
        FFRoute(
          name: 'tagList',
          path: '/tagList',
          builder: (context, params) => TagListWidget(),
        ),
        FFRoute(
          name: 'videoList',
          path: '/videoList',
          builder: (context, params) => VideoListWidget(),
        ),
        FFRoute(
          name: 'admin',
          path: '/admin',
          builder: (context, params) => AdminWidget(),
        ),
        FFRoute(
          name: 'imagenews',
          path: '/imagenews',
          asyncParams: {
            'imagenews': getDoc(['news'], NewsRecord.fromSnapshot),
          },
          builder: (context, params) => ImagenewsWidget(
            imagenews: params.getParam('imagenews', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'videoNews',
          path: '/videoNews',
          asyncParams: {
            'videoDoc': getDoc(['video'], VideoRecord.fromSnapshot),
          },
          builder: (context, params) => VideoNewsWidget(
            videoDoc: params.getParam('videoDoc', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'newsListFavoriteOLD',
          path: '/newsListFavoriteOLD',
          builder: (context, params) => NewsListFavoriteOLDWidget(),
        ),
        FFRoute(
          name: 'videoListFavorite',
          path: '/videoListFavorite',
          builder: (context, params) => VideoListFavoriteWidget(),
        ),
        FFRoute(
          name: 'newsListAdmin',
          path: '/newsListAdmin',
          builder: (context, params) => NewsListAdminWidget(),
        ),
        FFRoute(
          name: 'jobAdmin',
          path: '/jobAdmin',
          asyncParams: {
            'jobDoc': getDoc(['career'], CareerRecord.fromSnapshot),
          },
          builder: (context, params) => JobAdminWidget(
            jobDoc: params.getParam('jobDoc', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'Police',
          path: '/police',
          builder: (context, params) => PoliceWidget(),
        ),
        FFRoute(
          name: 'Login',
          path: '/login',
          builder: (context, params) => LoginWidget(),
        ),
        FFRoute(
          name: 'Registration',
          path: '/registration',
          builder: (context, params) => RegistrationWidget(),
        ),
        FFRoute(
          name: 'WelcomeSlider',
          path: '/welcomeSlider',
          builder: (context, params) => WelcomeSliderWidget(),
        ),
        FFRoute(
          name: 'SearchPage',
          path: '/searchPage',
          builder: (context, params) => SearchPageWidget(
            searchable: params.getParam('searchable', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'mainCopy',
          path: '/mainCopy',
          builder: (context, params) => MainCopyWidget(
            selectedChoiseChip:
                params.getParam('selectedChoiseChip', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'main',
          path: '/main',
          builder: (context, params) => MainWidget(
            selectedChoiseChip:
                params.getParam('selectedChoiseChip', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'mainCopy2',
          path: '/mainCopy2',
          builder: (context, params) => MainCopy2Widget(
            selectedChoiseChip:
                params.getParam('selectedChoiseChip', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'mainCopy2Copy',
          path: '/mainCopy2Copy',
          builder: (context, params) => MainCopy2CopyWidget(
            selectedChoiseChip:
                params.getParam('selectedChoiseChip', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'newsListFavorite',
          path: '/newsListFavorite',
          builder: (context, params) => NewsListFavoriteWidget(),
        ),
        FFRoute(
          name: 'newsVideoListNew',
          path: '/newsVideoListNew',
          builder: (context, params) => NewsVideoListNewWidget(),
        ),
        FFRoute(
          name: 'newProfileSettings',
          path: '/newProfileSettings',
          builder: (context, params) => NewProfileSettingsWidget(),
        ),
        FFRoute(
          name: 'SearchPageCopy',
          path: '/searchPageCopy',
          builder: (context, params) => SearchPageCopyWidget(
            searchable: params.getParam('searchable', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'resetPassword',
          path: '/resetPassword',
          builder: (context, params) => ResetPasswordWidget(),
        ),
        FFRoute(
          name: 'Notification',
          path: '/notification',
          builder: (context, params) => NotificationWidget(),
        ),
        FFRoute(
          name: 'CommentsList',
          path: '/commentsList',
          builder: (context, params) => CommentsListWidget(),
        ),
        FFRoute(
          name: 'CommentsDetail',
          path: '/commentsDetail',
          builder: (context, params) => CommentsDetailWidget(
            coment: params.getParam(
                'coment', ParamType.DocumentReference, false, ['coments']),
          ),
        ),
        FFRoute(
          name: 'choosedCat',
          path: '/choosedCat',
          builder: (context, params) => ChoosedCatWidget(
            category: params.getParam('category', ParamType.String),
          ),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      observers: [routeObserver],
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
    ..addAll(queryParameters)
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
      (state.extraMap.length == 1 &&
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
    ParamType type, [
    bool isList = false,
    List<String>? collectionNamePath,
  ]) {
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
    return deserializeParam<T>(param, type, isList,
        collectionNamePath: collectionNamePath);
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
            appStateNotifier.setRedirectLocationIfUnset(state.location);
            return '/main';
          }
          return null;
        },
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
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

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouter.of(context).location;
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}
