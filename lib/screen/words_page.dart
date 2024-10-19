import 'dart:convert';
import 'dart:math'; // Import the math library
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class WordsPage extends StatefulWidget {
  const WordsPage({super.key});

  @override
  State<WordsPage> createState() => _WordsPageState();
}

class _WordsPageState extends State<WordsPage> {
  var height, width;
  TextEditingController cevap = TextEditingController();
  List<dynamic> words = []; // List to store the words
  Map<String, dynamic>? currentWord; // Store the current word
  Random random = Random(); // Create a random number generator

  @override
  void initState() {
    super.initState();
    loadWords(); // Load words when the widget is initialized
  }

  Future<void> loadWords() async {
    String data = await rootBundle.loadString('Data/a2_words.json');
    setState(() {
      words = jsonDecode(data);
      selectRandomWord(); // Select a random word when the data is loaded
    });
  }

  void selectRandomWord() {
    if (words.isNotEmpty) {
      int randomIndex = random.nextInt(words.length); // Generate a random index
      setState(() {
        currentWord = words[randomIndex]; // Select a word at that index
      });
    }
  }

  Kontrol() {
    if (currentWord != null &&
        currentWord!['meaning'].toString().toLowerCase() ==
            cevap.text.toLowerCase()) {
      // Only select a new word if the answer is correct
      selectRandomWord();
      cevap.clear(); // Clear the TextField after the correct answer
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text("Yanlış"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: words.isEmpty || currentWord == null
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 40, top: 20),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(30),
                          onTap: () {
                            GoRouter.of(context).go('/dashboard');
                          },
                          child: Container(
                            width: 52,
                            height: 52,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white.withOpacity(0.3),
                            ),
                            child: Icon(
                              Icons.close,
                              size: 36,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white30,
                    ),
                    width: width,
                    height: height * 0.75,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black45,
                                    blurRadius: 6,
                                    spreadRadius: 2)
                              ],
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          width: width * 0.8,
                          height: height * 0.6,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 110),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "1th:",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Container(
                                        decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(25),
                                                topRight: Radius.circular(25)),
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                  blurRadius: 6,
                                                  spreadRadius: 1,
                                                  color: Colors.black26)
                                            ]),
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 20, horizontal: 10),
                                        child: Text(
                                          currentWord![
                                              'word'], // Show the random word
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 25),
                                        )),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 20),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "2nd:",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Container(
                                        decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(25),
                                                topRight: Radius.circular(25)),
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                  blurRadius: 6,
                                                  spreadRadius: 1,
                                                  color: Colors.black26)
                                            ]),
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 20, horizontal: 10),
                                        child: Text(
                                          currentWord![
                                              'second_form'], // Show the second form
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 20),
                                        )),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 20),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "3th:",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Container(
                                        decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(25),
                                                topRight: Radius.circular(25)),
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                  blurRadius: 6,
                                                  spreadRadius: 1,
                                                  color: Colors.black26)
                                            ]),
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 20, horizontal: 10),
                                        child: Text(
                                          currentWord![
                                              'third_form'], // Show the third form
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 20),
                                        )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30)),
                    ),
                    width: width,
                    height: height * 0.25,
                    child: Column(
                      children: [
                        const SizedBox(height: 25),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 38, right: 20, left: 20),
                          child: TextField(
                            controller: cevap,
                            decoration: InputDecoration(
                                hintText: 'Cevabınız',
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: const BorderSide(width: 3)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 35, top: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      Kontrol();
                                    });
                                  },
                                  child: const Text(
                                    "Gönder",
                                    style: TextStyle(color: Colors.white70),
                                  ),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.green),
                                  )),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
