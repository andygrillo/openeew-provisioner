import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:openeew_provisioner/operations/async_platform_operation.dart';

class PerformOnboardRequest extends AsyncPlatformOperation {

  PerformOnboardRequest(Map args) : super(args);

  @override
  Future<int> web() {
    return Future<int>.delayed(
      Duration(seconds : 3),
      () => 200
    );
  }

  @override
  Future<int> fallback() async {
    var response = await http.post(
      DotEnv().env['ONBOARD_ENDPOINT_URL'],
      body: jsonEncode(this.args['state'])
    );

    return Future<int>.value(response.statusCode);
  }
}