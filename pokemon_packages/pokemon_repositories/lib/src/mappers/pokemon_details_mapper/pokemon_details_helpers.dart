import 'package:poke_gql_client/poke_gql_client.dart';
import 'package:pokemon_models/pokemon_models.dart';

class PokemonDetailsHelpers {
  static PokemonFormsModel pokemonForms(PokemonForms form) {
    return PokemonFormsModel(
      id: form.id ?? 0,
      name: form.name ?? '',
      formName: form.formName ?? '',
      genus:
          form.formdetails?.pokemonGenus?.pokemonspecies
              ?.map((e) => e.genus)
              .first ??
          '',
      types:
          form.formdetails?.pokemontypes
              ?.map((e) => e.type?.name ?? '')
              .toSet()
              .toList() ??
          [],
      sprite: form.formdetails?.pokemonsprites?.firstOrNull?.sprites ?? '',
    );
  }
}
