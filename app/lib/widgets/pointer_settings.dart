import 'package:flutter/material.dart';
import 'package:flutter_challenge/extensions.dart';
import 'package:flutter_challenge/state/puzzle_providers.dart';
import 'package:flutter_challenge/state/puzzle_viewmodel.dart';
import 'package:flutter_challenge/utils/use_throttle.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PointerSettings extends HookConsumerWidget {
  const PointerSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myPointerSettings = ref.read(myPointerSettingsProvider);

    // * Convert to state variables
    final size = useState(myPointerSettings.size);
    final color = useState(myPointerSettings.colorHex);

    final isUpdated = useState(false);

    useThrottle(
      isActive: isUpdated,
      duration: const Duration(milliseconds: 500),
      callback: () {
        final myPointerSettings = ref.read(myPointerSettingsProvider);
        PuzzleVm.instance.updatePointerSettings(
          settings: myPointerSettings.copyWith(
            size: size.value,
            colorHex: color.value,
          ),
        );
        isUpdated.value = false;
      },
    );

    return Container(
      constraints: const BoxConstraints(maxWidth: 250),
      child: Column(
        children: [
          Slider(
            value: size.value,
            min: 8,
            max: 32,
            onChanged: (value) {
              isUpdated.value = true;
              size.value = value;
            },
          ),
          TextButton.icon(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  actions: [
                    TextButton(
                      child: const Text('Close'),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                  content: BlockPicker(
                    pickerColor: HexColor(color.value),
                    useInShowDialog: true,
                    onColorChanged: (Color value) {
                      isUpdated.value = true;
                      color.value = value.toHexString();
                    },
                  ),
                ),
              );
            },
            icon: const Icon(Icons.color_lens),
            label: const Text('Cursor color'),
          ),
        ],
      ),
    );
  }
}