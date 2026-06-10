import 'package:flutter/material.dart';

class PokemonAppBarActions extends StatelessWidget {
  const PokemonAppBarActions({required this.showSearch, super.key});

  final bool showSearch;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (showSearch)
          const Icon(
            Icons.search,
            color: Color(0xFFE5E5E5),
            size: 28,
          )
        else
          const SizedBox.shrink(),
        const SizedBox(
          width: 8,
        ),
        const Icon(
          Icons.account_box_rounded,
          color: Color(0xFFE5E5E5),
          size: 32,
        ),
      ],
    );
  }
}
