import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const Color _grey = Color(0xFFB3B3B3);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 16),
              _buildRecentlyPlayed(),
              const SizedBox(height: 24),
              _buildReviewHeader(),
              const SizedBox(height: 16),
              _buildReviewCards(),
              const SizedBox(height: 24),
              _buildEditorsPicks(),
            ],
          ),
        ),
      ),
    );
  }

  // ---------- Header ----------
  Widget _buildHeader() {
    return Row(
      children: const [
        Expanded(
          child: Text(
            'Recently played',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
        ),
        Icon(Icons.notifications_none, color: Colors.white, size: 24),
        SizedBox(width: 18),
        Icon(Icons.history, color: Colors.white, size: 24),
        SizedBox(width: 18),
        Icon(Icons.settings_outlined, color: Colors.white, size: 24),
      ],
    );
  }

  // ---------- Recently played ----------
  Widget _buildRecentlyPlayed() {
    return Row(
      children: const [
        _ArtistCircle(name: 'Lana Del Rey', imagePath: 'assets/images/lana.jpeg'),
        SizedBox(width: 16),
        _ArtistCircle(name: 'Marvin Gaye', imagePath: 'assets/images/marvin.jpeg'),
      ],
    );
  }

  // ---------- Your 2021 in review ----------
  Widget _buildReviewHeader() {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(2),
          child: Image.asset(
            'assets/images/top.jpeg',
            width: 40,
            height: 40,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              '#SPOTIFYWRAPPED',
              style: TextStyle(fontSize: 9, color: _grey, letterSpacing: 0.5),
            ),
            Text(
              'Your 2021 in review',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildReviewCards() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Expanded(
          child: _CardWithCaption(
            imagePath: 'assets/images/top.jpeg',
            caption: 'Your Top Songs 2021',
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          child: _CardWithCaption(
            imagePath: 'assets/images/reveal.jpeg',
            caption: 'Your Artists Revealed',
          ),
        ),
      ],
    );
  }

  // ---------- Editor's picks ----------
  Widget _buildEditorsPicks() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "Editor's picks",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 14),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _CardWithCaption(
                imagePath: 'assets/images/ed1.jpeg',
                caption: 'Ed Sheeran, Big Sean,\nJuice WRLD, Post Malone',
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: _CardWithCaption(
                // NOTE: this one is .jpg, not .jpeg
                imagePath: 'assets/images/ed2.jpg',
                caption: 'Mitski, Tame Impala,\nGlass Animals, Charli XCX',
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// =====================================================
// Reusable widgets
// =====================================================

/// Circular artist avatar with name underneath.
class _ArtistCircle extends StatelessWidget {
  final String name;
  final String imagePath;

  const _ArtistCircle({required this.name, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipOval(
          child: Image.asset(
            imagePath,
            width: 76,
            height: 76,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          name,
          style: const TextStyle(fontSize: 11, color: Colors.white),
        ),
      ],
    );
  }
}

/// Square image card with a small grey caption below it.
class _CardWithCaption extends StatelessWidget {
  final String imagePath;
  final String caption;

  const _CardWithCaption({required this.imagePath, required this.caption});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: Image.asset(imagePath, fit: BoxFit.cover),
        ),
        const SizedBox(height: 6),
        Text(
          caption,
          style: const TextStyle(fontSize: 10, color: Color(0xFFB3B3B3)),
        ),
      ],
    );
  }
}