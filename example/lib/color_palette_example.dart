// USAGE: CHANGE sixCharHex on line 8, and run the example.

import 'package:flutter/material.dart';
import 'package:meku/atom/color.dart';

void main(List<String> args) {
  // CHANGE THIS VALUE
  var sixCharHex = 'aa0066';

  // Create a ColorPalette from the hex value
  var palette = ColorPalette.fromSeed(Color(int.parse("ff$sixCharHex", radix: 16)));

  runApp(MaterialApp(
    theme: ThemeData.dark(useMaterial3: true),
    home: Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Color Palette for 0x$sixCharHex')),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Calculate the size for the squares
          double squareSize = constraints.maxWidth / 11;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Loop through each label to create rows
                for (var label in ['NEUTRAL', 'HIGHLIGHT', 'WARNING'])
                  Expanded(
                    child: Row(
                      children: [
                        // Label for the row
                        SizedBox(
                          width: squareSize,
                          height: squareSize,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text('$label\nSWATCH'),
                            ),
                          ),
                        ),
                        // Create squares for each color in the palette
                        for (var i = 0; i < 11; i++)
                          Expanded(
                            child: Container(
                              width: squareSize,
                              height: squareSize,
                              color: Color(
                                label == 'NEUTRAL'
                                    ? palette.surface[i].toInt()
                                    : label == 'HIGHLIGHT'
                                        ? palette.highlight[i].toInt()
                                        : palette.warning[i].toInt(),
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Text(
                                    i.toString(),
                                    style: TextStyle(
                                      color: i <= 5 ? Colors.white : Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    ),
  ));
}
