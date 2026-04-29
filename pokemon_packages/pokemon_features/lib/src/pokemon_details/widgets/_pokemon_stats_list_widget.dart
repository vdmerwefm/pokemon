// ignore_for_file: lines_longer_than_80_chars, document_ignores

part of '_barrel_pokemon_details.dart';

class PokemonStatsListWidget extends StatelessWidget {
  const PokemonStatsListWidget({
    required this.pokemonStats,
    super.key,
  });

  final List<PokemonStatsModel>? pokemonStats;

  @override
  Widget build(BuildContext context) {
    if (pokemonStats != null) {
      return Column(
        children: [
          const HeaderWidget(headerText: 'Pokemon Stats'),
          height16,
          Column(
            spacing: 8,
            children: pokemonStats!.map((stat) {
              return Column(
                spacing: 8,
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 4),
                    alignment: Alignment.center,
                    width: double.infinity,
                    color: const Color(0xFFE5E5E5),
                    child: Text(
                      '${stat.statName.toUpperCase()} : ${stat.baseStat.toString().toUpperCase()}',
                      style: pokemonInfoStyle(
                        const Color(0xFF1A1A1A),
                        fontSize: 8,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                    width: double.infinity,
                    child: ClipRect(
                      child: CustomPaint(
                        painter: BarPainter(
                          baseColor: const Color(0xFF1A1A1A),
                          fillColor: const Color(0xFFE5E5E5),
                          blockWidth: 8,
                          stat: stat.baseStat.toDouble(),
                        ),
                      ),
                    ),
                  ),
                  const PokemonDividerWidget(
                    height: 16,
                  ),
                ],
              );
            }).toList(),
          ),
        ],
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
