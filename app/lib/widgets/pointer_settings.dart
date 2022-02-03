import 'package:flutter/material.dart';
import 'package:flutter_challenge/extensions.dart';
import 'package:flutter_challenge/hooks/use_throttle.dart';
import 'package:flutter_challenge/l10n.dart';
import 'package:flutter_challenge/state/puzzle_providers.dart';
import 'package:flutter_challenge/state/puzzle_viewmodel.dart';
import 'package:flutter_challenge/styles.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared/models/models.dart';

class PointerSettings extends HookConsumerWidget {
  const PointerSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myPointerSettings = ref.watch(myPointerSettingsProvider);

    // * Convert to state variables
    final size = useState(myPointerSettings.size);
    final color = useState(myPointerSettings.colorHex);
    final shape = useState(myPointerSettings.shape.index);

    useEffect(
      () {
        size.value = myPointerSettings.size;
        color.value = myPointerSettings.colorHex;
        shape.value = myPointerSettings.shape.index;
      },
      [myPointerSettings.hashCode],
    );

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
            shape: PointerDisplayShape.values[shape.value],
          ),
        );
        isUpdated.value = false;
      },
    );

    return Container(
      padding: const EdgeInsets.all(16),
      constraints: const BoxConstraints(maxWidth: 350),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Shape
          _SettingsPanel(
            index: 1,
            label: L10n.translate.pickACursor,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: _CursorShapeSelector(
                shapes: PointerDisplayShape.values,
                selectedShape: PointerDisplayShape.values[shape.value],
                cursorSize: size.value,
                iconColor: HexColor(myPointerSettings.colorHex),
                onChanged: (PointerDisplayShape newShape) {
                  shape.value = newShape.index;
                  isUpdated.value = true;
                },
              ),
            ),
          ),
          const _Divider(),

          const Gap(20),
          // Size slider
          _SettingsPanel(
            index: 2,
            label: L10n.translate.setYourSize,
            childPadding: EdgeInsets.zero,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 200),
              child: Slider(
                value: size.value,
                min: 12,
                max: 40,
                activeColor: kGrey,
                inactiveColor: kGrey,
                thumbColor: kPrimaryColor,
                onChanged: (value) {
                  isUpdated.value = true;
                  size.value = value;
                },
              ),
            ),
          ),

          const _Divider(),

          const Gap(20),
          // Change cursor color
          _SettingsPanel(
            index: 3,
            label: L10n.translate.pickAColor,
            child: _ColorPicker(
              color: HexColor(color.value),
              onChanged: (newColor) {
                isUpdated.value = true;
                color.value = newColor.toHexString();
              },
            ),
          ),
          const Gap(8),
        ],
      ),
    );
  }
}

class _SettingsPanel extends StatelessWidget {
  const _SettingsPanel({
    Key? key,
    required this.index,
    required this.label,
    required this.child,
    this.headerPadding = const EdgeInsets.symmetric(horizontal: 20),
    this.childPadding = const EdgeInsets.symmetric(horizontal: 20),
  }) : super(key: key);

  final int index;
  final String label;
  final Widget child;
  final EdgeInsets headerPadding;
  final EdgeInsets childPadding;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Gap(headerPadding.left),
            Container(
              padding: const EdgeInsets.all(9),
              decoration: const ShapeDecoration(
                shape: CircleBorder(),
                color: kPrimaryColor,
              ),
              child: Text(
                '$index',
                style: appTextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Gap(8),
            Text(
              label,
              style: appTextStyle(
                color: kPrimaryColor,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            Gap(headerPadding.right),
          ],
        ),
        Padding(
          padding: childPadding,
          child: child,
        ),
      ],
    );
  }
}

class _Divider extends StatelessWidget {
  const _Divider({
    Key? key,
    this.indent = 20,
    this.height,
  }) : super(key: key);

  final double indent;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 0.0,
      indent: indent,
      endIndent: indent,
      color: kGrey,
      height: height,
    );
  }
}

class _CursorShapeSelector extends StatelessWidget {
  const _CursorShapeSelector({
    Key? key,
    required this.shapes,
    required this.cursorSize,
    required this.selectedShape,
    required this.onChanged,
    required this.iconColor,
  }) : super(key: key);

  final List<PointerDisplayShape> shapes;
  final double cursorSize;
  final PointerDisplayShape selectedShape;
  final ValueSetter<PointerDisplayShape> onChanged;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: shapes.map((shape) {
        return GestureDetector(
          onTap: () => onChanged(shape),
          child: Container(
            margin: const EdgeInsets.only(right: 8),
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(color: shape == selectedShape ? iconColor : kGrey),
              borderRadius: BorderRadius.circular(8),
              color: shape == selectedShape ? iconColor.withOpacity(0.06) : null,
            ),
            child: Center(
              child: SvgPicture.asset(
                shape.assetPath,
                color: iconColor,
                width: cursorSize,
                height: cursorSize,
                fit: BoxFit.fill,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}

class _ColorPicker extends StatelessWidget {
  const _ColorPicker({
    Key? key,
    required this.color,
    required this.onChanged,
  }) : super(key: key);

  final Color color;
  final ValueSetter<Color> onChanged;

  static const _colorList = [
    Color(0xFFFF4343),
    Color(0xFFFF8743),
    Color(0xFFFFCE21),
    Color(0xFF47D266),
    Color(0xFF4399FF),
    Color(0xFFC343FF),
    Color(0xFF4B4B4B),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 4,
      shrinkWrap: true,
      mainAxisSpacing: 20,
      crossAxisSpacing: 10,
      padding: const EdgeInsets.symmetric(vertical: 16),
      children: _colorList
          .map(
            (item) => _ColorItem(
              color: item,
              onTap: () => onChanged(item),
              isSelected: color.toHexString() == item.toHexString(),
            ),
          )
          .toList(),
    );
  }
}

class _ColorItem extends StatelessWidget {
  const _ColorItem({
    Key? key,
    required this.color,
    required this.onTap,
    required this.isSelected,
  }) : super(key: key);

  final Color color;
  final VoidCallback onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.transparent,
          border: Border.all(color: color.withOpacity(isSelected ? 0.3 : 0), width: 4),
        ),
        padding: const EdgeInsets.all(4),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
            border: Border.all(color: color.darken(50), width: 1),
          ),
        ),
      ),
    );
  }
}
