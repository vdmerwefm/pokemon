import 'package:poke_gql_client/poke_gql_client.dart';
import 'package:pokemon_models/pokemon_models.dart';

class Converters {
  static List<PokemonFormsModel>? convertToEvolutionsModel(
    Pokemonspeciesnames? evolutionsData,
  ) {
    final pokemonEvolutionList = <PokemonFormsModel>[];
    evolutionsData?.pokemonspecies
        ?.expand(
          (pokemons) =>
              pokemons.pokemons?.expand(
                (evolution) =>
                    evolution.pokemonforms?.map(
                      (form) => form.formName!.isEmpty
                          ? pokemonEvolutionList.add(
                              PokemonFormsModel(
                                id: form.id ?? 0,
                                name: form.name ?? '',
                                formName: form.formName ?? '',
                                genus:
                                    form
                                        .formdetails
                                        ?.pokemonGenus
                                        ?.pokemonspecies
                                        ?.map((e) => e.genus)
                                        .first ??
                                    '',
                                types:
                                    form.formdetails?.pokemontypes
                                        ?.map((e) => e.type?.name ?? '')
                                        .toSet()
                                        .toList() ??
                                    [],
                                sprite:
                                    (form
                                                .formdetails
                                                ?.pokemonsprites
                                                ?.firstOrNull
                                                ?.sprites
                                                ?.other?['official-artwork']
                                            as Map<
                                              String,
                                              dynamic
                                            >?)?['front_default']
                                        as String? ??
                                    '',
                              ),
                            )
                          : PokemonFormsModel.empty(),
                    ) ??
                    [],
              ) ??
              [],
        )
        .toList();
    return pokemonEvolutionList;
  }

  static List<PokemonFormsModel>? convertToFormsModel(
    Pokemonspeciesnames? evolutionsData,
  ) {
    final pokemonFormList = <PokemonFormsModel>[];
    evolutionsData?.pokemonspecies
        ?.expand(
          (pokemons) =>
              pokemons.pokemons?.expand(
                (evolution) =>
                    evolution.pokemonforms?.map(
                      (form) => form.formName!.isNotEmpty
                          ? pokemonFormList.add(
                              PokemonFormsModel(
                                id: form.id ?? 0,
                                name: form.name ?? '',
                                formName: form.formName ?? '',
                                genus:
                                    form
                                        .formdetails
                                        ?.pokemonGenus
                                        ?.pokemonspecies
                                        ?.map((e) => e.genus)
                                        .first ??
                                    '',
                                types:
                                    form.formdetails?.pokemontypes
                                        ?.map((e) => e.type?.name ?? '')
                                        .toSet()
                                        .toList() ??
                                    [],
                                sprite:
                                    (form
                                                .formdetails
                                                ?.pokemonsprites
                                                ?.firstOrNull
                                                ?.sprites
                                                ?.other?['official-artwork']
                                            as Map<
                                              String,
                                              dynamic
                                            >?)?['front_default']
                                        as String? ??
                                    '',
                              ),
                            )
                          : PokemonFormsModel.empty(),
                    ) ??
                    [],
              ) ??
              [],
        )
        .toList();
    return pokemonFormList;
  }
}
