import 'package:flutter_labinar_demo/domain/model/demo_model.dart';

abstract class DemoRepository {
  Future<List<DemoModel>> getSomeDomainObject();
}
