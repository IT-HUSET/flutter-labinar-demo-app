import 'dart:async';
import 'dart:convert';

// For DartPad:
//import 'dart:html' as http; // Cannot use https://pub.dev/packages/http in DartPad...
// For mobile (and web):
import 'package:http/http.dart' as http;

import 'package:flutter_labinar_demo/domain/contract/demo_repository.dart';
import 'package:flutter_labinar_demo/domain/model/demo_model.dart';
import 'package:flutter_labinar_demo/data/mapper/demo_model_mapper.dart';


class DemoApi implements DemoRepository {

  // When using DartPad
  // Future<String> _executeHttpGet(String url) {
  //   return http.HttpRequest.getString(url);
  // }

  // When building (locally) for mobile/web
  Future<String> _executeHttpGet(String url) {
    return http.get(Uri.parse(url)).then((response) => response.body);
  }

  Future<List<DemoModel>> getSomeDomainObject() async {
    // Make call using package http:
    final data = await _executeHttpGet('https://jsonplaceholder.typicode.com/todos');
    // Make call using dart:html package (only when using DartPad):
    //final data = await _executeHttpGetDartPad('https://jsonplaceholder.typicode.com/todos');
    final jsonList = jsonDecode(data) as List<dynamic>;
    final result = jsonList.map((e) => DemoModelMapper.fromJson((e as Map<String, dynamic>)));
    return List.of(result);
  }

}
