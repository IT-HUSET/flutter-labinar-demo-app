import 'dart:async';

import 'package:flutter_labinar_demo/domain/model/demo_model.dart';
import 'package:flutter_labinar_demo/domain/contract/demo_repository.dart';


class DemoUseCase {

  static const Duration memoryCacheTTL = const Duration(seconds: 10);

  final DemoRepository demoRepository;

  List<DemoModel>? _demoDataCache;
  DateTime _lastModified = DateTime.now();

  DemoUseCase(this.demoRepository);

  Future<List<DemoModel>> getDemoData() {
    if (_demoDataCache != null && DateTime.now().difference(_lastModified) < memoryCacheTTL) {
      return Future.value(_demoDataCache);
    } else {
      final completer = Completer<List<DemoModel>>();

      demoRepository.getSomeDomainObject()
          .then((value) => completer.complete(value))
          .catchError((error) => completer.completeError(error));

      return completer.future;
    }
  }

}
