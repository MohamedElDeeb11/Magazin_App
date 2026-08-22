import 'package:flutter/material.dart';

void main() {
  runApp(const MagazinApp());
}

class MagazinApp extends StatelessWidget {
  const MagazinApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Magazin',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const List<Hotel> hotels = [
    Hotel(
      name: 'Sharm El Shikh',
      image: 'assets/images/sharm.jpg',
    ),
    Hotel(
      name: 'Alexandria',
      image: 'assets/images/alexandria.jpg',
    ),
    Hotel(
      name: 'Dahab',
      image: 'assets/images/dahab.jpg',
    ),
    Hotel(
      name: 'Marasy',
      image: 'assets/images/marasy.jpg',
    ),
    Hotel(
      name: 'Nile',
      image: 'assets/images/nile.jpg',
    ),
    Hotel(
      name: 'Aswan',
      image: 'assets/images/aswan.jpg',
    ),
    Hotel(
      name: 'Palm',
      image: 'assets/images/palm.jpg',
    ),
    Hotel(
      name: 'Hurghada',
      image: 'assets/images/hurghada.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 12,
                ),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                    color: Colors.grey.shade200,
                    width: 1,
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 42,
                      decoration: BoxDecoration(
                        color: const Color(0xFF024383),
                        borderRadius: BorderRadius.circular(13),
                      ),
                      child: const Center(
                        child: Text(
                          'Available Hotels',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: GridView.builder(
                        padding: EdgeInsets.zero,
                        physics: const BouncingScrollPhysics(),
                        itemCount: hotels.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 7,
                          mainAxisSpacing: 8,
                          childAspectRatio: 0.88,
                        ),
                        itemBuilder: (context, index) {
                          return HotelCard(
                            hotel: hotels[index],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

class Hotel {
  final String name;
  final String image;

  const Hotel({
    required this.name,
    required this.image,
  });
}

class HotelCard extends StatelessWidget {
  final Hotel hotel;

  const HotelCard({
    super.key,
    required this.hotel,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(14),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            hotel.image,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: Colors.grey.shade300,
                child: const Center(
                  child: Icon(
                    Icons.image_not_supported_outlined,
                    size: 40,
                    color: Colors.grey,
                  ),
                ),
              );
            },
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: 65,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.35),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 6,
            right: 6,
            bottom: 6,
            child: Container(
              height: 30,
              decoration: BoxDecoration(
                color: const Color(0xFF024383),
                borderRadius: BorderRadius.circular(18),
              ),
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
              ),
              child: Text(
                hotel.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}