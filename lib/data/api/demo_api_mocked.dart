import 'dart:async';

import 'package:flutter_labinar_demo/domain/contract/demo_repository.dart';
import 'package:flutter_labinar_demo/domain/model/demo_model.dart';


class DemoApiMocked implements DemoRepository {

  Future<List<DemoModel>> getSomeDomainObject() async {
    return Future.delayed(Duration(seconds: 2), () {
      return [DemoModel(1, 'Hello'), DemoModel(2, 'World')];
    });
  }

}
