import 'package:pokemon_features/src/pokemon_details/widgets/_barrel_pokemon_details.dart';

class PokemonInfoTileWidget extends StatelessWidget {
  const PokemonInfoTileWidget({
    required this.infoTitle,
    required this.infoTitleColor,
    required this.infoValue,
    required this.infoValueColor,
    required this.infoFlavor,
    required this.infoFlavorColor,
    required this.tileColor,
    super.key,
    this.abilities,
  });

  final String infoTitle;
  final Color infoTitleColor;
  final String infoValue;
  final List<String>? abilities;
  final Color infoValueColor;
  final String infoFlavor;
  final Color infoFlavorColor;
  final Color tileColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(4),
        color: tileColor,
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                infoTitle.toUpperCase(),
                style: pokemonInfoStyle(
                  infoTitleColor,
                  fontSize: 10,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              height4,
              if (abilities != null)
                Column(
                  spacing: 2,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: abilities!
                      .map(
                        (ability) => Text(
                          ability.toUpperCase(),
                          style: pokemonInfoStyle(
                            infoValueColor,
                            fontSize: 6,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                      .toList(),
                )
              else
                Text(
                  infoValue.toUpperCase(),
                  style: pokemonInfoStyle(
                    infoValueColor,
                    fontSize: 6,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              height4,
              if (abilities != null)
                const SizedBox.shrink()
              else
                Text(
                  infoFlavor,
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: infoFlavorColor,
                    fontSize: 6,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
