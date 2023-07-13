import 'package:flutter/material.dart';

extension ReactiveThemeExt on MaterialApp {
  /// The function returns a MaterialApp widget with customizable theme settings.
  ///
  /// Args:
  ///   themeMode (ThemeMode): The mode of the theme to be applied to the app. It can be set to
  /// ThemeMode.system, ThemeMode.light, or ThemeMode.dark. If not provided, the default value will be
  /// used.
  MaterialApp themeChanger({ThemeMode? themeMode}) => MaterialApp(
        themeMode: themeMode ?? ThemeMode.system,
        actions: actions,
        builder: builder,
        checkerboardOffscreenLayers: checkerboardOffscreenLayers,
        checkerboardRasterCacheImages: checkerboardRasterCacheImages,
        color: color,
        darkTheme: darkTheme,
        debugShowCheckedModeBanner: debugShowCheckedModeBanner,
        debugShowMaterialGrid: debugShowMaterialGrid,
        highContrastDarkTheme: highContrastDarkTheme,
        highContrastTheme: highContrastTheme,
        home: home,
        initialRoute: initialRoute,
        key: key,
        locale: locale,
        localeListResolutionCallback: localeListResolutionCallback,
        localeResolutionCallback: localeResolutionCallback,
        localizationsDelegates: localizationsDelegates,
        navigatorKey: navigatorKey,
        navigatorObservers: navigatorObservers ?? const <NavigatorObserver>[],
        onGenerateInitialRoutes: onGenerateInitialRoutes,
        onGenerateRoute: onGenerateRoute,
        onGenerateTitle: onGenerateTitle,
        onUnknownRoute: onUnknownRoute,
        restorationScopeId: restorationScopeId,
        routes: routes ?? const <String, WidgetBuilder>{},
        scaffoldMessengerKey: scaffoldMessengerKey,
        scrollBehavior: scrollBehavior,
        shortcuts: shortcuts,
        showPerformanceOverlay: showPerformanceOverlay,
        showSemanticsDebugger: showSemanticsDebugger,
        supportedLocales: supportedLocales,
        theme: theme,
        themeAnimationCurve: themeAnimationCurve,
        themeAnimationDuration: themeAnimationDuration,
        title: title,
      );
}
