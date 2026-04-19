import 'package:pokemon_features/src/pokemon_details/widgets/_barrel_pokemon_details.dart';

class PokemonDetailsCardWidget extends StatelessWidget {
  const PokemonDetailsCardWidget({
    required this.pokemonSprite,
    required this.pokemonTypes,
    required this.pokemonId,
    required this.pokemonName,
    required this.pokemonFlavorText,
    required this.pokemonGenus,
    super.key,
  });

  final String? pokemonSprite;
  final List<String>? pokemonTypes;
  final int? pokemonId;
  final String? pokemonName;
  final String? pokemonFlavorText;
  final String? pokemonGenus;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: const Color(0xFF1A1A1A),
          width: MediaQuery.sizeOf(context).width,
          height: 208,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              PokemonDetailsCardImageWidget(
                pokemonSprite: pokemonSprite ?? '',
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(bottom: 8, left: 24),
                  child: Column(
                    spacing: 8,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PokemonDetailsCardInfoWidget(
                        pokemonTypes: pokemonTypes ?? [],
                        pokemonId: pokemonId ?? 0,
                        pokemonName: pokemonName ?? '',
                      ),
                      PokemonDetailsCardFalvorTextWidget(
                        pokemonFlavorText: pokemonFlavorText ?? '',
                      ),
                      PokemonDetailsCardGenusWidget(
                        pokemonGenus: pokemonGenus ?? '',
                        pokemonTypes: pokemonTypes ?? [],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        height16,
        const PokemonDividerWidget(),
      ],
    );
    //
  }
}
