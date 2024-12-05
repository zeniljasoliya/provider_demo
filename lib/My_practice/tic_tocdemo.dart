import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/My_practice/tic_toc_provider.dart';

class TicTocDemo extends StatefulWidget {
  const TicTocDemo({super.key});

  @override
  State<TicTocDemo> createState() => _TicTocDemoState();
}

class _TicTocDemoState extends State<TicTocDemo> {
  @override
  Widget build(BuildContext context) {
    print('hellow');
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
            child: Consumer<TicTocProvider>(
              builder: (context, obj, child) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          obj.playerX.toString(),
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          "Player 1(X)",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          obj.playerO.toString(),
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          "Player 2(O)",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        )
                      ],
                    )
                  ],
                );
              },
            ),
          ),
          Consumer<TicTocProvider>(
            builder: (context, obj, child) {
              return Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.all(10),
                  itemCount: obj.data.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      context
                          .read<TicTocProvider>()
                          .tapcontainer(index, context);
                      obj.checkcondition();
                      if (obj.player == 1) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Player 1 win'),
                          ),
                        );
                      } else if (obj.player == 2) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Player 2 win'),
                          ),
                        );
                      }
                      obj.player = 0;
                    },
                    child: Container(
                      decoration:
                          BoxDecoration(color: Colors.white, boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.50),
                          blurRadius: 5,
                          spreadRadius: 1,
                        ),
                      ]),
                      child: Center(
                          child: Text(
                        obj.data[index],
                        style: const TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                    ),
                  ),
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 75, vertical: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Consumer<TicTocProvider>(
                  builder: (context, obj, child) => TextButton(
                    onPressed: () {
                      obj.reset();
                    },
                    child: const Text(
                      "Reset",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Consumer<TicTocProvider>(
                  builder: (context, obj, child) => TextButton(
                    onPressed: () {
                      obj.restart();
                    },
                    child: const Text(
                      "Restart",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
