import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_features/src/helpers/leading_widget_helper.dart';

class PokemonLeadingWidget extends StatelessWidget {
  const PokemonLeadingWidget({this.isFavorite, super.key});

  final bool? isFavorite;

  @override
  Widget build(BuildContext context) {
    if (context.router.current.name == 'PokemonMainRoute') {
      return LeadingWidgetHelper.leadingWidgetHelper(
        icon: Icons.favorite_rounded,
        size: 28,
        text: '42',
      );
    } else {
      if (isFavorite != null) {
        return LeadingWidgetHelper.leadingWidgetHelper(
          icon: Icons.add_circle_rounded,
          size: 28,
          text: 'ADD TO FAVORITES',
        );
      } else {
        return LeadingWidgetHelper.leadingWidgetHelper(
          icon: Icons.remove_circle_rounded,
          size: 28,
          text: 'REMOVE FROM FAVORITES',
        );
      }
    }
  }
}
