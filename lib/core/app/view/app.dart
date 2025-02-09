import 'package:flutter/material.dart';
import 'package:flutter_tdd_clean_bloc/core/l10n/l10n.dart';
import 'package:flutter_tdd_clean_bloc/features/product_listing/presentation/pages/product_listing_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        useMaterial3: true,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const ProductListingPage(),
    );
  }
}
