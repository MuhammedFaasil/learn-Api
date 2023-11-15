import 'package:flutter/material.dart';
import 'package:state_management_1/services/api_services.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('API Page')),
      body: FutureBuilder(
          future: ApiServices.getPost(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.data == null) {
              return TextButton(
                  onPressed: () {
                    ApiServices.getPost();
                  },
                  child:const Text('Retry'));
            }
            return ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.cyan,
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text(snapshot.data![index].userId.toString()),
                    ),
                    title: Text(
                      snapshot.data![index].title,
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(snapshot.data![index].body),
                  ),
                );
              },
            );
          }),
    );
  }
}
