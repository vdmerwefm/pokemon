part of '../presentation/page/pokemon_details_page.dart';

class PokemonInfoTile extends StatelessWidget {
  const PokemonInfoTile({
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
        padding: const EdgeInsets.all(8),
        color: tileColor,
        child: SizedBox.fromSize(
          size: const Size(double.infinity, 40),
          child: Column(
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
              Text(
                infoValue.toUpperCase(),
                style: pokemonInfoStyle(
                  infoValueColor,
                  fontSize: 8,
                ),
                overflow: TextOverflow.ellipsis,
              ),
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
