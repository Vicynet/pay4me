import 'package:pay4me/core/apis/interceptors/error_parser.dart';

typedef EitherErrorOrResponse<T> = Future<({ErrorParser? err, T? res})>;
