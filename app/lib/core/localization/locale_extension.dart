import 'package:flutter/material.dart';
import 'package:hello/core/localization/generated/app_localization.dart';

extension LocaleExtension on BuildContext {
  AppLocalizations get locale {
    return AppLocalizations.of(this);
  }
}
