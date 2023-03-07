import 'package:coffee_app_ui/constants.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CoffeeAppUi());
}

class CoffeeAppUi extends StatelessWidget {
  const CoffeeAppUi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
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
  List<String> coffeeTypes = [
    'Cappucino',
    'Espresso',
    'Latte',
    'Black',
    'Americano',
    'Doppio',
    'Cortado'
  ];

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    var gradient = LinearGradient(
      colors: [
        greyColor,
        backgroundColor,
      ],
      stops: const [0.0, 0.7],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: gradient),
                    child: Icon(
                      Icons.apps,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: gradient,
                    ),
                    child: Icon(
                      Icons.person,
                      color: Colors.grey.shade700,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                'Find the best coffee for you',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey.shade900,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.search,
                    ),
                    hintText: 'Find Your Coffee...',
                    contentPadding: EdgeInsets.only(top: 15),
                  ),
                  style: TextStyle(fontSize: 15),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                height: 50,
                child: ListView.builder(
                  itemCount: coffeeTypes.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Text(
                        coffeeTypes[index],
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: selectedIndex == index
                                ? buttonColor
                                : Colors.grey.shade700),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GridView.builder(
                  itemCount: 6,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.6,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                  ),
                  itemBuilder: (context, index) => CoffeeItem(
                    gradient: gradient,
                    index: index,
                    coffeeList: coffeeTypes,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CoffeeItem extends StatelessWidget {
  CoffeeItem(
      {super.key,
      required this.gradient,
      required this.index,
      required this.coffeeList});

  int index;
  List<String> coffeeList;

  final LinearGradient gradient;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(
              height: 140,
              width: 140,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'images/coffee$index.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      coffeeList[index],
                      style: const TextStyle(fontSize: 18),
                    ),
                    const Text(
                      'with chocolate',
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  '\$ ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: buttonColor,
                  ),
                ),
                const Text(
                  '4.20',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const Spacer(),
                Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: buttonColor,
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: const Icon(
                      Icons.add,
                      size: 20,
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
