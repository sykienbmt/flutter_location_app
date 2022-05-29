import 'package:flutter/material.dart';
import 'package:location_app/providers/greatPlaces.dart';
import 'package:location_app/screens/addPlaceScreen/placeAddScreen.dart';
import 'package:provider/provider.dart';

class PlacesScreen extends StatelessWidget {
  const PlacesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Place'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaceScreen.routerName);
            },
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<GreatPlaces>(context, listen: false)
            .fetchAndSetPlaces(),
        builder: (ctx, snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Consumer<GreatPlaces>(
                    child: const Center(
                      child: Text("You got no places yet!"),
                    ),
                    builder: (ctx, greatPlaces, ch) => greatPlaces.items.isEmpty
                        ? ch!
                        : ListView.builder(
                            itemBuilder: (ctx, i) => ListTile(
                              leading: CircleAvatar(
                                backgroundImage:
                                    FileImage(greatPlaces.items[i].image),
                              ),
                              title: Text(greatPlaces.items[i].title),
                              onTap: () {},
                            ),
                            itemCount: greatPlaces.items.length,
                          ),
                  ),
      ),
    );
  }
}
