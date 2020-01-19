import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Atividade Flutter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final formKey = GlobalKey<FormState>();
  String _email, _password;
  String _nome;

  int selectedRadio;

  void initState(){
    super.initState();
    selectedRadio = 0;
  }

  setSelectedRadio(int val){
    setState(() {
      selectedRadio = val;
    });
  }

  bool _isChecked = false;

  void onChanged(bool value){
    setState(() {
      _isChecked = value;
    });
  }
  @override
  Widget build(BuildContext context) {

    return new Scaffold(
        appBar: new AppBar(
          title: new Text(widget.title),
        ),
        body: Card(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Nome Completo:'
                    ),
                    validator: (input) => input.length < 5 ? 'Nome Completo Invalido' : null,
                    onSaved: (input) => _nome = input,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Email:'
                    ),
                    validator: (input) => !input.contains('@') ? 'Email Invalido' : null,
                    onSaved: (input) => _email = input,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Senha:'
                    ),
                    validator: (input) => input.length < 8 ? 'Voce precisa de no minimo 8 caracteres' : null,
                    onSaved: (input) => _password = input,
                    obscureText: true,
                  ),

                  Divider(
                    height: 20,
                  ),

                  new Column(
                    children: <Widget>[
                      new RadioListTile<int>(
                        value: 0,
                        groupValue: selectedRadio,
                        onChanged: (val) {
                          print("Radio $val");
                          setSelectedRadio(val);
                        },
                        title: new Text('Masculino'),
                      ),
                      new RadioListTile<int>(
                        value: 1,
                        groupValue: selectedRadio,
                        onChanged: (val) {
                          print("Radio $val");
                          setSelectedRadio(val);
                        },
                        title: new Text('Femenino'),
                      ),
                      new RadioListTile<int>(
                        value: 2,
                        groupValue: selectedRadio,
                        onChanged: (val) {
                          print("Radio $val");
                          setSelectedRadio(val);
                        },
                        title: new Text('Indefinido'),
                        subtitle:new Text('Prefiro não disponibilizar esta informação') ,
                      ),
                      new Row(
                        children: <Widget>[
                        new Text('Clique aqui para concordar com os termos de uso'),
                        new Checkbox(value: _isChecked, onChanged: (bool value){onChanged(value);},)
                        ],
                      ),
                    ],
                  ),
                
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RaisedButton(
                          onPressed: _submit,
                          child: Text('Sign in'),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }

  void _submit(){
    if(formKey.currentState.validate()){
      formKey.currentState.save();
      print(_nome);
      print(_email);
      print(_password);
      print(selectedRadio);
      print(_isChecked);
    }
  }
}