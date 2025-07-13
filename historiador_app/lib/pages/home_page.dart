import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
import 'package:pracashistoriador/api/auth_service.dart';
import 'package:pracashistoriador/pages/pi_view/interest_point_view.dart';
import 'package:provider/provider.dart';
import 'dart:convert';

import '../widgets/custom_bottom_nav_bar.dart';
import '../widgets/user_sidebar.dart';
import 'flutter_map_page.dart';
import './isar/pi_form_page.dart';
import './isar/elemento_pi_form_page.dart';



class HomePageHistoriador extends StatefulWidget {

  

  
  const HomePageHistoriador({super.key,});

  @override
  State<HomePageHistoriador> createState() => _HomePageHistoriadorState();
}

class _HomePageHistoriadorState extends State<HomePageHistoriador> {
  

  int _currentIndex = 0;
  String? accountName;
  String? accountEmail;
  bool isLoadingUser = true;

  @override
  void initState() {
    
    super.initState();
    _fetchUserProfile();
  }


  Future<void> _fetchUserProfile() async {
    final auth = Provider.of<AuthService>(context);
    final baseUrl = auth.baseUrl;
    final token = auth.token;

    print("------------------------------- FETCHING USER INFO: $baseUrl -----------------------------------TOKEN: $token");

    final url = Uri.parse('$baseUrl/api/users/me');

    try {
      final response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer ${token}',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        setState(() {
          accountName = jsonData['name'] ?? 'Usuário';
          accountEmail = jsonData['email'] ?? '';
          isLoadingUser = false;
        });
      } else {
        setState(() {
          accountName = 'Usuário';
          accountEmail = '';
          isLoadingUser = false;
        });
      }
    } catch (e) {
      setState(() {
        accountName = 'Erro ao carregar';
        accountEmail = '';
        isLoadingUser = false;
      });
    }
  }

  void _handleLogout() {
    Provider.of<AuthService>(context, listen: false).logout();
    Navigator.pop(context);
  }



  Widget _buildAdicionarOpcoes(BuildContext context) {

    final auth = Provider.of<AuthService>(context);
    final baseUrl = auth.baseUrl;
    final token = auth.token;

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Botão para cadastrar Ponto de Interesse
          ElevatedButton.icon(
            icon: const Icon(Icons.add_location),
            label: const Text('Cadastrar Ponto de Interesse'),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(50),
              backgroundColor: Colors.deepPurple,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PIFormPage(
                    token: token!, // ✅ Correto agora!
                    baseUrl: baseUrl!,
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 24),

          // Botão para adicionar Elemento
          ElevatedButton.icon(
            icon: const Icon(Icons.add),
            label: const Text('Adicionar Elemento'),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(50),
              backgroundColor: Colors.indigo,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ElementoPIFormPage(
                    onSave: (elemento) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Elemento salvo com sucesso'),
                        ),
                      );
                    },
                    token: token!,
                    baseUrl: baseUrl!,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthService>(context);
    final token = auth.token;
    
    
    List<Widget> pages = [
      FlutterMapPage(token: token!),
      InterestPointView(),
      _buildAdicionarOpcoes(context),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Uncovering History'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      drawer: UserSidebar(
        accountName: isLoadingUser
            ? 'Carregando...'
            : (accountName ?? 'Usuário'),
        accountEmail: isLoadingUser ? '' : (accountEmail ?? ''),
        onLogout: _handleLogout,
      ),
      body: pages[_currentIndex],
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
      ),
    );
  }
}