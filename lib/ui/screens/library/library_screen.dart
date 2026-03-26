 
import 'package:conversation_app/widgets/library/category_list.dart';
import 'package:conversation_app/widgets/library/library_header.dart';
import 'package:conversation_app/widgets/library/library_subtitle.dart';
import 'package:flutter/material.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFE7DE),
        // extendBodyBehindAppBar: true,
      body: SafeArea(
        // top: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            LibraryHeader(),
            SizedBox(height: 12,),
            LibrarySubtitle(),
            SizedBox(height: 31),
            Expanded(child: CategoryList()),
            
          ],
        ),
      ),
    );
  }
}
