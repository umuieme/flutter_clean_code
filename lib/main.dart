import 'package:clean_code_architecture/core/app/app.dart';
import 'package:clean_code_architecture/core/di/dependency_injector.dart' as di;
import 'package:flutter/material.dart';

void main() {
  di.init();
  runApp(const App());
}
