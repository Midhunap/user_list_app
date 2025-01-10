import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_list/view/user_detailed_page.dart';
import '../controller/user_controller.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<UserController>().fetchUsers();
    });
  }

  var searchCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150),
        child: Column(
          children: [
            AppBar(
              backgroundColor: Colors.white,
              surfaceTintColor: Colors.white,
              title: Text('Employees',style: GoogleFonts.raleway(fontWeight: FontWeight.w500),),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Material(
                elevation: 5,
                shadowColor: Colors.blueGrey.shade50,
                child: TextField(
                  controller: searchCon,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10) ,
                    hintText: 'Search name and email',
                    hintStyle: const TextStyle(color: Colors.grey,fontSize: 14),
                    filled: true,
                    fillColor: Colors.blueGrey.shade50,
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                  onChanged: (search){
                    Provider.of<UserController>(context, listen: false).filterUsers(search);
                  },

                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: Consumer<UserController>(
        builder: (context, userController, child) {
          if (userController.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (userController.error.isNotEmpty) {
            return Center(child: Text(userController.error));
          }
          return userController.filteredUsers.isEmpty?
          Center(child: Text('No search results')):
          ListView.builder(
            itemCount: userController.filteredUsers.length,
            itemBuilder: (context, index) {
              final user = userController.filteredUsers[index];
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: roundedDecoration(),
                  child: ListTile(
                    tileColor: Colors.white,
                    leading: CircleAvatar(
                      radius: 26,
                      backgroundColor: Colors.grey,
                      child: CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.person,color: Colors.grey,size: 30,),
                      ),
                    ),
                    title: Text(user.name.toString(),style: GoogleFonts.raleway(fontWeight: FontWeight.w500),),
                    subtitle: Text(user.email.toString(),style: GoogleFonts.raleway(fontWeight: FontWeight.w500,color: Colors.orange),),
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserDetailedPage(users: user,),
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
