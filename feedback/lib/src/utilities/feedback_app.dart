// ignore_for_file: public_member_api_docs

import 'package:feedback/src/l18n/localization.dart';
import 'package:feedback/src/theme/feedback_theme.dart';
import 'package:feedback/src/utilities/media_query_from_window.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FeedbackApp extends StatelessWidget {
  const FeedbackApp({
    Key? key,
    required this.child,
    this.data,
    this.localizationsDelegates,
    this.localeOverride,
    this.useInheritedMediaQuery = false,
  }) : super(key: key);

  final Widget child;
  final FeedbackThemeData? data;
  final List<LocalizationsDelegate<dynamic>>? localizationsDelegates;
  final Locale? localeOverride;
  final bool useInheritedMediaQuery;

  @override
  Widget build(BuildContext context) {
    return FeedbackLocalization(
      delegates: localizationsDelegates,
      localeOverride: localeOverride,
      child: useInheritedMediaQuery
          ? FeedbackTheme(
              data: data ?? FeedbackThemeData(),
              child: child,
            )
          : MediaQueryFromWindow(
              child: FeedbackTheme(
                data: data ?? FeedbackThemeData(),
                child: child,
              ),
            ),
    );
  }
}
