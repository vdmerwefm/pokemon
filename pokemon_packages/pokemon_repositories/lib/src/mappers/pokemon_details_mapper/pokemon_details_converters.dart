import 'package:poke_gql_client/poke_gql_client.dart';
import 'package:pokemon_models/pokemon_models.dart';
import 'package:pokemon_repositories/src/mappers/pokemon_details_mapper/pokemon_details_helpers.dart';

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
                              PokemonDetailsHelpers.pokemonForms(form),
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
                          ? pokemonFormList.add(PokemonDetailsHelpers.pokemonForms(form),)
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
