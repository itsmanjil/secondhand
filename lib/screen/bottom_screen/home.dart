import 'package:secondhand/repositories/product_repositories.dart';
import 'package:secondhand/response/product_category.dart';
import 'package:flutter/material.dart';
import '../../response/get_product_response.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second hand shop'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 56, 56, 51),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/register.png'), fit: BoxFit.cover),
        ),
        child: SafeArea(
          child: FutureBuilder<ProductResponse?>(
            future: ProductRepository().getProducts(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.data != null) {
                  // ProductResponse productResponse = snapshot.data!;
                  List<ProductCategory> lstProductCategory =
                      snapshot.data!.data!;

                  return ListView.builder(
                    itemCount: snapshot.data!.data!.length,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        height: 80,
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 60,
                            backgroundImage: NetworkImage(
                              lstProductCategory[index]
                                  .image!
                                  .replaceAll('localhost', '10.0.2.2'),
                            ),
                          ),
                          title: Text(lstProductCategory[index].name!),
                          subtitle:
                              Text(snapshot.data!.data![index].description!),
                          trailing: IconButton(
                            icon: const Icon(Icons.expand_circle_down_rounded),
                            onPressed: () {},
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: Text("No data"),
                  );
                }
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              } else {
                return const Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Widget displayProducts(ProductCategory productCategory) {
    return Card(
      child: Stack(
        children: [
          SizedBox(
            height: 200,
            width: double.infinity,
            child: Image.network(
              productCategory.image!,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
