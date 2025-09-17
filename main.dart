import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const DailyQuestApp());
}

class DailyQuestApp extends StatelessWidget {
  const DailyQuestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daily Quest',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const QuestHomePage(),
    );
  }
}

class QuestHomePage extends StatefulWidget {
  const QuestHomePage({super.key});

  @override
  State<QuestHomePage> createState() => _QuestHomePageState();
}

class _QuestHomePageState extends State<QuestHomePage> {
  int exp = 0;
  String rank = "F-";
  List<String> quests = [];
  final Random random = Random();

  final List<String> rankList = [
    "F-", "F", "F+", "E-", "E", "E+", "D-", "D", "D+",
    "C-", "C", "C+", "B-", "B", "B+", "A-", "A", "A+",
    "S-", "S", "S+", "SS-", "SS", "SS+", "SSS-", "SSS", "SSS+", "EX"
  ];

  @override
  void initState() {
    super.initState();
    generateDailyQuests();
  }

  void generateDailyQuests() {
    List<String> allQuests = [
      "Belajar 30 menit",
      "Olahraga 15 menit",
      "Meditasi 10 menit",
      "Membaca buku 20 menit",
      "Menulis catatan harian",
      "Menghafal 5 kosa kata baru",
      "Latihan coding 30 menit",
    ];

    quests = [];
    for (int i = 0; i < 3; i++) {
      quests.add(allQuests[random.nextInt(allQuests.length)]);
    }
  }

  void completeQuest(int index) {
    setState(() {
      exp += 50; // setiap quest selesai dapat 50 exp
      updateRank();
      quests.removeAt(index);
    });
  }

  void updateRank() {
    int requiredExp = 100;
    int i = 0;

    while (i < rankList.length - 1 && exp >= requiredExp) {
      exp -= requiredExp;
      i++;
      requiredExp += (requiredExp ~/ 2); // tiap rank naik butuh lebih banyak exp
    }

    rank = rankList[i];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Daily Quest - Rank $rank")),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Text("EXP: $exp", style: const TextStyle(fontSize: 18)),
          const Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: quests.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(quests[index]),
                    trailing: ElevatedButton(
                      onPressed: () => completeQuest(index),
                      child: const Text("Selesai"),
                    ),
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                generateDailyQuests();
              });
            },
            child: const Text("Generate Quest Baru"),
          ),
        ],
      ),
    );
  }
}
