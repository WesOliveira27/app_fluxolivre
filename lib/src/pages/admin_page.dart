import 'package:flutter/material.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  // Função auxiliar para construir cada item da grade (grid)
  Widget _buildGridItem({
    required BuildContext context,          // Contexto adicionado para uso futuro potencial (ex: temas)
    required Widget imageContent,          // Widget para o conteúdo principal (Ícone ou Imagem)
    required String label,                  // Rótulo de texto para o item
    required Color imageBackgroundColor,   // Cor de fundo para a área da imagem
    required Color labelBackgroundColor,   // Cor de fundo para a área do rótulo
    VoidCallback? onTap,                    // Manipulador de toque opcional (tap)
  }) {
    return ClipRRect( // Aplica cantos arredondados ao item inteiro
      borderRadius: BorderRadius.circular(12.0), // Ajuste o raio do canto conforme necessário
      child: Material( // Usa Material para efeitos de "splash" (ondulação) do InkWell
        color: Colors.transparent, // Torna o Material transparente para ver as cores do Container
        child: InkWell( // Torna o item clicável (tap)
          onTap: onTap ?? () {
              // Ação padrão se nenhum onTap específico for fornecido
              print('Tocou em $label');
              // Você normalmente navegaria para outra tela aqui:
              // Navigator.push(context, MaterialPageRoute(builder: ...));
            },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch, // Faz os filhos da coluna preencherem a largura
            children: [
              // --- Área da Imagem/Ícone ---
              Expanded( // Faz esta parte ocupar o espaço vertical restante
                child: Container(
                  color: imageBackgroundColor, // Fundo para a parte da imagem/ícone
                  child: Center( // Centraliza o conteúdo dentro desta área
                    child: imageContent,
                  ),
                ),
              ),
              // --- Área do Rótulo ---
              Container(
                color: labelBackgroundColor, // Fundo para a parte do rótulo
                padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0), // Espaçamento (padding) ao redor do texto
                child: Text(
                  label,
                  style: const TextStyle(
                    color: Colors.white,       // Cor do texto branca
                    fontSize: 16,
                    fontWeight: FontWeight.w500, // Texto ligeiramente mais espesso (semi-negrito)
                  ),
                  textAlign: TextAlign.center, // Centraliza o texto
                  overflow: TextOverflow.ellipsis, // Evita que texto longo estoure (overflow), adicionando "..."
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Define os dados para os itens da grade
    // Lembre-se de substituir os widgets Icon por Image.asset('...') quando tiver os assets
    final List<Map<String, dynamic>> adminItems = [
      {
        'label': 'Usuários',
        'imageContent': const Icon(Icons.group_add_outlined, size: 60, color: Colors.brown), // Ícone de exemplo
        'imageBgColor': const Color(0xFFFFFFFF), // Fundo branco para a área do ícone
        'labelBgColor': Colors.grey.shade600,     // Fundo cinza para a área do rótulo
        'onTap': () => print("Navegar para Usuários"), // Exemplo de ação específica
      },
      {
        'label': 'Relatório',
        'imageContent': const Icon(Icons.assessment_outlined, size: 60, color: Color(0xFF265E8A)), // Ícone de exemplo
        'imageBgColor': const Color(0xFFE1F5FE), // Fundo azul claro para a área do ícone
        'labelBgColor': Colors.grey.shade600,     // Fundo cinza para a área do rótulo
         'onTap': () => print("Navegar para Relatórios"), // Exemplo de ação específica
      },
      {
        'label': 'Configurações',
        'imageContent': const Icon(Icons.settings_outlined, size: 60, color: Colors.lightBlueAccent), // Ícone de exemplo
        'imageBgColor': const Color(0xFF263238), // Fundo azul/cinza escuro para a área do ícone
        'labelBgColor': const Color(0xFF263238), // Fundo azul/cinza escuro para a área do rótulo
        'onTap': () => print("Navegar para Configurações"), // Exemplo de ação específica
      },
      // Adicione mais itens aqui se necessário
    ];

    return Scaffold(
      // --- AppBar (Barra Superior) ---
      appBar: AppBar(
        // O botão de voltar (<) geralmente é adicionado automaticamente pelo Flutter
        // ao navegar para esta página. Se necessário, pode ser personalizado com `leading`.
        title: const Text('Fluxo Livre - ADMIN'),
        backgroundColor: const Color(0xFF000000), // Fundo preto
        foregroundColor: const Color(0xFFFFFFFF), // Texto e ícones brancos
        elevation: 4.0, // Adiciona uma sombra sutil
        centerTitle: false, // Título alinhado à esquerda por padrão (como na imagem)
                         // Mude para true se quiser centralizar
      ),
      // --- Corpo (Body) ---
      backgroundColor: const Color(0xFFF8FAFC), // Cor de fundo clara para o corpo (ajuste conforme a imagem, ex: Color(0xFFF3E5F5) para lavanda claro)
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Espaçamento (padding) ao redor do GridView
        child: GridView.builder(
          // Delegate que define como os itens são dispostos na grade
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,       // 2 itens por linha
            crossAxisSpacing: 16.0,  // Espaçamento horizontal entre os itens
            mainAxisSpacing: 16.0,   // Espaçamento vertical entre os itens
            childAspectRatio: 0.9, // Proporção largura/altura dos itens (ajuste se necessário)
          ),
          itemCount: adminItems.length, // Número total de itens na grade
          // Função que constrói cada item da grade
          itemBuilder: (context, index) {
            final item = adminItems[index];
            // Constrói cada item da grade usando a função auxiliar
            return _buildGridItem(
              context: context,
              imageContent: item['imageContent'],
              label: item['label'],
              imageBackgroundColor: item['imageBgColor'],
              labelBackgroundColor: item['labelBgColor'],
              onTap: item['onTap'], // Passa a ação de toque específica
            );
          },
        ),
      ),
    );
  }
}