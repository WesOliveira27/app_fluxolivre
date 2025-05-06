import 'package:flutter/material.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  
  Widget _buildGridItem({
    required BuildContext context,          
    required Widget imageContent,          
    required String label,                  
    required Color imageBackgroundColor,   
    required Color labelBackgroundColor,   
    VoidCallback? onTap,                    
  }) {
    return ClipRRect( 
      borderRadius: BorderRadius.circular(12.0), 
      child: Material( 
        color: Colors.transparent, 
        child: InkWell( 
          onTap: onTap ?? () {
             
              print('Tocou em $label');
              
              
            },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch, 
            children: [
              
              Expanded( 
                child: Container(
                  color: imageBackgroundColor,
                  child: Center( 
                    child: imageContent,
                  ),
                ),
              ),
             
              Container(
                color: labelBackgroundColor, 
                padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0), 
                child: Text(
                  label,
                  style: const TextStyle(
                    color: Colors.white,       
                    fontSize: 16,
                    fontWeight: FontWeight.w500, 
                  ),
                  textAlign: TextAlign.center, 
                  overflow: TextOverflow.ellipsis,
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
    
    final List<Map<String, dynamic>> adminItems = [
      {
        'label': 'Usuários',
        'imageContent': const Icon(Icons.group_add_outlined, size: 60, color: Colors.brown), 
        'imageBgColor': const Color(0xFFFFFFFF), 
        'labelBgColor': Colors.grey.shade600,     
        'onTap': () => print("Navegar para Usuários"), 
      },
      {
        'label': 'Relatório',
        'imageContent': const Icon(Icons.assessment_outlined, size: 60, color: Color(0xFF265E8A)), 
        'imageBgColor': const Color(0xFFE1F5FE), 
        'labelBgColor': Colors.grey.shade600,     
         'onTap': () => print("Navegar para Relatórios"), 
      },
      {
        'label': 'Configurações',
        'imageContent': const Icon(Icons.settings_outlined, size: 60, color: Colors.lightBlueAccent),
        'imageBgColor': const Color(0xFF263238), 
        'labelBgColor': const Color(0xFF263238), 
        'onTap': () => print("Navegar para Configurações"), 
      },
      
    ];

    return Scaffold(
      
      appBar: AppBar(
       
       
        title: const Text('Fluxo Livre - ADMIN'),
        backgroundColor: const Color(0xFF000000), 
        foregroundColor: const Color(0xFFFFFFFF), 
        elevation: 4.0,
        centerTitle: false, 
                         
      ),
     
      backgroundColor: const Color(0xFFF8FAFC), 
      body: Padding(
        padding: const EdgeInsets.all(16.0), 
        child: GridView.builder(
          
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,       
            crossAxisSpacing: 16.0, 
            mainAxisSpacing: 16.0,   
            childAspectRatio: 0.9, 
          ),
          itemCount: adminItems.length, 
          
          itemBuilder: (context, index) {
            final item = adminItems[index];
            
            return _buildGridItem(
              context: context,
              imageContent: item['imageContent'],
              label: item['label'],
              imageBackgroundColor: item['imageBgColor'],
              labelBackgroundColor: item['labelBgColor'],
              onTap: item['onTap'], 
            );
          },
        ),
      ),
    );
  }
}