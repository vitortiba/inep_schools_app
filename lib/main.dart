import 'package:flutter/material.dart';
import 'package:inepschoolsapp/models/school_model.dart';
import 'package:inepschoolsapp/services/school_services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Informações de escolas pelo INEP',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  TextEditingController idInputController;

  @override
  void initState() {
    super.initState();
    idInputController = TextEditingController();
  }

  @override
  void dispose() {
    idInputController.dispose();
    super.dispose();
  }

  void setInputController(value) {
    setState(() {
      idInputController.text = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Informações de escolas pelo INEP'),
      ),
      backgroundColor: Colors.white70,
      body: SingleChildScrollView(
        child: Container(
          child: Column(children: <Widget>[
            Row(children: <Widget>[
              Container(
                constraints: BoxConstraints(minWidth: 100, maxWidth: 300),
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: idInputController,
                  onChanged: (value) {setInputController(value);},
                ),
              ),
            ]),
            Row(children: <Widget>[
              Container(
                constraints: BoxConstraints(minWidth: 100, maxWidth: 300),
                padding: EdgeInsets.all(10),
                child: FutureBuilder<School>(
                    future: getSchool(idInputController.text),
                    builder: (context, snapshot) {
                      print(idInputController);
                      if (snapshot.connectionState ==
                          ConnectionState.done) {
                        if (snapshot.hasError) {
                          return Text("${snapshot.error}");
                        }
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Código: ${snapshot.data.code}"),
                            Text(
                                "Ano do censo: ${snapshot.data.censusYear}"),
                            Text(
                                "Dependência administrativa: ${snapshot.data.administrativeDependency}"),
                            Text(
                                "Código de município: ${snapshot.data.countyCode}"),
                            Text("Endereço: ${snapshot.data.address}",
                                overflow: TextOverflow.ellipsis),
                            Text(
                                "Média geral no enem: ${snapshot.data.enemOverallAverage}"),
                          ],
                        );
                      } else
                        return CircularProgressIndicator();
                    }),
              ),
            ]),
          ]),
        ),
      ),
    );
  }
}
