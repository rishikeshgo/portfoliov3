import 'package:flutter/material.dart';
import 'package:portfolio_v2/constants/app_colors.dart';

class NavItem extends StatefulWidget {
  final String title;
  final int index;
  final VoidCallback onTap;

  const NavItem({
    super.key,
    required this.title,
    required this.index,
    required this.onTap,
  });

  @override
  State<NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<NavItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: isHovered ? AppColors.surfaceLight : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            boxShadow: isHovered ? [
              const BoxShadow(
                color: AppColors.shadowDark,
                offset: Offset(4, 4),
                blurRadius: 8,
              ),
              const BoxShadow(
                color: AppColors.shadowLight,
                offset: Offset(-4, -4),
                blurRadius: 8,
              ),
            ] : null,
          ),
          child: Text(
            '0${widget.index + 1}. ${widget.title}',
            style: TextStyle(
              color: isHovered ? AppColors.primary : AppColors.text,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
