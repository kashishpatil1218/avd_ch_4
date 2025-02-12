import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class Screens extends StatefulWidget {
  const Screens({super.key});

  @override
  State<Screens> createState() => _ScreensState();
}

class _ScreensState extends State<Screens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade400,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              setState(() {});
            },
            icon: const Icon(
              Icons.restart_alt,
              color: Colors.white,
            ),
          ),
        ],
        backgroundColor: Colors.blue.shade700,
        title: const Text(
          "Quotes",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: .5,
          ),
        ),
      ),
      body: FutureBuilder(
          future: getList(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              var result = snapshot.data!;
              if (result.contains(ConnectivityResult.mobile) ||
                  result.contains(ConnectivityResult.wifi)) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    itemCount: goodThoughtList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        color: Colors.blue.shade50,
                        child: ListTile(
                          title: Text(
                            goodThoughtList[index],
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              letterSpacing: .2,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
              return Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'asset/img/earth-unscreen.gif',
                       //'asset/img/catt-unscreen.gif',
                    ),
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Icon(Icons.error_outline),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}

Future<List<ConnectivityResult>> getList() async {
  return await Connectivity().checkConnectivity();
}

List goodThoughtList = [
  "Don’t watch the clock; do what it does. Keep going. – Sam Levenson",
  "It always seems impossible until it’s done. – Nelson Mandela",
  "You miss 100% of the shots you don’t take. – Wayne Gretzky",
  "Opportunities don't happen. You create them.– Chris Grosser" ,
  "Dream big and dare to fail. – Norman Vaughan",
  "You know you're in love when you can't fall asleep because reality is finally better than your dreams. – Dr. Seuss",
  "Love is composed of a single soul inhabiting two bodies. – Aristotle",
  "To love and be loved is to feel the sun from both sides. – David Viscott",
  "The best thing to hold onto in life is each other. – Audrey Hepburn",
  "In all the world, there is no heart for me like yours. – Maya Angelou",
  "I am so clever that sometimes I don’t understand a single word of what I am saying. – Oscar Wilde",
  "I can resist everything except temptation. – Oscar Wilde",
  "The only mystery in life is why the kamikaze pilots wore helmets. – Al McGuire",
  "Common sense is like deodorant. The people who need it most never use it. – Anonymous",
  "I m not arguing, I’m just explaining why I’m right. – Unknown",
  "The best way to predict the future is to create it. – Abraham Lincoln",
  "Do what you can, with what you have, where you are. – Theodore Roosevelt",
  "Success is not final, failure is not fatal: It is the courage to continue that counts. – Winston Churchill",
  "Believe you can and you're halfway there. – Theodore Roosevelt",
  "Your time is limited, so don’t waste it living someone else’s life. – Steve Jobs",

];