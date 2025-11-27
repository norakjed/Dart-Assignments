import 'package:flutter/material.dart';

enum Seasons {
  spring("assets/images/W8/Challenge/Spring.jpg"),
  summer("assets/images/W8/Challenge/Summer.jpg"),
  winter("assets/images/W8/Challenge/Winter.jpg"),
  fall("assets/images/W8/Challenge/Fall.jpg");

  final String imagePath;
  const Seasons(this.imagePath);
}

void main() =>
    runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 40),
          const Text(
            "SEASONS",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SeasonCard(countryName: "FRANCE", season: Seasons.winter),
              SeasonCard(countryName: "CAMBODIA", season: Seasons.summer),
            ],
          ),
        ],
      ),
    );
  }
}

class SeasonCard extends StatefulWidget {
  final String countryName;
  final Seasons season;

  const SeasonCard({
    super.key,
    required this.countryName,
    required this.season,
  });

  @override
  State<SeasonCard> createState() => _SeasonCardState();
}

class _SeasonCardState extends State<SeasonCard> {
  late Seasons currentSeason;

  @override
  void initState() {
    super.initState();
    currentSeason = widget.season;
  }

  void onTap() {
    setState(() {
      final currentIndex = Seasons.values.indexOf(currentSeason);
      final nextIndex = (currentIndex + 1) % Seasons.values.length;
      currentSeason = Seasons.values[nextIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: Colors.black),
        ),
        child: Column(
          children: [
            // Rounded top image
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(18),
                topRight: Radius.circular(18),
              ),
              child: Image.asset(
                currentSeason.imagePath,
                width: 150,
                height: 180,
                fit: BoxFit.cover,
              ),
            ),

            // Country label
            Container(
              padding: const EdgeInsets.all(12),
              child: Text(
                widget.countryName,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
