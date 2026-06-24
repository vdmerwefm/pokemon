part of '../_barrel_shared_widgets.dart';

class PokemonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PokemonAppBar({required this.showSearch, super.key});

  final bool showSearch;

  @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      leadingWidth: 0,
      centerTitle: false,
      actionsPadding: const EdgeInsets.only(right: 18),
      actions: context.router.current.name != 'PokemonMainRoute'
          ? []
          : const [
              Center(
                child: Text(
                  'MODE:',
                  style: TextStyle(
                    color: Color(0xFFE5E5E5),
                    fontFamily: 'pokemon_font',
                    fontWeight: FontWeight.w900,
                    package: 'pokemon_ui_kit',
                  ),
                ),
              ),
              Center(
                child: Text(
                  ' ALL TYPES',
                  style: TextStyle(
                    color: Color(0xFFE5E5E5),
                    fontFamily: 'pokemon_font',
                    fontWeight: FontWeight.w900,
                    package: 'pokemon_ui_kit',
                  ),
                ),
              ),
            ],
      scrolledUnderElevation: 0, // Prevents elevation-based color shift
      title: context.router.current.name != 'PokemonMainRoute'
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
          : ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Image.asset(
                height: 40,
                width: 40,
                'lib/src/assets/images/types/logo.png',
                package: 'pokemon_ui_kit',
              ),
            ),
      bottom: AppBar(
        toolbarHeight: 48,
        backgroundColor: const Color(0xFFE93F6E),
        actionsPadding: const EdgeInsets.only(right: 13),
        leadingWidth: 250,
        leading: const PokemonLeadingWidget(),
        actions: [PokemonAppBarActions(showSearch: showSearch)],
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 112);
}
