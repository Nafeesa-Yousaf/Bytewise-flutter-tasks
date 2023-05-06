import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Picture Sharing App',
      theme: ThemeData(
        primaryColor: Colors.blue[900],
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> _imageList = [];

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().getImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _imageList.add(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Picture Sharing App'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await _pickImage(ImageSource.gallery);
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue[900], 

      ),
      body: Container(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_imageList.isEmpty) 
              Text(
                'No Image Selected',
                style: TextStyle(fontSize: 24),textAlign: TextAlign.center,
              ),
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.all(8),
                itemCount: _imageList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemBuilder: (context, index) {
                  return Image.network(_imageList[index]); 
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
