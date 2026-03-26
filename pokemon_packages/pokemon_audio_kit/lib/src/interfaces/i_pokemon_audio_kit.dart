
import 'package:flutter_soloud/flutter_soloud.dart';
import 'package:fpdart/fpdart.dart';
import 'package:pokemon_core/pokemon_core.dart';

// The audio service will also handle pokemon cries
// ignore: one_member_abstracts
abstract interface class IPokemonAudioKit {
  TaskEither<Failure, SoundHandle> getPokemonMainTheme(); 
}
