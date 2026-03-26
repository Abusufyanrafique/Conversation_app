// ─────────────────────────────────────────
// SAVE MOMENT BOTTOM SHEET
// ─────────────────────────────────────────

import 'package:conversation_app/Utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SaveMomentBottomSheet extends StatefulWidget {
  const SaveMomentBottomSheet({super.key});

  @override
  State<SaveMomentBottomSheet> createState() => _SaveMomentBottomSheetState();
}

class _SaveMomentBottomSheetState extends State<SaveMomentBottomSheet> {
  final TextEditingController _noteController = TextEditingController();
  final List<String> _tags = ['Tender', 'Surprising', 'Vulnerable', 'Warm', 'Clarifying', 'Difficult', 'Joyful', 'Quiet'];
  final Set<String> _selectedTags = {};

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFF5EDE4),
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom + 15,
        top: 16,
        left: 20,
        right: 20,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _DragHandle(),
            const SizedBox(height: 16),
            const _CardPreview(),
            const SizedBox(height: 21),
            const _SheetTitle(),
            const SizedBox(height: 16),
            _NoteField(controller: _noteController),
            const SizedBox(height: 20),
            const _TagsLabel(),
            const SizedBox(height: 10),
            _TagsSection(
              tags: _tags,
              selectedTags: _selectedTags,
              onTagTap: (tag) {
                setState(() {
                  _selectedTags.contains(tag)
                      ? _selectedTags.remove(tag)
                      : _selectedTags.add(tag);
                });
              },
            ),
            const SizedBox(height: 24),
            _SaveButton(
              onTap: () {
                Navigator.pop(context);
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (_) => const MomentSavedSheet(),
                );
              },
            ),
            const SizedBox(height: 10),
            const _CancelButton(),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────
// DRAG HANDLE
// ─────────────────────────────────────────
class _DragHandle extends StatelessWidget {
  const _DragHandle();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 40,
        height: 4,
        decoration: BoxDecoration(
          color: Color(0xFF9C9590).withOpacity(0.30),
          borderRadius: BorderRadius.circular(2),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────
// CARD PREVIEW
// ─────────────────────────────────────────
class _CardPreview extends StatelessWidget {
  const _CardPreview();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFBA8982),
        borderRadius: BorderRadius.circular(14.61),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Tag
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.white.withOpacity(0.20),
                width: 0.96,
              )
            ),
            child:  Text(
              'COUPLES · INTIMACY',
             style: GoogleFonts.jost(
                 fontSize:8.5,
                 letterSpacing: 1.21,
                 color:Colors.white.withOpacity(0.70),
                 fontWeight: FontWeight.w300,
                
                        ),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            '"What would you want me to truly understand about the way you love?"',
            style: TextStyle(
              color: Colors.white,
              fontFamily: "PeachBlue",
              fontSize: 24,
              fontStyle: FontStyle.italic,
              height:1 ,
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────
// SHEET TITLE
// ─────────────────────────────────────────
class _SheetTitle extends StatelessWidget {
  const _SheetTitle();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text:  TextSpan(
            style: TextStyle(fontSize: 24, color: Color(0xFF3B2E28)),
            children: [
              TextSpan(text: 'Save ',
               style: GoogleFonts.jost(
                 fontSize:26,
                 letterSpacing: 1.21,
                 color:Color(0xFF2B2622),
                 fontWeight: FontWeight.w300,
                
                        ),
              ),
              TextSpan(
                text: 'This Moment.',
                 style: GoogleFonts.jost(
                 fontSize:26,
                 fontStyle: FontStyle.italic,
                 color:Color(0xFF7A6F66),
                 fontWeight: FontWeight.w300,
                
                        ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 6),
        Text(
          'Capture what made this conversation meaningful.',
           style: GoogleFonts.jost(
                 fontSize:13,
                 color:Color(0xFF9C9890),
                 letterSpacing: 0.13,
                 fontWeight: FontWeight.w400,
                
                        ),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────
// NOTE FIELD
// ─────────────────────────────────────────
class _NoteField extends StatelessWidget {
  final TextEditingController controller;
  const _NoteField({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.61),
        border: Border.all(
          color: Colors.white,
          width: 0.97,
          ),
        
         boxShadow: [
      BoxShadow(
        color: Color(0x40000000), 
        blurRadius: 10,
        spreadRadius: 1,
        offset: Offset(0, 4), 
      ),
    ],
      ),
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        
          Row(children: [
            Image(image: AssetImage("assets/icons/authentication/pen.png")),
            SizedBox(width: 7,),
           Text(
            'YOUR NOTE',
           style: GoogleFonts.jost(
                 fontSize:9,
                 color:Color(0xFF9C9890),
                 letterSpacing: 1.52,
                 fontWeight: FontWeight.w400,
                
                        ),
          ),
          ],),
         
          const SizedBox(height: 8),
          TextField(
            controller: controller,
            maxLines: 4,
            maxLength: 280,
            decoration: InputDecoration(
              hintText: 'What came up for you? What shifted? A single sentence is enough...',
              hintStyle: GoogleFonts.jost(
                 fontSize:14,
                 color:Color(0xFF7A6F66).withOpacity(0.62),
                 letterSpacing: 0.14,
                 fontWeight: FontWeight.w400,
                
                        ),
              border: InputBorder.none,
              counterStyle: TextStyle(
                fontSize: 11,
                color: Colors.brown.shade300,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────
// TAGS LABEL
// ─────────────────────────────────────────
class _TagsLabel extends StatelessWidget {
  const _TagsLabel();

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text(
      'HOW DID IT FEEL?',
      style: GoogleFonts.jost(
                 fontSize:10,
                 color:Color(0xFF7A6F66),
                 letterSpacing: 2.28,
                 fontWeight: FontWeight.w400,
                
                        ),
    ),
    SizedBox(width: 7,),
 Expanded(
            child: Container(
              height: 0.98,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0x2E9E9890), // #9E98902E - 18% opacity
                    Color(0x009E9890), // #9E989000 - 0% opacity
                  ],
                ),
              ),
            ),
          ),

    ],);
  }
}

// ─────────────────────────────────────────
// TAGS SECTION
// ─────────────────────────────────────────
class _TagsSection extends StatelessWidget {
  final List<String> tags;
  final Set<String> selectedTags;
  final Function(String) onTagTap;

  const _TagsSection({
    required this.tags,
    required this.selectedTags,
    required this.onTagTap,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 12,
      children: tags.map((tag) {
        final isSelected = selectedTags.contains(tag);
        return GestureDetector(
          onTap: () => onTagTap(tag),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            decoration: BoxDecoration(
              color: isSelected ? const Color(0xFF3B2E28) : Color(0xFF9B9890).withOpacity(0.10),
              border: Border.all(
                color: isSelected
                    ? const Color(0xFF3B2E28)
                    : Color(0xFF9B9890).withOpacity(0.20),
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            //  color: isSelected ? Colors.white : Color(0xFF9C9890),
            child: Text(
              tag,
               style: GoogleFonts.jost(
                 fontSize:10,
                  color: isSelected ? Colors.white : Color(0xFF9C9890),
                 letterSpacing: 0.8,
                 fontWeight: FontWeight.w400,
                
                        ),
            ),
          ),
        );
      }).toList(),
    );
  }
}

// ─────────────────────────────────────────
// SAVE BUTTON
// ─────────────────────────────────────────
class _SaveButton extends StatelessWidget {
  final VoidCallback onTap;
  const _SaveButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF2B2622),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.87),
          ),
          side: BorderSide(
            color: Colors.white,
          ),
          elevation: 0,
        ),
        child:  Text(
          'SAVE MOMENT',
           style: GoogleFonts.jost(
                 fontSize:10.5,
                  color: Color(0xFFF1EDE7),
                 letterSpacing: 1.89,
                 fontWeight: FontWeight.w400,
                
                        ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────
// CANCEL BUTTON
// ─────────────────────────────────────────
class _CancelButton extends StatelessWidget {
  const _CancelButton();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFEFE7DE),
          borderRadius: BorderRadius.circular(15.87),
          border: Border.all(
            color: Colors.white,
          )
        ),
        child: TextButton(
          
          onPressed: () => Navigator.pop(context),
          child: Text(
            'CANCEL',
            style: GoogleFonts.jost(
                 fontSize:10.5,
                  color: Color(0xFF2B2622),
                 letterSpacing: 1.89,
                 fontWeight: FontWeight.w400,
                
                        ),
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────
// MOMENT SAVED SHEET
// ─────────────────────────────────────────
class MomentSavedSheet extends StatelessWidget {
  const MomentSavedSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFF5EDE4),
        borderRadius: BorderRadius.vertical(top: Radius.circular(52)),
      ),
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 40),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const _DragHandle(),
          const SizedBox(height: 230),
//=========================the end==========================
          // Heart icon
          Container(
  width: 75.27,
  height: 72,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(22.91),
    gradient: const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xFFCCA6A0),
        Color(0xFFB5857D),
      ],
    ),
    border: Border.all(
      color: Color(0xFFFFFFFF).withOpacity(0.28),
      width: 1.64,
    ),
  ),
  padding: const EdgeInsets.symmetric(
    vertical: 16.36,
    horizontal: 22.91,
  ),
  child: Image(image: AssetImage(AppImages.bigblackheart))
),
          const SizedBox(height: 24),

          // Title
          RichText(
            text:  TextSpan(
              style: TextStyle(fontSize: 26, color: Color(0xFF3B2E28)),
              children: [
                TextSpan(text: 'Moment ',
                 style: GoogleFonts.jost(
                 fontSize:28,
                 color:Color(0xFF2B2622),
                 fontWeight: FontWeight.w300,
                
                        ),
                ),
                TextSpan(
                  text: 'Saved',
                  style: GoogleFonts.jost(
                 fontSize:28,
                 color:Color(0xFF7A6F66),
                 fontWeight: FontWeight.w300,
                
                        ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),

          Text(
            'It will be waiting for you whenever you\nreturn to it.',
            textAlign: TextAlign.center,
            style: GoogleFonts.jost(
                 fontSize:14.44,
                 color:Color(0xFF5C5651),
                 fontStyle: FontStyle.italic,
                 fontWeight: FontWeight.w300,
                
                        ),
          ),
          const SizedBox(height: 40),

          // Back to deck button
         

         Container(
  width: 208,
  height: 55,
  decoration: BoxDecoration(
    color: Color(0xFFEFE7DE),
    border: Border.all(
      color: Colors.white,
      width: 1,
      ),
    borderRadius: BorderRadius.circular(20),
  ),
  child: GestureDetector(
    onTap: () => Navigator.pop(context),
    child: Center(
      child: Text(
        'BACK TO DECK →',
        style: GoogleFonts.jost(
                 fontSize:12,
                 color:Color(0xFF2B2622),
                 letterSpacing: 2.16,
                 fontWeight: FontWeight.w400,
                
                        ),
      ),
    ),
  ),
),


          const SizedBox(height: 20),
        ],
      ),
    );
  }
}