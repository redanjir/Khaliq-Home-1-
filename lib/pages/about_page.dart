import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

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
        
             const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Text('Email: AbdulKhaliq4606@gmail.com', style: TextStyle(fontSize: 15,),),
                ),
              ],
            ),
        
            const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 30),
                      child: Text('Contact No: +65 8788-4613', style: TextStyle(fontSize: 15,),),
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