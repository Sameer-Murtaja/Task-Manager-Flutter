


class AddNewCategory extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Category"),
        backgroundColor: Color(0xFF0059B3),
        actions: [],
      ),
      backgroundColor: Color.fromRGBO(247, 247, 247, 10),
      body: ListView(
        children: [
          Container(
            width: 328,
            height: 68,
            margin: EdgeInsets.only(top: 24, left: 16, right: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
            ),
            padding: EdgeInsets.all(8),
            child: const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(borderSide: BorderSide.none),
                hintText: 'Category Name',
              ),
            ),
          ),
          
          
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF0059B3),
                  minimumSize: Size(double.infinity, 56),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Text('Add Category'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

