import 'package:flutter/material.dart';

class UserSidebar extends StatelessWidget {
  final String accountName;
  final String accountEmail;
  final VoidCallback? onLogout;

  const UserSidebar({
    super.key,
    required this.accountName,
    required this.accountEmail,
    this.onLogout,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(accountName),
            accountEmail: Text(accountEmail),
            currentAccountPicture: const CircleAvatar(
              backgroundImage: AssetImage("assets/user_avatar.png"),
            ),
            decoration: const BoxDecoration(color: Colors.deepPurple),
          ),
          ListTile(
            leading: const Icon(Icons.map),
            title: const Text("Mapa"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text("Configurações"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("Sair"),
            onTap: onLogout,
          ),
        ],
      ),
    );
  }
}
