import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poke_gql_client/src/models/gql_pokemon_details_dto/formdetails.dart';

part 'pokemonforms.freezed.dart';
part 'pokemonforms.g.dart';

@freezed
class PokemonForms with _$PokemonForms {
  factory PokemonForms({
    int? id,
    String? name,
    @JsonKey(name: 'form_name') String? formName,
    Formdetails? formdetails,
  }) = _PokemonForms;

  factory PokemonForms.fromJson(Map<String, dynamic> json) =>
      _$PokemonFormsFromJson(json);
}
