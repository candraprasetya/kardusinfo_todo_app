import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text;
  final Widget child;
  final Function onPressed;
  final Color color;
  final bool disabled;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color = Colors.blue,
    this.disabled = false,
    this.child = const SizedBox(),
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: disabled ? null : () => onPressed(),
        child: Ink(
          decoration: BoxDecoration(
            color: disabled ? Colors.grey : Colors.blue,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: child is SizedBox
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      text,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              : child,
        ),
      ),
    );
  }
}
