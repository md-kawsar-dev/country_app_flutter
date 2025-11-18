import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/country_bloc.dart';
import '../blocs/country_event.dart';
import '../repositories/country_repository.dart';
import 'searchable_country_list.dart';

class CountryListScreen extends StatelessWidget {
  const CountryListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          CountryBloc(countryRepository: CountryRepository())
            ..add(const FetchCountries()),
      child: Builder(
        builder: (context) {
          return Scaffold(
            backgroundColor: Colors.grey[50],
            appBar: AppBar(
              title: const Text(
                "Countries of the World",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: () {
                    context.read<CountryBloc>().add(const RefreshCountries());
                  },
                  icon: const Icon(Icons.refresh, color: Colors.white),
                ),
              ],
              backgroundColor: Colors.blue[600],
            ),
            body: const SafeArea(child: SearchableCountryList()),
          );
        },
      ),
    );
  }
}
