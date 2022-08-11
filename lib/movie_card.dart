import 'package:flutter/material.dart';
import 'package:movies_tracker/services/global_theme.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(image: AssetImage("assets/in.jpg"), fit: BoxFit.fitWidth)),
        width: (MediaQuery.of(context).size.width / 2) - 10,
        height: 250,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: colorScheme.surface,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10))),
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text("Interstellar",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
