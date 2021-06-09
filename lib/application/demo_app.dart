import 'package:flutter/material.dart';

import 'package:flutter_labinar_demo/data/api/demo_api.dart';
import 'package:flutter_labinar_demo/data/api/demo_api_mocked.dart';

import 'package:flutter_labinar_demo/domain/contract/demo_repository.dart';
import 'package:flutter_labinar_demo/domain/use_case/demo_use_case.dart';

import 'package:flutter_labinar_demo/presentation/pages/four04.dart';
import 'package:flutter_labinar_demo/presentation/pages/landing_page.dart';
import 'package:flutter_labinar_demo/presentation/pages/list_page.dart';


class DemoApp extends StatefulWidget {
  @override
  DemoAppState createState() => DemoAppState();
}

class DemoAppState extends State<DemoApp> {

  late DemoRepository demoApi;
  late DemoUseCase demoUseCase;

  @override
  void initState() {
    // In a real world app, we would use something like GetIt to setup below, before initializing the main App class:
    demoApi = DemoApiMocked();
    //demoApi = DemoApi(); // Uncomment to use http calls instead of mocked data
    demoUseCase = DemoUseCase(demoApi);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final app = MaterialApp(
      title: 'DemoApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Setup routing, handling page not found
      onGenerateRoute: (routeSettings) {
        if (routeSettings.name == '/') return MaterialPageRoute(builder: (_) => LandingPage());
        else if (routeSettings.name == '/list') return MaterialPageRoute(builder: (_) => ListPage());
        else return MaterialPageRoute(builder: (_) => Four04());
      },
    );

    return SharedStateWidget(state: this, child: app);
  }

  static DemoAppState? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<SharedStateWidget>()?.state;
  }
}


// Inherited widget for shared application "state"
class SharedStateWidget extends InheritedWidget {
  final DemoAppState state;

  const SharedStateWidget({Key? key, required this.state, required Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(SharedStateWidget oldWidget) => true;
}
