// ignore_for_file: avoid_print, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('ABOUT', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20,),
            const Text('About Us', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
            const SizedBox(height: 20,),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  shape: BoxShape.circle
                ),
                child:const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.person, size: 80,),
                )
              ),
            ),
            const SizedBox(height: 20,),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Text('Application Info', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                ),
              ],
            ),
        
            const SizedBox(height: 10,),
        
            const Padding(
              padding: EdgeInsets.only(left: 30, right: 20),
              child: Text('Khaliq home is an app that aims to improve energy efficency and to control your homes electrical appliances remotely '
              ),
            ),
        
            const SizedBox(height: 20,),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Text('Company Info', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                ),
              ],
            ),
        
            const SizedBox(height: 10,),
        
            const Padding(
              padding: EdgeInsets.only(left: 30, right: 20),
              child: Text('Khaliq productions is the company behind many ingenious and practical mobile applications, including Khaliq Home '
              ),
            ),
        
            const SizedBox(height: 20,),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                  Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Text('Contact Info', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                ),
                
              ],
            ),
        
            const SizedBox(height: 10,),
        
              Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Text('Email: AbdulKhaliq4606@gmail.com', style: TextStyle(fontSize: 15,),),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: ElevatedButton(
                    onPressed: () async {
                      final Uri emailLaunchUri = Uri(
                        scheme: 'mailto',
                        path: "AbdulKhaliq4606@gmail.com",
                        queryParameters: {
                          'subject': 'Your Subject Here',
                          'body': 'Your Email Body Here',
                        },
                      );
                  
                      if(await canLaunch(emailLaunchUri.toString())){
                        await launch(emailLaunchUri.toString());
                      }else{
                        print('Cannot launch email');
                      }
                      
                    }, 
                      style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text('Email', style: TextStyle(fontSize: 15, color: Theme.of(context).colorScheme.secondary)),
                  ),
                ),
              ],
            ),
        
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 30),
                      child: Text('Contact No: +65 8788-4613', style: TextStyle(fontSize: 15,),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: ElevatedButton(
                      onPressed: () async {
                      final Uri phoneLaunchUri = Uri(
                        scheme: 'tel',
                        path: "+6587884613",
                      );
                      
                      if(await canLaunch(phoneLaunchUri.toString())){
                        await launch(phoneLaunchUri.toString());
                      }else{
                        print('Cannot launch phone');
                      }
                      
                        }, 
                      style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                      child: Text(
                        'Call',
                        style: TextStyle(fontSize: 15, color: Theme.of(context).colorScheme.secondary ),
                      ),
                      ),
                    ),
                  ],
                ),

            const SizedBox(height: 20,),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Text('Developer Info', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                ),
              ],
            ),
        
            const SizedBox(height: 10,),
        
            const Padding(
              padding: EdgeInsets.only(left: 30, right: 20),
              child: Text('The brilliant developer behind this master-piece of an app is Khaliq, a senior developer of over 10 years at Khaliq productions '
              ),
            ),
        
            const SizedBox(height: 20,),

          ],
        ),
      ),
    );
  }
}
