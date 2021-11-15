import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'app.dart';
import 'di/service_locator.dart';
import 'services/configuration_service.dart';
import 'utils/preload_image.dart';

void startApp(String environment) async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies(environment);
  final AppConfiguration settings = serviceLocator.get<AppConfiguration>();
  await runZonedGuarded(() async {
    await SentryFlutter.init((options) {
      options.dsn = settings.sentryDSN;
      options.reportSilentFlutterErrors = true;
    });
    await loadImage(const AssetImage('assets/images/Splash.png'));
    await Firebase.initializeApp();

    await SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    runApp(const MyFavoriteApp());
  }, (exception, stackTrace) async {
    if (settings.sentryEnabled) {
      await Sentry.captureException(exception, stackTrace: stackTrace);
    }
    FlutterError.dumpErrorToConsole(
        FlutterErrorDetails(exception: exception, stack: stackTrace));
  });
}
