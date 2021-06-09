import 'package:flutter/material.dart';
import 'package:flutter_labinar_demo/domain/model/demo_model.dart';
import 'package:flutter_labinar_demo/application/demo_app.dart';

import 'package:flutter_labinar_demo/presentation/widgets/widget_extensions.dart';


class ListPage extends StatefulWidget {
  ListPage({Key? key}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('List page')),
      body: _body(),
    );
  }

  Widget _body() {
    // Get the shared "state", containing references to other parts/layers of the application
    final sharedState = DemoAppState.of(context);
    if (sharedState != null) {
      // Get a reference to the "use case" (clean arch nomenclature), to be able to execute business logic
      final data = sharedState.demoUseCase.getDemoData();

      // Using a future builder to "consume" a Future, handling loading/waiting, error and value states
      return FutureBuilder(future: data, builder: (context, snapshot) {
        final data = snapshot.data as List<DemoModel>?;
        if (snapshot.error != null) {
          return Text('ERROR!').centered();
        } else if (data != null) {
          return _list(data);
        } else {
          return CircularProgressIndicator().paddedAll(16);
        }
      });

    } else {
      return Text('ERROR!').centered();
    }
  }

  Widget _list(List<DemoModel> data) {
    return ListView.builder(
        itemBuilder: (context, index) => _listRow(context, data[index], index),
        itemCount: data.length,
    );
  }

  Widget _listRow(BuildContext context, DemoModel data, int index) {
    return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
      ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),

          leading: Icon(Icons.favorite, color: Colors.purple),

          title: Text('Row #${data.id}'),
          subtitle: Text(data.title),

          trailing: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(Icons.keyboard_arrow_right, color: Colors.grey[600], size: 30.0),
          ]),

          onTap: () {
            // Navigate to "detail" page (which currently doesn't exist) on tap
            Navigator.of(context).pushNamed('/detail');
          }),
      Divider(
        color: Color.fromARGB(255, 215, 212, 207),
        height: 1,
      )
    ]);
  }
}
