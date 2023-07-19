import 'package:flutter/material.dart';

void main() => runApp(const TabBarApp());

class TabBarApp extends StatelessWidget {
  const TabBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF33CC99)),
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble),
              label: 'CHATS',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.call),
              label: 'LLAMADAS',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'ESTADOS',
            ),
          ],
          currentIndex: 0,
          selectedItemColor: Color(0xFF33CC99),
          onTap: (index) {
            //Cambiar de pantalla
            if (index == 0) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            } else if (index == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Productos()),
              );
            } else if (index == 2) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Ambiente()),
              );
            }
          },
        ),
        appBar: AppBar(
          title: Text('WHATSAPP'),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.chat_bubble),
              ),
              Tab(
                icon: Icon(Icons.call),
              ),
              Tab(
                icon: Icon(Icons.history),
              ),
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xFF33CC99),
                ),
                child: Text(
                  'Mi Perfil',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('AJUSTES'),
                onTap: () {
                  Navigator.pop(context);

                  //Abrir una nueva pantalla
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Citas()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.new_label),
                title: Text('CONTACTOS'),
                onTap: () {
                  Navigator.pop(context);

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Productos()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('CERRAR SESIÓN'),
                onTap: () {
                  Navigator.pop(context);

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LogOut()),
                  );
                },
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            Center(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  textAlign: TextAlign.left,
                  enabled: false,
                  decoration: InputDecoration(
                    filled: true,
                    hintText: '👤    CHAT 1',
                    hintStyle:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    fillColor: Color(0xFFEAF2F8),
                    contentPadding: EdgeInsets.symmetric(vertical: 5),
                  ),
                ),
                SizedBox(height: 5),
                TextField(
                  textAlign: TextAlign.left,
                  enabled: false,
                  decoration: InputDecoration(
                    filled: true,
                    hintText: '👤    CHAT 2',
                    hintStyle:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    fillColor: Color(0xFFEAF2F8),
                    contentPadding: EdgeInsets.symmetric(vertical: 5),
                  ),
                ),
                SizedBox(height: 5),
                TextField(
                  textAlign: TextAlign.left,
                  enabled: false,
                  decoration: InputDecoration(
                    filled: true,
                    hintText: '👤    CHAT 3',
                    hintStyle:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    fillColor: Color(0xFFEAF2F8),
                    contentPadding: EdgeInsets.symmetric(vertical: 5),
                  ),
                ),
                SizedBox(height: 5),
                TextField(
                  textAlign: TextAlign.left,
                  enabled: false,
                  decoration: InputDecoration(
                    filled: true,
                    hintText: '👤    CHAT 4',
                    hintStyle:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    fillColor: Color(0xFFEAF2F8),
                    contentPadding: EdgeInsets.symmetric(vertical: 5),
                  ),
                ),
                SizedBox(height: 5),
                TextField(
                  textAlign: TextAlign.left,
                  enabled: false,
                  decoration: InputDecoration(
                    filled: true,
                    hintText: '👤    CHAT 5',
                    hintStyle:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    fillColor: Color(0xFFEAF2F8),
                    contentPadding: EdgeInsets.symmetric(vertical: 5),
                  ),
                ),
                SizedBox(height: 5),
                TextField(
                  textAlign: TextAlign.left,
                  enabled: false,
                  decoration: InputDecoration(
                    filled: true,
                    hintText: '👤    CHAT 6',
                    hintStyle:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    fillColor: Color(0xFFEAF2F8),
                    contentPadding: EdgeInsets.symmetric(vertical: 5),
                  ),
                ),
                SizedBox(height: 5),
                TextField(
                  textAlign: TextAlign.left,
                  enabled: false,
                  decoration: InputDecoration(
                    filled: true,
                    hintText: '👤    CHAT 7',
                    hintStyle:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    fillColor: Color(0xFFEAF2F8),
                    contentPadding: EdgeInsets.symmetric(vertical: 5),
                  ),
                ),
                SizedBox(height: 5),
                TextField(
                  textAlign: TextAlign.left,
                  enabled: false,
                  decoration: InputDecoration(
                    filled: true,
                    hintText: '👤    CHAT 8',
                    hintStyle:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    fillColor: Color(0xFFEAF2F8),
                    contentPadding: EdgeInsets.symmetric(vertical: 5),
                  ),
                ),
                SizedBox(height: 5),
                TextField(
                  textAlign: TextAlign.left,
                  enabled: false,
                  decoration: InputDecoration(
                    filled: true,
                    hintText: '👤    CHAT 9',
                    hintStyle:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    fillColor: Color(0xFFEAF2F8),
                    contentPadding: EdgeInsets.symmetric(vertical: 5),
                  ),
                ),
              ],
            )),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextField(
                    textAlign: TextAlign.left,
                    enabled: false,
                    decoration: InputDecoration(
                      filled: true,
                      hintText: '📞 LLAMADA 1',
                      hintStyle:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      fillColor: Color(0xFFEAF2F8),
                      contentPadding: EdgeInsets.symmetric(vertical: 5),
                    ),
                  ),
                  SizedBox(height: 5),
                  TextField(
                    textAlign: TextAlign.left,
                    enabled: false,
                    decoration: InputDecoration(
                      filled: true,
                      hintText: '📞 LLAMADA 2',
                      hintStyle:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      fillColor: Color(0xFFEAF2F8),
                      contentPadding: EdgeInsets.symmetric(vertical: 5),
                    ),
                  ),
                  SizedBox(height: 5),
                  TextField(
                    textAlign: TextAlign.left,
                    enabled: false,
                    decoration: InputDecoration(
                      filled: true,
                      hintText: '📞 LLAMADA 3',
                      hintStyle:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      fillColor: Color(0xFFEAF2F8),
                      contentPadding: EdgeInsets.symmetric(vertical: 5),
                    ),
                  ),
                  SizedBox(height: 5),
                  TextField(
                    textAlign: TextAlign.left,
                    enabled: false,
                    decoration: InputDecoration(
                      filled: true,
                      hintText: '📞 LLAMADA 4',
                      hintStyle:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      fillColor: Color(0xFFEAF2F8),
                      contentPadding: EdgeInsets.symmetric(vertical: 5),
                    ),
                  ),
                  SizedBox(height: 5),
                  TextField(
                    textAlign: TextAlign.left,
                    enabled: false,
                    decoration: InputDecoration(
                      filled: true,
                      hintText: '📞 LLAMADA 5',
                      hintStyle:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      fillColor: Color(0xFFEAF2F8),
                      contentPadding: EdgeInsets.symmetric(vertical: 5),
                    ),
                  ),
                  SizedBox(height: 5),
                  TextField(
                    textAlign: TextAlign.left,
                    enabled: false,
                    decoration: InputDecoration(
                      filled: true,
                      hintText: '📞 LLAMADA 6',
                      hintStyle:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      fillColor: Color(0xFFEAF2F8),
                      contentPadding: EdgeInsets.symmetric(vertical: 5),
                    ),
                  ),
                  SizedBox(height: 5),
                  TextField(
                    textAlign: TextAlign.left,
                    enabled: false,
                    decoration: InputDecoration(
                      filled: true,
                      hintText: '📞 LLAMADA 7',
                      hintStyle:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      fillColor: Color(0xFFEAF2F8),
                      contentPadding: EdgeInsets.symmetric(vertical: 5),
                    ),
                  ),
                  SizedBox(height: 5),
                  TextField(
                    textAlign: TextAlign.left,
                    enabled: false,
                    decoration: InputDecoration(
                      filled: true,
                      hintText: '📞 LLAMADA 8',
                      hintStyle:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      fillColor: Color(0xFFEAF2F8),
                      contentPadding: EdgeInsets.symmetric(vertical: 5),
                    ),
                  ),
                  SizedBox(height: 5),
                  TextField(
                    textAlign: TextAlign.left,
                    enabled: false,
                    decoration: InputDecoration(
                      filled: true,
                      hintText: '📞 LLAMADA 9',
                      hintStyle:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      fillColor: Color(0xFFEAF2F8),
                      contentPadding: EdgeInsets.symmetric(vertical: 5),
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Text(
                "AQUÍ PODRAS VISUALIZAR LOS ESTADOS DE TUS CONTACTOS POR EL MOMENTO NO HAY NINGUNO",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Citas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AJUSTES'),
      ),
      body: Center(
          child: Column(
        children: [
          TextField(
            textAlign: TextAlign.left,
            enabled: false,
            decoration: InputDecoration(
              filled: true,
              hintText: '✅ EDITAR USUARIO',
              hintStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              fillColor: Color(0xFFEAF2F8),
              contentPadding: EdgeInsets.symmetric(vertical: 5),
            ),
          ),
          SizedBox(height: 10),
          TextField(
            textAlign: TextAlign.left,
            enabled: false,
            decoration: InputDecoration(
              filled: true,
              hintText: '🖥️ DISPOSITIVOS CONECTADOS',
              hintStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              fillColor: Color(0xFFEAF2F8),
              contentPadding: EdgeInsets.symmetric(vertical: 5),
            ),
          ),
          SizedBox(height: 10),
          TextField(
            textAlign: TextAlign.left,
            enabled: false,
            decoration: InputDecoration(
              filled: true,
              hintText: '🔑 CUENTA',
              hintStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              fillColor: Color(0xFFEAF2F8),
              contentPadding: EdgeInsets.symmetric(vertical: 5),
            ),
          ),
          SizedBox(height: 10),
          TextField(
            textAlign: TextAlign.left,
            enabled: false,
            decoration: InputDecoration(
              filled: true,
              hintText: '🔔 NOTIFICACIONES',
              hintStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              fillColor: Color(0xFFEAF2F8),
              contentPadding: EdgeInsets.symmetric(vertical: 5),
            ),
          ),
          SizedBox(height: 10),
          TextField(
            textAlign: TextAlign.left,
            enabled: false,
            decoration: InputDecoration(
              filled: true,
              hintText: '💬 CHATS',
              hintStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              fillColor: Color(0xFFEAF2F8),
              contentPadding: EdgeInsets.symmetric(vertical: 5),
            ),
          ),
        ],
      )),
    );
  }
}

class Productos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LLAMADAS'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              textAlign: TextAlign.left,
              enabled: false,
              decoration: InputDecoration(
                filled: true,
                hintText: '📞 LLAMADA 1',
                hintStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                fillColor: Color(0xFFEAF2F8),
                contentPadding: EdgeInsets.symmetric(vertical: 5),
              ),
            ),
            SizedBox(height: 5),
            TextField(
              textAlign: TextAlign.left,
              enabled: false,
              decoration: InputDecoration(
                filled: true,
                hintText: '📞 LLAMADA 2',
                hintStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                fillColor: Color(0xFFEAF2F8),
                contentPadding: EdgeInsets.symmetric(vertical: 5),
              ),
            ),
            SizedBox(height: 5),
            TextField(
              textAlign: TextAlign.left,
              enabled: false,
              decoration: InputDecoration(
                filled: true,
                hintText: '📞 LLAMADA 3',
                hintStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                fillColor: Color(0xFFEAF2F8),
                contentPadding: EdgeInsets.symmetric(vertical: 5),
              ),
            ),
            SizedBox(height: 5),
            TextField(
              textAlign: TextAlign.left,
              enabled: false,
              decoration: InputDecoration(
                filled: true,
                hintText: '📞 LLAMADA 4',
                hintStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                fillColor: Color(0xFFEAF2F8),
                contentPadding: EdgeInsets.symmetric(vertical: 5),
              ),
            ),
            SizedBox(height: 5),
            TextField(
              textAlign: TextAlign.left,
              enabled: false,
              decoration: InputDecoration(
                filled: true,
                hintText: '📞 LLAMADA 5',
                hintStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                fillColor: Color(0xFFEAF2F8),
                contentPadding: EdgeInsets.symmetric(vertical: 5),
              ),
            ),
            SizedBox(height: 5),
            TextField(
              textAlign: TextAlign.left,
              enabled: false,
              decoration: InputDecoration(
                filled: true,
                hintText: '📞 LLAMADA 6',
                hintStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                fillColor: Color(0xFFEAF2F8),
                contentPadding: EdgeInsets.symmetric(vertical: 5),
              ),
            ),
            SizedBox(height: 5),
            TextField(
              textAlign: TextAlign.left,
              enabled: false,
              decoration: InputDecoration(
                filled: true,
                hintText: '📞 LLAMADA 7',
                hintStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                fillColor: Color(0xFFEAF2F8),
                contentPadding: EdgeInsets.symmetric(vertical: 5),
              ),
            ),
            SizedBox(height: 5),
            TextField(
              textAlign: TextAlign.left,
              enabled: false,
              decoration: InputDecoration(
                filled: true,
                hintText: '📞 LLAMADA 8',
                hintStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                fillColor: Color(0xFFEAF2F8),
                contentPadding: EdgeInsets.symmetric(vertical: 5),
              ),
            ),
            SizedBox(height: 5),
            TextField(
              textAlign: TextAlign.left,
              enabled: false,
              decoration: InputDecoration(
                filled: true,
                hintText: '📞 LLAMADA 9',
                hintStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                fillColor: Color(0xFFEAF2F8),
                contentPadding: EdgeInsets.symmetric(vertical: 5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Ambiente extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ambiente'),
      ),
      body: Center(
        child: Text(
          "AQUÍ PODRAS VISUALIZAR LOS ESTADOS DE TUS CONTACTOS POR EL MOMENTO NO HAY NINGUNO",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class LogOut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cerrar Sesion'),
      ),
      body: Center(
        child: Text(
          'Cerrar Sesion',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
