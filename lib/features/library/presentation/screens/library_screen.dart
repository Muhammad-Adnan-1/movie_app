import 'package:flutter/material.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Media Library", style: Theme.of(context).textTheme.bodyLarge,),
    );
  }
}

