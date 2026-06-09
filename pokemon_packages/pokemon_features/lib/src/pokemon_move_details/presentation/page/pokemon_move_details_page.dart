import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_core/pokemon_core.dart';
import 'package:pokemon_features/pokemon_features.dart';
import 'package:pokemon_features/src/pokemon_move_details/presentation/bloc/pokemon_move_details_bloc.dart';
import 'package:pokemon_features/src/shared/widgets/_barrel_shared_widgets.dart';

@RoutePage()
class PokemonMoveDetailsPage extends StatelessWidget {
  const PokemonMoveDetailsPage({required this.name, super.key});

  final String name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 0,
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 4, right: 4),
                  child: Text(
                    'Trainer profile',
                    style: TextStyle(
                      color: Color(0xFFE93F6E),
                      fontFamily: 'pokemon_font',
                      fontWeight: FontWeight.w900,
                      package: 'pokemon_ui_kit',
                    ),
                  ),
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(4),
                      child: Container(
                        height: 36,
                        width: 36,
                        color: const Color(0xFFE5E5E5),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(10),
                      child: const Icon(
                        Icons.account_box,
                        size: 50,

                        color: Color(0xFFE93F6E),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
        scrolledUnderElevation: 0, // Prevents elevation-based color shift
        title: context.router.current.path != 'pokemon-list-route'
            ? GestureDetector(
                onTap: () async {
                  context.read<PokemonAudioBloc>().add(
                    const PokemonAudioEvents.onPlaySelectBite(),
                  );
                  await context.router.maybePop();
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                  size: 28,
                  color: Color(0xFFE93F6E),
                ),
              )
            : GestureDetector(
                onTap: () {
                  context.read<PokemonAudioBloc>().add(
                    const PokemonAudioEvents.onPlaySelectBite(),
                  );
                  context.read<PokemonAudioBloc>().add(
                    const PokemonAudioEvents.onTogglePokemonThemeMusic(),
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Image.asset(
                    height: 40,
                    width: 40,
                    'lib/src/assets/images/types/logo.png',
                    package: 'pokemon_ui_kit',
                  ),
                ),
              ),
        bottom: PreferredSize(
          preferredSize: const Size(8, 8),
          child: CustomPaint(
            painter: AppBarBottomStroke(
              color: const Color(0xFFE93F6E),
              width: 3,
            ),
            child: SizedBox(
              width: MediaQuery.sizeOf(context).width,
            ),
          ),
        ),
      ),
      body: BlocProvider(
        create: (context) => sl<PokemonMoveDetailsBloc>()
          ..add(PokemonMoveDetailsEvents.onGetPokemonMoveDetails(name: name)),
        child: BlocBuilder<PokemonMoveDetailsBloc, PokemonMoveDetailsState>(
          builder: (context, state) {
            return Text(
              state.pokemonMoveDetails.toString(),
              style: const TextStyle(color: Colors.white),
            );
          },
        ),
      ),
    );
  }
}
