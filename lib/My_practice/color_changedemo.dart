import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'color_change_provider.dart';

// ignore: camel_case_types
class ColorChangeDemo extends StatefulWidget {
  const ColorChangeDemo({super.key});

  @override
  State<ColorChangeDemo> createState() => _ColorChangeDemoState();
}

// ignore: camel_case_types
class _ColorChangeDemoState extends State<ColorChangeDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Consumer<ColorChangeProvider>(
            builder: (context, obj, child) => Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: obj.griddata.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 3,
                ),
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    context.read<ColorChangeProvider>().selectColor(index);
                  },
                  child: Container(
                    color: obj.griddata[index]['color'],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
