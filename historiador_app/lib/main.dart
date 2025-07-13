import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart'; // dotenv
import 'package:pracashistoriador/api/auth_service.dart';
import 'package:pracashistoriador/login_page.dart';

import 'pages/home_page.dart';


import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");

  

  final String urlApi = dotenv.env['URL_API']!;

  print("------------------------------------- URL_API: $urlApi");

  runApp(
    ChangeNotifierProvider(
      create: (_) => AuthService()..setBaseUrl(urlApi),
      child: HistoriadorApp(baseUrl: urlApi,),
    ),
  );
}

class HistoriadorApp extends StatelessWidget {
  final String baseUrl;

  const HistoriadorApp({super.key, required this.baseUrl});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Historiador App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        useMaterial3: true,
      ),
      home: LoginWrapper(),
    );
  }
}

class LoginWrapper extends StatelessWidget {
  const LoginWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthService>(context);

    if (auth.token == null) {
      return const LoginPage();
    } else {
      return const HomePageHistoriador(); // o token será acessado via Provider
    }
  }
}
