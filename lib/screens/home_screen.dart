import 'package:flutter/material.dart';
import 'basic_widgets_screen.dart';
import 'layout_widgets_screen.dart';
import 'stateful_example_screen.dart';
import 'form_example_screen.dart';
import 'navigation_example_screen.dart';
import 'list_example_screen.dart';
import 'children_widget_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Widget Örnekleri')),
      body: Container(
        padding: const EdgeInsets.all(25.0),
        margin: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Flutter Widget Ağacı Öğrenme 11111',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: [
                  _buildCategoryCard(
                    context,
                    'Temel Widgetlar',
                    Icons.widgets,
                    Colors.blue,
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BasicWidgetsScreen(),
                      ),
                    ),
                  ),
                  _buildCategoryCard(
                    context,
                    'Layout Widgetları',
                    Icons.dashboard,
                    Colors.green,
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LayoutWidgetsScreen(),
                      ),
                    ),
                  ),
                  _buildCategoryCard(
                    context,
                    'Stateful Örnekleri',
                    Icons.refresh,
                    Colors.orange,
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const StatefulExampleScreen(),
                      ),
                    ),
                  ),
                  _buildCategoryCard(
                    context,
                    'Form Örnekleri',
                    Icons.edit,
                    Colors.purple,
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FormExampleScreen(),
                      ),
                    ),
                  ),
                  _buildCategoryCard(
                    context,
                    'Navigasyon',
                    Icons.navigation,
                    Colors.red,
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NavigationExampleScreen(),
                      ),
                    ),
                  ),
                  _buildCategoryCard(
                    context,
                    'Liste Örnekleri',
                    Icons.list,
                    Colors.teal,
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ListExampleScreen(),
                      ),
                    ),
                  ),
                  _buildCategoryCard(
                    context,
                    'children cesitleri',
                    Icons.list,
                    Colors.red,
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ThemeSwitcherScreen(),
                      ),
                    ),
                  ),
                  
                ],
              ),
            ),
          ],
        ),
      ),
      // Widget ağacını göstermek için FloatingActionButton ekleyelim
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showWidgetTree(context);
        },
        tooltip: 'Widget Ağacını Göster',
        child: const Icon(Icons.account_tree),
      ),
    );
  }

  Widget _buildCategoryCard(
    BuildContext context,
    String title,
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 40, color: color),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  void _showWidgetTree(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('HomeScreen Widget Ağacı'),
            content: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text(
                    'Scaffold',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text('├── AppBar'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text('├── Body: Padding'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text('└── Column'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30),
                    child: Text('├── Text (Başlık)'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30),
                    child: Text('├── SizedBox (Boşluk)'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30),
                    child: Text('└── Expanded'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 40),
                    child: Text('└── GridView'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 50),
                    child: Text('└── [Cards...]'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text('└── FloatingActionButton'),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Kapat'),
              ),
            ],
          ),
    );
  }
}
