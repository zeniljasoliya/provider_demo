import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/provider_example/counter_provider.dart';

class CounterDemo extends StatefulWidget {
  const CounterDemo({super.key});

  @override
  State<CounterDemo> createState() => _CounterDemoState();
}

class _CounterDemoState extends State<CounterDemo> {
  @override
  Widget build(BuildContext context) {
    print('I Am Build Method');
    return Scaffold(
      body: Center(child: Consumer<CounterProvide>(
        builder: (context, obj, child) {
          print('I AM Rebulid');
          return Text(obj.count.toString());
        },
      )
          //    Text(
          //       // Provider.of<CounterProvide>(context).count.toString()
          //       context.watch<CounterProvide>().count.toString()),
          ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Provider.of<CounterProvide>(context, listen: false).increment();
          context.read<CounterProvide>().increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
