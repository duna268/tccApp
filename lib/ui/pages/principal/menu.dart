import 'dart:convert';
import 'dart:typed_data';
import 'package:image/image.dart' as img;

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:tccApp/ui/pages/login/login_page.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:http/http.dart' as http;


class MenuPage extends StatefulWidget {
  final String username;
  final List<Map<String, dynamic>> items;

  MenuPage({required this.username, required this.items});

  @override
  _MenuPageState createState() => _MenuPageState(username: username,items: items);
}



class _MenuPageState extends State<MenuPage> {
  final String username;
  final List<Map<String, dynamic>> items;

    _MenuPageState({required this.username, required this.items});
  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Watchlist'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(widget.username),
              accountEmail: Text('seu@email.com'),
              currentAccountPicture: CircleAvatar(
                child: Icon(Icons.person),
              ),
            ),
            ListTile(
              title: Text('Minha Lista'),
              onTap: () {
                
              },
            ),
            Divider(),
            ListTile(
              title: Text('Sair'),
              onTap: () {
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
              },
            ),
          ],
        ),
      ),
      body: Container(
        color: Color(0xFF06001A),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Watchlist',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            Center(
              child: Container(
                width: 400,
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 675.0,
                    enlargeCenterPage: true,
                  ),
                  items: items.map((item) {
                    return GestureDetector(
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.memory(
                              item['poster']!,
                              width: 500,
                              height: 460,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            item['title']!,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  showNoteModal(context,item['movieId']);
                                },
                                child: Text('Adicionar Nota'),
                              ),
                              SizedBox(width: 10.0),
                              ElevatedButton(
                                onPressed: () {
                                  showDescriptionModal(context,item['description']);
                              },
                              child: Text('Descrição'),
                            ),
                            ],
                          ),
                          SizedBox(height: 10.0),
                          
                        ],
                      ),
                    );
                  }).toList(),
                )

              ),
            ),
          ],
        ),
      ),
    );
  }
}


void showNoteModal(BuildContext context, int movieId) {
  TextEditingController notaController = TextEditingController();

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Adicionar Nota'),
                TextField(
                  controller: notaController,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(labelText: 'Sua nota'),
                ),
                ElevatedButton(
                  onPressed: () {
                    String notaText = notaController.text;
                    if (notaText.isNotEmpty) {
                      double? nota = double.tryParse(notaText);
                      if (nota != null) {
                        Navigator.pop(context);
                        sendRating(movieId, nota);
                      } else {
                        print('Entrada inválida');
                      }
                    } else {
                      // A entrada está vazia.
                      print('Nota vazia');
                    }
                  },
                  child: Text('Salvar Nota'),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}



void showDescriptionModal(BuildContext context, String description) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            padding: EdgeInsets.all(16),
            color: Color(0xFF06001A),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  description,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

Future<void> sendRating(int movieId, double rating) async {
  final String apiUrl = 'http://20.226.237.146/users/1/items/';
  final Map<String, dynamic> data = {
    'movieId': movieId,
    'rating': rating,
  };

  final response = await http.post(
    Uri.parse(apiUrl),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(data),
  );

  if (response.statusCode == 200) {
    print('Nota enviada com sucesso.');
  } else {
    print('Falha ao enviar nota.');
  }
}




class WebViewPage extends StatelessWidget {
  final String webURL;
  final String title;

  WebViewPage({required this.webURL, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title), 
      ),
      body: WebView(
        initialUrl: webURL,
      ),
    );
  }
}