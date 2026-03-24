import 'package:conversation_app/providers/Card_Interation/card_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class FocusModeView extends StatefulWidget {
  const FocusModeView({super.key});

  @override
  State<FocusModeView> createState() => _FocusModeViewState();
}

class _FocusModeViewState extends State<FocusModeView>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fadeAnim;
  late final Animation<Offset> _slideAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _fadeAnim = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
    _slideAnim = Tween<Offset>(
      begin: const Offset(0, 0.12),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CardProvider>();
    final card = provider.currentCard;

    return FadeTransition(
      opacity: _fadeAnim,
      child: SlideTransition(
        position: _slideAnim,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 24),

              // ── Title ──
              const Text(
                'FOCUS MODE',
                style: TextStyle(
                  fontSize: 10,
                  letterSpacing: 3,
                  color: Color(0xFF9E7C7C),
                ),
              ),

              const Spacer(),

              // ── Question Card ──
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 24,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      '"${card.question}"',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 18,
                        fontStyle: FontStyle.italic,
                        fontFamily: 'Georgia',
                        color: Color(0xFF4A3535),
                        height: 1.75,
                      ),
                    ),
                    const SizedBox(height: 28),
                    const Text(
                      'THE CONVERSATION COLLECTION',
                      style: TextStyle(
                        fontSize: 8,
                        letterSpacing: 2.5,
                        color: Color(0xFF9E7C7C),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              // ── Enter Focus Mode button ──
              _FocusButton(
                label: '✦  ENTER FOCUS MODE',
                onTap: provider.toggleFocusMode,
                filled: true,
              ),

              const SizedBox(height: 16),

              // ── Back / Forward ──
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _TextNavButton(
                    label: '← Back',
                    onTap: provider.isFirstCard
                        ? null
                        : () {
                            provider.previousCard();
                          },
                  ),
                  _TextNavButton(
                    label: 'Next →',
                    onTap: provider.isLastCard
                        ? null
                        : () {
                            provider.nextCard();
                          },
                  ),
                ],
              ),

              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

class _FocusButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final bool filled;

  const _FocusButton({
    required this.label,
    required this.onTap,
    this.filled = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: filled ? const Color(0xFF4A3535) : Colors.transparent,
          borderRadius: BorderRadius.circular(14),
          border: filled
              ? null
              : Border.all(color: const Color(0xFF9E7C7C)),
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 11,
            letterSpacing: 2,
            color: filled ? Colors.white : const Color(0xFF9E7C7C),
          ),
        ),
      ),
    );
  }
}

class _TextNavButton extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;

  const _TextNavButton({required this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedOpacity(
        opacity: onTap == null ? 0.3 : 1.0,
        duration: const Duration(milliseconds: 200),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Color(0xFF9E7C7C),
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
    );
  }}
