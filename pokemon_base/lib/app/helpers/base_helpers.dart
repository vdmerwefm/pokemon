import 'package:flutter/widgets.dart';

class BaseHelpers {
  static Widget textScalarHelper({
    required BuildContext context,
    required Widget? widget,
  }) {
    final mediaQuery = MediaQuery.of(context);

    if (widget != null && context.mounted) {
      return MediaQuery(
        data: mediaQuery.copyWith(
          textScaler: mediaQuery.textScaler.clamp(
            minScaleFactor: 0.5,
            maxScaleFactor: 1,
          ),
        ),
        child: widget,
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
