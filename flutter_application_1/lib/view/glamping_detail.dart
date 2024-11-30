import 'package:flutter/material.dart';

class GlampingDetailPage extends StatefulWidget {
  final String title;
  final String address;
  final String imageUrl;

  const GlampingDetailPage({
    Key? key,
    required this.title,
    required this.address,
    required this.imageUrl,
  }) : super(key: key);

  @override
  _GlampingDetailPageState createState() => _GlampingDetailPageState();
}

class _GlampingDetailPageState extends State<GlampingDetailPage> {
  DateTime selectedDate = DateTime.now();
  int adults = 1;
  int children = 0;
  int rooms = 1;

  // Fungsi untuk menampilkan date picker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2024),
      lastDate: DateTime(2025),
    );

    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  // Fungsi untuk menambah atau mengurangi jumlah
  void _updateAdults(int delta) {
    setState(() {
      adults = (adults + delta).clamp(1, 10); // Mengatur agar nilai tetap dalam rentang 1-10
    });
  }

  void _updateChildren(int delta) {
    setState(() {
      children = (children + delta).clamp(0, 10); // Mengatur agar nilai tetap dalam rentang 0-10
    });
  }

  void _updateRooms(int delta) {
    setState(() {
      rooms = (rooms + delta).clamp(1, 5); // Mengatur agar nilai tetap dalam rentang 1-5
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFACE1AF), // Background warna ACE1AF
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Gambar utama
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  widget.imageUrl,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 10),
              // Alamat
              Text(
                widget.address,
                style: const TextStyle(fontSize: 14, color: Colors.black54),
              ),
              const SizedBox(height: 20),
              // Pemilihan Tanggal
              ListTile(
                title: const Text('Select Date'),
                subtitle: Text("${selectedDate.toLocal()}".split(' ')[0]),
                trailing: const Icon(Icons.calendar_today),
                onTap: () => _selectDate(context),
              ),
              const SizedBox(height: 20),
              // Pemilihan jumlah
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildCounter("Adults", adults, _updateAdults),
                  _buildCounter("Children", children, _updateChildren),
                  _buildCounter("Room", rooms, _updateRooms),
                ],
              ),
              const SizedBox(height: 20),
              // Fasilitas
              const Text(
                "Fasilitas",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.tv,
                      size: 30,
                      color: Colors.black,
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              // Lokasi
              const Text(
                "Location",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[300],
                ),
                child: const Center(
                  child: Text("Map Placeholder"),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                widget.address,
                style: const TextStyle(fontSize: 14, color: Colors.black54),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.black,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Rp. 200.000",
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Aksi ketika tombol "Book Now" ditekan
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              ),
              child: const Text(
                "Book Now",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Fungsi untuk membangun counter (Adults, Children, Room)
  Widget _buildCounter(String label, int value, Function(int) updateValue) {
    return Column(
      children: [
        Text(label),
        Row(
          children: [
            IconButton(
              onPressed: () {
                updateValue(-1); // Mengurangi jumlah
              },
              icon: const Icon(Icons.remove),
            ),
            Text("$value"), // Menampilkan nilai saat ini
            IconButton(
              onPressed: () {
                updateValue(1); // Menambah jumlah
              },
              icon: const Icon(Icons.add),
            ),
          ],
        ),
      ],
    );
  }
}
