import 'package:flutter/material.dart';

extension PrintStringExtension on String {
  /// This is a String extension for quick access to
  /// print something on the `Terminal` using `DebugPrint()` function
  void get debugString {
    debugPrint(":::::: $this ::::::", wrapWidth: 2048);
  }
}
