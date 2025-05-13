import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  Future<List<Map<String, dynamic>>> _fetchUsers() async {
    final url = Uri.parse('https://sua-api.com/users'); // Substitua pelo endpoint real
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((user) => {
        'id': user['id'],
        'name': user['name'],
      }).toList();
    } else {
      throw Exception('Erro ao buscar usuários: ${response.statusCode}');
    }
  }

  void _editUser(BuildContext context, int userId) {
    // Navegar para uma tela de edição ou abrir um diálogo
    print('Editar usuário com ID: $userId');
  }

  Future<void> _deleteUser(BuildContext context, int userId) async {
    final url = Uri.parse('https://sua-api.com/users/$userId'); // Substitua pelo endpoint real
    final response = await http.delete(url);

    if (response.statusCode == 200) {
      print('Usuário excluído com sucesso');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Usuário excluído com sucesso')),
      );
    } else {
      print('Erro ao excluir usuário: ${response.statusCode}');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Erro ao excluir usuário')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Usuários'),
        backgroundColor: const Color(0xFF000000),
        foregroundColor: const Color(0xFFFFFFFF),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _fetchUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Erro ao carregar usuários: API fora do ar'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Nenhum usuário encontrado'));
          }

          final users = snapshot.data!;
          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              return ListTile(
                title: Text(user['name']),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit, color: Colors.blue),
                      onPressed: () => _editUser(context, user['id']),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => _deleteUser(context, user['id']),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

const List<Map<String, dynamic>> users = [
  {
    "id": 1,
    "name": "João Silva"
  },
  {
    "id": 2,
    "name": "Maria Oliveira"
  },
  {
    "id": 3,
    "name": "Carlos Santos"
  }
];