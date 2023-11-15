import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management_1/riverpod_main/api_future_provider.dart';
import 'package:state_management_1/services/api_services.dart';

class UserApi extends ConsumerWidget {
  const UserApi({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('User Details'),
      ),
      body: ref.watch(providersGetScope).when(
            data: (data) => ListView.builder(
              itemCount: data!.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(data[index].name),
                subtitle: Text(data[index].phone.toString()),
                trailing: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Scaffold(
                              appBar: AppBar(
                                title: const Text("User Information"),
                              ),
                              body: ListView.builder(
                                itemCount: data.length,
                                itemBuilder: (context, index) =>
                                    Text(data[index].website),
                              ),
                            ),
                          ));
                    },
                    child: Text('Posts')),
              ),
            ),
            error: (error, stackTrace) => Text('Somthing went wrong!'),
            loading: () => CircularProgressIndicator(),
          ),
    );
  }
}
