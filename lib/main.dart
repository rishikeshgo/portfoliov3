import 'package:flutter/material.dart';
import 'package:portfolio_v2/providers/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart'; // Added missing import for GoogleFonts

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const MyApp(), // Fixed extra positional argument issue
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemeProvider>();
    return MaterialApp(
      title: 'Rishikesh Govind M R',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: theme.colors.background,
        primaryColor: theme.colors.primary,
        textTheme: GoogleFonts.chakraPetchTextTheme( // Fixed undefined identifier
          Theme.of(context).textTheme.apply(
            bodyColor: theme.colors.text,
            displayColor: theme.colors.text,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: theme.colors.primary.withOpacity(0.1),
            foregroundColor: theme.colors.primary,
            elevation: 8,
            shadowColor: theme.colors.primary.withOpacity(0.5),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: theme.colors.primary, width: 2),
            foregroundColor: theme.colors.primary,
          ),
        ),
      ),
      home: const PlaceholderScreen(), // Replaced undefined HomeScreen
    );
  }
}

class PlaceholderScreen extends StatelessWidget {
  const PlaceholderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'HomeScreen Placeholder',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
