import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuto_app/features/joke/presentation/bloc/cubit/categories/categories_cubit.dart';
import 'package:tuto_app/features/joke/presentation/widgets/categories/categories_error_widget.dart';
import 'package:tuto_app/features/joke/presentation/widgets/categories/categories_loaded_widget.dart';

import '../../../../injection_container/injection_container.dart';
import 'joke_page.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: _buildBody(context),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        GestureDetector(
          onTap: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const JokePage())),
          child: const Text(
            "Aléatoire",
            style: TextStyle(fontSize: 18),
          ),
        ),
        BlocProvider(
          create: (_) => sl<CategoriesCubit>(),
          child: BlocBuilder<CategoriesCubit, CategoriesState>(
            builder: (context, state) {
              if (state.categoriesStatus == CategoriesStatus.empty) {
                context.read<CategoriesCubit>().requestMenu();
                return const CircularProgressIndicator();
              } else if (state.categoriesStatus == CategoriesStatus.loading) {
                return const CircularProgressIndicator();
              } else if (state.categoriesStatus == CategoriesStatus.loaded) {
                return CategoriesLoadedWidget(
                    categories: state.categories!.categories);
              } else {
                return CategoriesErrorWidget(
                  errorMsg: state.errorMsg ?? "Erreur",
                );
              }
            },
          ),
        ),
      ],
    ));
  }
}
