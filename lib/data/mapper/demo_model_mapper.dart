import 'package:flutter_labinar_demo/domain/model/demo_model.dart';

class DemoModelMapper {
  static DemoModel fromJson(Map<String, dynamic> json) {
    return DemoModel(json['id'], json['title']);
  }
}
