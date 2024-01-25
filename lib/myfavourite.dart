import 'package:favouriteappwithprovider/provider/favourite_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyFavouriteScreen extends StatefulWidget {
  const MyFavouriteScreen({super.key});

  @override
  State<MyFavouriteScreen> createState() => _MyFavouriteScreenState();
}

class _MyFavouriteScreenState extends State<MyFavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    final favouriteProvider = Provider.of<FavouriteItemProvider>(context);
     return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        centerTitle: true,
        title: const Text('Your favourite lists'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: InkWell(
              onHover:(value) => Colors.black,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>MyFavouriteScreen()));
              },
              child: Icon(Icons.favorite_outlined)),
          ),
        ],
      ),
      body:  Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: favouriteProvider.selectedItem.length,
              itemBuilder: (context,index){
                return Consumer<FavouriteItemProvider>(builder: (context, value, child){
                  return ListTile(
                  onTap: () {
                    if (value.selectedItem.contains(index)) {
                      value.removeItem(index);
                    }else{
                       value.addItem(index);
                    }
                   
                  },
                  title: Text('Item' +index.toString()),
                  trailing:value.selectedItem.contains(index)? const Icon(Icons.favorite):const  Icon(Icons.favorite_border_outlined),
                );
                });
              }
              ),
          )
        ],

      ),
    );
  }
}