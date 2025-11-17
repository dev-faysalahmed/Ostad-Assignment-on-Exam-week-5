import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ostad_assignment_on_exam_week_5/model/student_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<StudentModel> _studentsList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Students List', style: TextStyle(fontWeight: FontWeight.bold),),
        backgroundColor: Colors.yellow,
        foregroundColor: Colors.black,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('students').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator(),);
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else if (snapshot.hasData) {
            _studentsList.clear();
            for (QueryDocumentSnapshot<Map<String, dynamic>> doc in snapshot
                .data!.docs) {
              _studentsList.add(StudentModel(
                  id: doc.id,
                  name: doc.get('name'),
                  rollNumber: doc.get('rollNumber'),
                course: doc.get('course')
              )
              );
            }

            return Padding(
              padding: const EdgeInsets.all(8),
              child: ListView.builder(
                itemCount: _studentsList.length,
                itemBuilder: (context, index) {
                  StudentModel student = _studentsList[index];
                  return Card(
                    color: Colors.yellow.shade50,
                    child: ListTile(
                      title: Text('Name: ${student.name}', style: TextStyle(fontWeight: FontWeight.bold),),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Roll: ${student.rollNumber}'),
                          Text('Course: ${student.course}'),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          }
          return SizedBox();
        }
      ),

    );
  }
}
