import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/My_practice/counter_app_provider.dart';

class CounterAppDemo extends StatefulWidget {
  const CounterAppDemo({super.key});

  @override
  State<CounterAppDemo> createState() => _CounterAppDemoState();
}

class _CounterAppDemoState extends State<CounterAppDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    context.read<ContertwoPrvider>().decremnt1();
                  },
                  icon: const Icon(Icons.remove)),

              // Consumer<ContertwoPrvider>(
              //   builder: (context, obj, child) {
              //     print('hi i am counter1 rebulid');
              //     return Text(obj.count.toString());
              //   },
              // ),
              Selector<ContertwoPrvider, int>(
                builder: (context, value, child) {
                  print('hi i am counter1 rebulid');

                  return Text(value.toString());
                },
                selector: (context, obj) => obj.count,
              ),
              IconButton(
                  onPressed: () {
                    context.read<ContertwoPrvider>().increment1();
                  },
                  icon: const Icon(Icons.add))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    context.read<ContertwoPrvider>().decremnt2();
                  },
                  icon: const Icon(Icons.remove)),
              // Consumer<ContertwoPrvider>(
              //   builder: (context, obj, child) {
              //     print('hi i am counter2 rebulid');
              //     return Text(obj.count2.toString());
              //   },
              // ),
              Selector<ContertwoPrvider, int>(
                builder: (context, value, child) {
                  print('hi i am counter2 rebulid');

                  return Text(value.toString());
                },
                selector: (context, obj1) => obj1.count2,
              ),
              IconButton(
                  onPressed: () {
                    context.read<ContertwoPrvider>().increment2();
                  },
                  icon: const Icon(Icons.add))
            ],
          )
        ],
      )),
    );
  }
}
