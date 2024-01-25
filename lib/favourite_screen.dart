import 'package:favouriteappwithprovider/myfavourite.dart';
import 'package:favouriteappwithprovider/provider/favourite_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {

  List<int> selectedItem = [];
  @override
  Widget build(BuildContext context) {
   // final favouriteProvider = Provider.of<FavouriteItemProvider>(context);
   print('build');
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
        title: const Text('Select Favourite Items'),
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
              itemCount: 100,
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