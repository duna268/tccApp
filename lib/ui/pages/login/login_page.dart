import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:tccApp/ui/pages/principal/menu.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:typed_data';
import 'package:image/image.dart' as img;

FlutterSecureStorage storage = FlutterSecureStorage();

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}



class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final List<Map<String, dynamic>> items = [];
  void _login() {
    
    final username = _usernameController.text;
    final password = _passwordController.text;
    if (username == 'daniel' && password == 'abc123') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MenuPage(username: username,items: items)),
      );
    } else {
      // Tratar caso de credenciais inválidas
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Erro de autenticação'),
            content: Text('Credenciais inválidas. Tente novamente.'),
            actions: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  void initState() {
    super.initState();
    fetchDataAndAddToList(items);
  }

  Future<void> fetchDataAndAddToList(List<Map<String, dynamic>> items) async {
    final response = await http.get(Uri.parse('http://20.226.237.146/not_recommend/'));
    // final response = await http.get(Uri.parse('http://4.228.23.227/recommend/?skip=0&limit=15'));
    if (response.statusCode == 200) {
      final List<dynamic> responseDataList = json.decode(response.body);

      for (var responseData in responseDataList) {
        List<int> imageBytes = base64.decode(responseData['poster']);

        final img.Image image = img.decodeImage(Uint8List.fromList(imageBytes))!;
        final Uint8List uint8List = Uint8List.fromList(img.encodePng(image));

        items.add({
          'title': responseData['title'],
          'poster': uint8List,
          'description': responseData['description'],
          'id': responseData['movieId'],
        });
      }
    } else {
      throw Exception('Falha ao carregar os dados da API');
    }
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF06001A), // Cor de fundo azul escuro
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Watchlist',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Padding(
              
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Usuário',
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Senha',
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                _login(); // Chama a função de login ao pressionar o botão
                // Implemente a lógica de autenticação aqui
              },
              child: Text('Login'),
            ),
          ],
        ),
      ));
  }
}
