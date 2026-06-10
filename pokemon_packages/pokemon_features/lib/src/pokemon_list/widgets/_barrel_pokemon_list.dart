import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_core/pokemon_core.dart';
import 'package:pokemon_features/pokemon_features.dart' hide initMicroPackage;
import 'package:pokemon_features/src/pokemon_list/presentation/bloc/pokemon_list_bloc.dart';
import 'package:pokemon_features/src/shared/widgets/_barrel_shared_widgets.dart';
import 'package:pokemon_ui_kit/pokemon_ui_kit.dart';
import 'package:skeletonizer/skeletonizer.dart';

part '../presentation/page/pokemon_list_page.dart';
part '_list_skeleton_loader_widget.dart';
part '_load_more_button.dart';
part '_type_badges.dart';
