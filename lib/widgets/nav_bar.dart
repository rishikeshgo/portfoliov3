import 'package:flutter/material.dart' hide ThemeMode;
import 'package:provider/provider.dart';
import 'package:portfolio_v2/providers/theme_provider.dart';
import 'package:portfolio_v2/constants/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemeProvider>();
    final isDark = theme.isDark;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(
            Icons.developer_mode, // Replaced text with developer icon
            color: Colors.yellow, // Icon color set to yellow
            size: 30, // Adjusted size for better visibility
          ),
          Row(
            children: [
              _NavLink(
                label: 'About',
                isDark: isDark,
              ),
              const SizedBox(width: 20),
              _NavLink(
                label: 'Projects',
                isDark: isDark,
              ),
              const SizedBox(width: 20),
              _NavLink(
                label: 'Contact',
                isDark: isDark,
              ),
              const SizedBox(width: 20),
              _ThemeToggleButton(
                iconPath: 'assets/img/Cyberpunk_2077_logo.svg',
                isActive: isDark,
                onPressed: () {
                  if (theme.isDark) {
                    theme.setTheme(ThemeMode.light);
                  } else if (theme.isNinja) {
                    theme.setTheme(ThemeMode.dark);
                  } else {
                    theme.setTheme(ThemeMode.ninja);
                  }
                },
              ),
              const SizedBox(width: 10),
              _ThemeToggleButton(
                iconPath: 'assets/img/electrifying.svg',
                isActive: !isDark,
                onPressed: () {
                  if (theme.isDark) {
                    theme.setTheme(ThemeMode.light);
                  } else if (theme.isNinja) {
                    theme.setTheme(ThemeMode.dark);
                  } else {
                    theme.setTheme(ThemeMode.ninja);
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _NavLink extends StatefulWidget {
  final String label;
  final bool isDark;

  const _NavLink({
    required this.label,
    required this.isDark,
  });

  @override
  State<_NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<_NavLink> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemeProvider>();
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedDefaultTextStyle(
        duration: const Duration(milliseconds: 200),
        style: TextStyle(
          color: widget.isDark
              ? (_isHovered ? AppColors.darkColor5 : AppColors.darkColor3) // Electric Blue on hover
              : theme.isNinja
                  ? (_isHovered ? AppColors.ninjaAccent : AppColors.ninjaText) // Dark Red on hover
                  : (_isHovered ? AppColors.primary : AppColors.textSecondary), // Teal on hover
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        child: Text(widget.label),
      ),
    );
  }
}

class _ThemeToggleButton extends StatefulWidget {
  final String iconPath;
  final bool isActive;
  final VoidCallback onPressed;

  const _ThemeToggleButton({
    required this.iconPath,
    required this.isActive,
    required this.onPressed,
  });

  @override
  State<_ThemeToggleButton> createState() => _ThemeToggleButtonState();
}

class _ThemeToggleButtonState extends State<_ThemeToggleButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: 50,
          height: 50,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: widget.isActive
                ? AppColors.primary.withOpacity(0.2)
                : (_isHovered ? AppColors.primary.withOpacity(0.1) : Colors.transparent),
            border: Border.all(
              color: widget.isActive
                  ? AppColors.primary
                  : (_isHovered ? AppColors.primary : AppColors.textSecondary.withOpacity(0.5)),
              width: 2,
            ),
            boxShadow: widget.isActive || _isHovered
                ? [
                    BoxShadow(
                      color: AppColors.primary.withOpacity(0.3),
                      blurRadius: 8,
                      spreadRadius: 1,
                    ),
                  ]
                : [],
          ),
          child: SvgPicture.asset(
            widget.iconPath,
            width: 30,
            height: 30,
            colorFilter: ColorFilter.mode(
              widget.isActive || _isHovered ? AppColors.primary : AppColors.textSecondary,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}
