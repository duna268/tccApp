import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:tccApp/ui/pages/login/login_page.dart';
import 'package:webview_flutter/webview_flutter.dart';



class MenuPage extends StatelessWidget {
  final String username;

  MenuPage({required this.username});
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
              accountName: Text(username),
              accountEmail: Text('seu@email.com'),
              currentAccountPicture: CircleAvatar(
                child: Icon(Icons.person),
              ),
            ),
            ListTile(
              title: Text('Minha Lista'),
              onTap: () {
                // Implemente a ação do Item 1 aqui
              },
            ),
            Divider(), // Uma linha divisória
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
        color: Color(0xFF06001A), // Fundo azul escuro
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Centraliza verticalmente
          children: [
            Text(
              'Watchlist',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0), // Espaço em branco

            // Carrossel de imagens centralizado
            Center(
              child: Container(
                width: 400, // Largura fixa do carrossel
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 675.0, // Altura do carrossel
                    enlargeCenterPage: true, // Aumenta o centro da imagem
                  ),
                  items: [
                    {
                      'imagePath': 'https://media.fstatic.com/YTz-kfNphh-TH6vn_jT3eTM_Q3U=/322x478/smart/filters:format(webp)/media/movies/covers/2014/09/interestelar_t27814_15.jpg',
                      'text': 'Interstellar',
                      'webURL': 'https://www.imdb.com/title/tt0816692/?ref_=nv_sr_srsg_0_tt_7_nm_1_q_inter',
                      'nota': '9.8',
                    },
                    {
                      'imagePath': 'https://br.web.img2.acsta.net/medias/nmedia/18/89/43/82/20052140.jpg',
                      'text': 'Vingadores',
                      'webURL': 'https://www.imdb.com/title/tt0848228/?ref_=tt_sims_tt_t_2',
                      'nota': '8.2',
                    },
                    {
                      'imagePath': 'https://br.web.img3.acsta.net/pictures/19/04/26/17/30/2428965.jpg',
                      'text': 'Vingadores: Ultimato',
                      'webURL': 'https://www.imdb.com/title/tt4154796/?ref_=tt_sims_tt_t_3',
                      'nota': '9.0',
                    },
                    {
                      'imagePath': 'https://br.web.img2.acsta.net/pictures/18/03/16/15/08/2019826.jpg',
                      'text': 'Vingadores: Guerra Infinita',
                      'webURL': 'https://www.imdb.com/title/tt4154756/?ref_=tt_sims_tt_t_2',
                      'nota': '9.2',
                    },
                    {
                      'imagePath': 'https://m.media-amazon.com/images/M/MV5BZWYzOGEwNTgtNWU3NS00ZTQ0LWJkODUtMmVhMjIwMjA1ZmQwXkEyXkFqcGdeQXVyMjkwOTAyMDU@._V1_.jpg',
                      'text': 'Top Gun: Maverick',
                      'webURL': 'https://www.imdb.com/title/tt1745960/', 
                      'nota': '9.8',
                    },
                  ].map((Map<String, String> item) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => WebViewPage(
            webURL: item['webURL']!,
            title: item['text']!,
          ),
        ),
      );
    },
    child: Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Image.network(
            item['imagePath']!,
            width: 500,
            height: 450,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 10.0),
        Text(
          item['text']!,
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
                // Implemente a lógica para adicionar a nota aqui
              },
              child: Text('Adicionar Nota'),
            ),
            SizedBox(width: 10.0),
            ElevatedButton(
              onPressed: () {
                // Implemente a lógica para adicionar à lista aqui
              },
              child: Text('Adicionar à Lista'),
            ),
          ],
        ),
        SizedBox(height: 10.0),
        Text(
          'Nota: ' + item['nota']!, // Aqui você pode exibir a nota atual
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
        ),
      ],
    ),
  );
}).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
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
        title: Text(title), // Use o título fornecido como título da AppBar
      ),
      body: WebView(
        initialUrl: webURL,
      ),
    );
  }
}