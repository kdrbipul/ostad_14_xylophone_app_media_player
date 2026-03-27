import 'package:flutter/material.dart';
import 'package:ostad_14_xylophone_app_media_player/core/constants/app_colors.dart';
import 'package:ostad_14_xylophone_app_media_player/presentation/screens/home/provider/media_provider.dart';
import 'package:provider/provider.dart';

class PlayerController extends StatelessWidget {
  const PlayerController({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MediaProvider>(
      builder: (context, provider, child) {
        final currentSong = provider.currentSong;
        if (currentSong == null) {
          return SizedBox.shrink();
        }
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
          ),
          child: Column(
            children: [
              Text(
                currentSong.title,
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                currentSong.artist,
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  activeTickMarkColor: AppColors.accent,
                  inactiveTickMarkColor: AppColors.textSecondary.withValues(
                    alpha: 0.2,
                  ),
                  thumbColor: AppColors.accent,
                  trackHeight: 4.0,
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 6.0),
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 14),
                ),
                child: Slider(
                  value: provider.position.inMilliseconds.toDouble().clamp(
                    0.0,
                    provider.duration.inMilliseconds.toDouble() > 0
                        ? provider.duration.inMilliseconds.toDouble()
                        : 1.0,
                  ),
                  onChanged: (value) {
                    provider.seek(Duration(milliseconds: value.toInt()));
                  },
                  min: 0.0,
                  max: provider.duration.inMilliseconds.toDouble() > 0
                      ? provider.duration.inMilliseconds.toDouble()
                      : 1.0,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
