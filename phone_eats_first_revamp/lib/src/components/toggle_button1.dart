import 'package:flutter/material.dart';
import 'package:phone_eats_first/src/core/theme/app_colors.dart';

class CustomToggleButton extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  /// Allow overriding colors from caller
  final Color activeTrackColor;
  final Color inactiveColor;
  final Color activeColor;

  final double size;

  const CustomToggleButton({
    super.key,
    required this.value,
    required this.onChanged,
    required this.size,
    this.activeTrackColor = AppColors.green, // default
    this.inactiveColor = AppColors.backgroundPrimary,
    this.activeColor = AppColors.secondaryTextWhite, // default
  });

  @override
  State<CustomToggleButton> createState() => _CustomToggleButtonState();
}

class _CustomToggleButtonState extends State<CustomToggleButton> {
  late bool _isOn;

  @override
  void initState() {
    super.initState();
    _isOn = widget.value;
  }

  void _toggle() {
    setState(() {
      _isOn = !_isOn;
    });
    widget.onChanged(_isOn);
  }

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: widget.size,
      child: Switch(
        value: _isOn,
        activeColor: widget.activeColor, // knob when ON
        activeTrackColor: widget.activeTrackColor, // track ON
        inactiveThumbColor: Colors.white, // knob when OFF
        inactiveTrackColor: widget.inactiveColor, // track OFF
        trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
        onChanged: (val) => _toggle(),
      ),
    );
  }
}
