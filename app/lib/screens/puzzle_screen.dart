import 'package:flutter/material.dart';
import 'package:flutter_challenge/l10n.dart';
import 'package:flutter_challenge/screens/screen_base.dart';
import 'package:flutter_challenge/styles.dart';
import 'package:flutter_challenge/widgets/info_panels.dart';
import 'package:flutter_challenge/widgets/pointer_settings.dart';
import 'package:flutter_challenge/widgets/puzzle_board.dart';
import 'package:flutter_challenge/widgets/screen_panel.dart';
import 'package:gap/gap.dart';

class PuzzleScreen extends StatelessWidget {
  const PuzzleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenBase(
      color: kPrimaryColor,
      endDrawer: Drawer(
        elevation: 8,
        child: ScreenPanel(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 32,
          ),
          textStyle: appTextStyle(color: kPrimaryColor),
          child: Builder(
            builder: (context) {
              return PointerSettings(
                buttonLabel: L10n.translate.close,
                onButtonTap: () => Navigator.of(context).pop(),
              );
            },
          ),
        ),
      ),
      child: SafeArea(
        child: Builder(builder: (context) {
          return Stack(
            children: [
              Column(
                children: const [
                  Gap(32),
                  InfoPanelRow(),
                  Gap(16),
                  Expanded(
                    child: Center(child: PuzzleBoardLoader()),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: IconButton(
                    onPressed: () => Scaffold.of(context).openEndDrawer(),
                    icon: const Icon(
                      Icons.settings,
                      size: 32,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}
