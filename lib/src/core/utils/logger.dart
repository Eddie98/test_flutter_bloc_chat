import 'package:logger/logger.dart';

var logger = Logger(
  filter: null,
  output: null,
  printer: PrettyPrinter(
    methodCount: 0,
    errorMethodCount: 8,
    lineLength: 500,
    colors: true,
    printEmojis: true,
  ),
);
