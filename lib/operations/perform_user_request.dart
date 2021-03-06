import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:openeew_provisioner/operations/async_platform_operation.dart';

class PerformUserRequest extends AsyncPlatformOperation {

  PerformUserRequest(Map args) : super(args);

  @override
  Future<Map> web() {
    return Future<Map>.value({
      'userId': 'test-user-id',
      'link': 'http://localhost:8080/dashboard?token=abcdef',
    });
  }

  @override
  Future<Map> fallback() async {
    var response = await http.post(
      DotEnv().env['USER_ENDPOINT_URL'],
      body: jsonEncode(this.args)
    );

    return Future<Map>.value(jsonDecode(response.body));
  }
}
