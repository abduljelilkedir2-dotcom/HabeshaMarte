import 'package:flutter/material.dart';

void main() {
  runApp(const HabeshaMartApp());
}

class HabeshaMartApp extends StatelessWidget {
  const HabeshaMartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ሀበሻ ማርት (Habesha Mart)',
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // የውሸት (Dummy) የዕቃዎች መረጃዎች ለናሙና
  final List<Map<String, String>> items = [
    {
      'title': 'ሳምሰንግ ጋላክሲ A04 ንጹህ ስልክ',
      'price': '18,000 ብር',
      'location': 'አዲስ አበባ, ቦሌ',
      'category': 'ኤሌክትሮኒክስ',
    },
    {
      'title': 'G+1 የሚያምር የቤተሰብ ቤት ለኪራይ',
      'price': '25,000 ብር/ወር',
      'location': 'አዲስ አበባ, ሳሪስ',
      'category': 'ቤቶች',
    },
    {
      'title': 'ቶዮታ ያሪስ መኪና (ለአሽከርካሪ)',
      'price': '1.8 ሚሊዮን ብር',
      'location': 'አዲስ አበባ, መገናኛ',
      'category': 'መኪናዎች',
    },
  ];

  @override
  Widget build(BuildContext context) {
    // በመረጡት ታችኛው ሜኑ (Bottom Bar) መሰረት የሚለወጠው ገጽ
    final List<Widget> pages = [
      _buildHomeBody(),       // 0: መነሻ ገጽ
      _buildChatPage(),       // 1: መልዕክት/ቻት
      _buildProfilePage(),    // 2: መገለጫዬ (ስልክ እና ቴሌግራም አዝራሮች ያሉት)
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('ሀበሻ ማርት (Habesha Mart)', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.green[700],
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: {},
          ),
        ],
      ),
      body: pages[_selectedIndex],
      floatingActionButton: _selectedIndex == 0
          ? FloatingActionButton.extended(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('ዕቃ ለመለጠፍ ማመልከቻ ተከፈተ!')),
                );
              },
              backgroundColor: Colors.orange[800],
              icon: const Icon(Icons.add, color: Colors.white),
              label: const Text('ዕቃ ሸጥ/ለጥፍ', style: TextStyle(color: Colors.white)),
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green[700],
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'መነሻ'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'መልዕክት'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'መገለጫዬ'),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }

  // 1. የመነሻ ገጽ አካል (Home Body)
  Widget _buildHomeBody() {
    return Column(
      children: [
        Container(
          height: 90,
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _buildCategoryItem(Icons.phone_android, 'ሞባይል'),
              _buildCategoryItem(Icons.home, 'ቤቶች'),
              _buildCategoryItem(Icons.directions_car, 'መኪናዎች'),
              _buildCategoryItem(Icons.chair, 'የቤት እቃዎች'),
              _buildCategoryItem(Icons.checkroom, 'ልብሶች'),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                elevation: 2,
                child: ListTile(
                  leading: Container(
                    width: 60,
                    height: 60,
                    color: Colors.green[100],
                    child: const Icon(Icons.image, color: Colors.green),
                  ),
                  title: Text(item['title']!, style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 4),
                      Text(item['price']!, style: TextStyle(color: Colors.green[800], fontWeight: FontWeight.w600)),
                      Text(item['location']!, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                    ],
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {},
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  // 2. የመልዕክት ገጽ (Chat Page)
  Widget _buildChatPage() {
    return const Center(
      child: Text('ምንም ንግግር/መልዕክት የለም', style: TextStyle(color: Colors.grey, fontSize: 16)),
    );
  }

  // 3. የመገለጫ ገጽ (Profile Page) - የስልኩ እና የቴሌግራሙ አዝራሮች በአንድ ላይ የተያያዙበት
  Widget _buildProfilePage() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const CircleAvatar(
          radius: 40,
          backgroundColor: Colors.green,
          child: Icon(Icons.person, size: 50, color: Colors.white),
        ),
        const SizedBox(height: 12),
        const Text(
          'የሀበሻ ማርት ተጠቃሚ',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 24),
        const Text(
          'ድጋፍ እና ማስታወቂያ ማስነገሪያ',
          style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        
        // ── የቴሌግራም እና የስልክ አዝራሮች በአንድ ላይ ──
        Card(
          elevation: 1,
          child: Column(
            children: [
              // የቴሌግራም አዝራር
              ListTile(
                leading: const Icon(Icons.telegram, color: Colors.blue, size: 30),
                title: const Text('አድሚኑን በቴሌግራም ያውሩ'),
                subtitle: const Text('ማስታወቂያ ለማስነገር (@Username)'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  //
                },
              ),
              const Divider(height: 1),
              // launcheUrl(uri.parse('tel:+251980804290
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryItem(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: Colors.green[100],
            child: Icon(icon, color: Colors.green[800]),
          ),
          const SizedBox(height: 4),
          Text(title, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}
