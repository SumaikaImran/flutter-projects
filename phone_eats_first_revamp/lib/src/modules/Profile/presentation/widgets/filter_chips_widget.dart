import 'package:phone_eats_first/src/core/theme/app_colors.dart';
import 'package:phone_eats_first/src/core/theme/theme_styles.dart';
import 'package:phone_eats_first/src/core/utils/app_exports.dart';

class FilterChipsWidget extends StatefulWidget {
  final List<String> options;

  /// Called when a chip is selected (always fires on both screens)
  final ValueChanged<String>? onSelected;

  /// If true -> navigate to MapScreen(selectedOption: option) from THIS widget.
  /// Use true on the MAIN screen, false inside the bottom sheet.
  final bool navigateOnSelect;

  /// Controls the selected chip from outside (so chips can reflect current state).
  /// Pass the current selected option (e.g. from MapScreen/BottomSheet state).
  final String? fixedSelectedOption;

  const FilterChipsWidget({
    super.key,
    required this.options,
    this.onSelected,
    this.navigateOnSelect = false,
    this.fixedSelectedOption,
  });

  @override
  State<FilterChipsWidget> createState() => _FilterChipsWidgetState();
}

class _FilterChipsWidgetState extends State<FilterChipsWidget> {
  String? selectedOption;

  @override
  void initState() {
    super.initState();

    selectedOption = widget.fixedSelectedOption;
  }

  // @override
  // void didUpdateWidget(covariant FilterChipsWidget oldWidget) {
  //   super.didUpdateWidget(oldWidget);
  //   // keep chips in sync if parent changes selection
  //   if (widget.initialSelected != oldWidget.initialSelected) {
  //     selectedOption = widget.initialSelected;
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40, // enough height for chips
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: widget.options.length,
        separatorBuilder: (_, __) => const SizedBox(width: 4),
        itemBuilder: (context, index) {
          final option = widget.options[index];
          final isFixedSelected = option == widget.fixedSelectedOption;
          final isSelected = option == selectedOption;

          return FilterChip(
            labelPadding: const EdgeInsets.symmetric(horizontal: 5.0),
            label: Text(
              option,
              style:
                  isSelected
                      ? AppTextTheme.bodyWhite13
                      : AppTextTheme.bodyGrey13Regular,
            ),
            selected: isFixedSelected || isSelected,
            onSelected: (_) {
              setState(() {
                selectedOption = option;
              });

              widget.onSelected?.call(option);
            },
            selectedColor: AppColors.primaryPink,
            showCheckmark: false,
            backgroundColor: AppColors.secondaryTextWhite,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            side: const BorderSide(color: AppColors.lighterGrey, width: 2),
          );
        },
      ),
    );
  }
}
