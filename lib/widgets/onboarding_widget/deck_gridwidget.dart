// import 'package:conversation_app/models/deck_model.dart';
// import 'package:conversation_app/widgets/onboarding_widget/deck_cardwidget.dart';

// import 'package:flutter/material.dart';

// class DeckGridWidget extends StatelessWidget {
//   const DeckGridWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // First 4 items in 2x2 grid
//     final gridItems = deckList.sublist(0, 4);
//     // Last item full width
//     final lastItem = deckList[4];

//     return Column(
//       children: [
//         // 2x2 Grid
//         GridView.builder(
//           shrinkWrap: true,
//           physics: const NeverScrollableScrollPhysics(),
//           itemCount: gridItems.length,
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             mainAxisSpacing: 12,
//             crossAxisSpacing: 12,
//             childAspectRatio: 1.3,
//           ),
//           itemBuilder: (context, index) {
//             return DeckCardWidget(
//               index: index,
//               deck: gridItems[index],
//             );
//           },
//         ),

//         const SizedBox(height: 12),

//         // Full width last card
//         DeckCardWidget(
//           index: 4,
//           deck: lastItem,
//         ),
//       ],
//     );
//   }
// }