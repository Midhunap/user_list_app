import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_list/model/user_model.dart';

import '../utils/utils.dart';



class UserDetailedPage extends StatelessWidget {
  UserDetailedPage({super.key,required this.users});

  User users;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios)),
        title: Text('Employee details',style: GoogleFonts.raleway(fontWeight: FontWeight.w500),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: roundedDecoration(),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.grey,
                        child: CircleAvatar(
                          radius: 29,
                          backgroundColor: Colors.white,
                          child: Icon(Icons.person,color: Colors.grey,size: 30,),
                        ),
                      ),
                      SizedBox(width: 20,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(users.name!.toUpperCase(), style: GoogleFonts.raleway(fontWeight: FontWeight.w500,fontSize: 18),),
                          Text(users.username.toString(), style: GoogleFonts.raleway(fontWeight: FontWeight.w500,fontSize: 15),),
                          Text(users.email.toString(), style: GoogleFonts.raleway(fontWeight: FontWeight.w500,fontSize: 15,color: Colors.orange),)

                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Text('Address',style: GoogleFonts.raleway(fontWeight: FontWeight.w600,fontSize: 18),),
              SizedBox(height: 15,),
              Container(
                decoration: roundedDecoration(),
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Street : ${users.address!.street.toString()}', style: GoogleFonts.raleway(fontWeight: FontWeight.w500,fontSize: 16),),
                      Text('Suite : ${users.address!.suite.toString()}', style: GoogleFonts.raleway(fontWeight: FontWeight.w500,fontSize: 16),),
                      Text('City : ${users.address!.city.toString()}', style: GoogleFonts.raleway(fontWeight: FontWeight.w500,fontSize: 16),),
                      Text('Zipcode : ${users.address!.zipcode.toString()}', style: GoogleFonts.raleway(fontWeight: FontWeight.w500,fontSize: 16),),

                    ],
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Text('Contact',style: GoogleFonts.raleway(fontWeight: FontWeight.w600,fontSize: 18),),
              SizedBox(height: 15,),
              Container(
                decoration: roundedDecoration(),
                child: ListTile(
                  tileColor: Colors.white,
                  title:Text(users.phone.toString(), style: GoogleFonts.raleway(fontWeight: FontWeight.w500,fontSize: 18),),
                  subtitle: Text('Phone', style: GoogleFonts.raleway(fontWeight: FontWeight.w500,fontSize: 15,color: Colors.orange),),
                  trailing: IconButton(onPressed: (){}, icon: Icon(Icons.phone,size: 30,)),

                ),
              ),
              SizedBox(height: 10,),
              Container(
                decoration: roundedDecoration(),
                child: ListTile(
                  tileColor: Colors.white,
                  title:Text(users.website.toString(), style: GoogleFonts.raleway(fontWeight: FontWeight.w500,fontSize: 18),),
                  subtitle: Text('Website', style: GoogleFonts.raleway(fontWeight: FontWeight.w500,fontSize: 15,color: Colors.orange),),
                  trailing: IconButton(onPressed: (){}, icon: Icon(Icons.travel_explore,size: 30,)),

                ),
              ),
              SizedBox(height: 15,),
              Text('Company Details',style: GoogleFonts.raleway(fontWeight: FontWeight.w600,fontSize: 18),),
              SizedBox(height: 15,),
              Container(
                decoration: roundedDecoration(),
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${users.company!.name.toString()}', style: GoogleFonts.raleway(fontWeight: FontWeight.w500,fontSize: 16),),
                      Text('${users.company!.bs.toString()}', style: GoogleFonts.raleway(fontWeight: FontWeight.w500,fontSize: 16),),
                      Text('${users.company!.catchPhrase.toString()}', style: GoogleFonts.raleway(fontWeight: FontWeight.w500,fontSize: 16),),

                    ],
                  ),
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
