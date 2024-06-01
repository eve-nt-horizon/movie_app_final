import 'package:flutter/material.dart';
import 'package:movie/app/app.locator.dart';

import 'package:movie/constants.dart';
import 'package:movie/services/api_service.dart';

final _apiService = locator<ApiService>();

class GenreCard extends StatelessWidget {
  const GenreCard({super.key, required this.genre, this.onTapped});
  final String genre;
  final void Function()? onTapped;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
        stream: _apiService.genres.onChange,
        builder: (context, snapshot) {
          return GestureDetector(
            onTap: () {
              if (_apiService.genres.contains(genre)) {
                _apiService.genres.remove(genre);
              } else {
                _apiService.genres.add(genre);
                //For adding to search list
              }
            },
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(left: kDefaultPadding),
              padding: const EdgeInsets.symmetric(
                horizontal: kDefaultPadding,
                vertical: kDefaultPadding / 4,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black26),
                borderRadius: BorderRadius.circular(20),
                color: _apiService.genres.contains(genre)
                    ? Colors.purple
                    : Colors.white,
              ),
              child: Text(
                genre,
                style:
                    TextStyle(color: kTextColor.withOpacity(0.8), fontSize: 16),
              ),
            ),
          );
        });
  }
}
