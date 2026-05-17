import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/audio_provider.dart';
import '../utils/constants.dart';
import '../utils/lyrics_data.dart';
import '../widgets/album_art.dart';
import '../widgets/player_controls.dart';
import '../widgets/progress_bar.dart';

class NowPlayingScreen extends StatelessWidget {
  const NowPlayingScreen({super.key});

  String _repeatLabel(String mode) {
    if (mode == 'all') return 'Repeat all';
    if (mode == 'one') return 'Repeat one';
    return 'Repeat off';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: AppColors.appGradient),
        child: SafeArea(
          child: Consumer<AudioProvider>(
            builder: (context, provider, child) {
              final song = provider.currentSong;

              if (song == null) {
                return const Center(
                  child: Text(
                    'Chưa có bài hát đang phát',
                    style: TextStyle(color: Colors.white),
                  ),
                );
              }

              final lyrics = LyricsData.getLyrics(song.title);

              return LayoutBuilder(
                builder: (context, constraints) {
                  final bool smallScreen = constraints.maxHeight < 680;

                  final double albumSize = smallScreen ? 200 : 250;
                  final double horizontalPadding = smallScreen ? 18 : 24;
                  final double titleFontSize = smallScreen ? 21 : 24;

                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
                        child: Row(
                          children: [
                            IconButton(
                              icon: const Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: Colors.white,
                                size: 32,
                              ),
                              onPressed: () => Navigator.pop(context),
                            ),
                            const Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    'Đang phát',
                                    style: TextStyle(
                                      color: AppColors.textGrey,
                                      fontSize: 12,
                                      letterSpacing: 1.1,
                                    ),
                                  ),
                                  SizedBox(height: 2),
                                  Text(
                                    'Lyrics Mode',
                                    style: TextStyle(
                                      color: AppColors.textWhite,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.more_horiz_rounded,
                                color: Colors.white,
                              ),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(
                              horizontalPadding,
                              smallScreen ? 10 : 16,
                              horizontalPadding,
                              24,
                            ),
                            child: Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(18),
                                  decoration: BoxDecoration(
                                    gradient: AppColors.cardGradient,
                                    borderRadius: BorderRadius.circular(28),
                                    border: Border.all(color: AppColors.border),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.black45,
                                        blurRadius: 30,
                                        offset: Offset(0, 20),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    children: [
                                      AlbumArt(
                                        songId: song.id,
                                        isAsset: song.isAsset,
                                        size: albumSize,
                                        borderRadius: 24,
                                      ),
                                      SizedBox(height: smallScreen ? 18 : 24),
                                      Text(
                                        song.title,
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: titleFontSize,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        song.artist,
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          color: AppColors.textGrey,
                                          fontSize: 16,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        song.album,
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          color: AppColors.textMuted,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: smallScreen ? 18 : 24),
                                Container(
                                  padding: const EdgeInsets.all(18),
                                  decoration: BoxDecoration(
                                    gradient: AppColors.cardGradient,
                                    borderRadius: BorderRadius.circular(24),
                                    border: Border.all(color: AppColors.border),
                                  ),
                                  child: Column(
                                    children: [
                                      StreamBuilder<Duration>(
                                        stream: provider.positionStream,
                                        builder: (context, positionSnapshot) {
                                          return StreamBuilder<Duration?>(
                                            stream: provider.durationStream,
                                            builder: (context, durationSnapshot) {
                                              final position =
                                                  positionSnapshot.data ??
                                                  Duration.zero;

                                              final duration =
                                                  durationSnapshot.data ??
                                                  Duration(
                                                    milliseconds: song.duration,
                                                  );

                                              return ProgressBar(
                                                position: position,
                                                duration: duration,
                                                onSeek: provider.seek,
                                              );
                                            },
                                          );
                                        },
                                      ),
                                      SizedBox(height: smallScreen ? 8 : 10),
                                      Wrap(
                                        alignment: WrapAlignment.center,
                                        spacing: 8,
                                        runSpacing: 8,
                                        children: [
                                          Chip(
                                            backgroundColor: AppColors.cardAlt,
                                            visualDensity: VisualDensity.compact,
                                            label: Text(
                                              provider.shuffleEnabled
                                                  ? 'Shuffle on'
                                                  : 'Shuffle off',
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                          Chip(
                                            backgroundColor: AppColors.cardAlt,
                                            visualDensity: VisualDensity.compact,
                                            label: Text(
                                              _repeatLabel(provider.repeatMode),
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: smallScreen ? 10 : 14),
                                      const PlayerControls(),
                                      SizedBox(height: smallScreen ? 10 : 14),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.speed_rounded,
                                            color: AppColors.textGrey,
                                            size: 22,
                                          ),
                                          Expanded(
                                            child: Slider(
                                              value: provider.speed.clamp(0.5, 2.0),
                                              min: 0.5,
                                              max: 2.0,
                                              divisions: 6,
                                              label:
                                                  '${provider.speed.toStringAsFixed(1)}x',
                                              activeColor: AppColors.primary,
                                              onChanged: provider.changeSpeed,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 42,
                                            child: Text(
                                              '${provider.speed.toStringAsFixed(1)}x',
                                              textAlign: TextAlign.right,
                                              style: const TextStyle(
                                                color: AppColors.textGrey,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: smallScreen ? 18 : 24),
                                Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(18),
                                  decoration: BoxDecoration(
                                    gradient: AppColors.cardGradient,
                                    borderRadius: BorderRadius.circular(24),
                                    border: Border.all(color: AppColors.border),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: const [
                                          Icon(
                                            Icons.lyrics_rounded,
                                            color: AppColors.primary,
                                          ),
                                          SizedBox(width: 10),
                                          Text(
                                            'Lời bài hát',
                                            style: TextStyle(
                                              color: AppColors.textWhite,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 14),
                                      Text(
                                        lyrics,
                                        style: const TextStyle(
                                          color: AppColors.textGrey,
                                          fontSize: 15,
                                          height: 1.85,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}