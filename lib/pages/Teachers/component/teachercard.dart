import 'package:flutter/material.dart';
import 'package:tadris/Module/teachermodule.dart';
class _TeacherCard extends StatelessWidget {
  final Teacher teacher;

  const _TeacherCard({required this.teacher});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          textDirection: TextDirection.rtl,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Image with gender-based asset
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(teacher.IsFemale
                      ? 'assets/femaleteach-removebg-preview.png'
                      : 'assets/maleteach-removebg-preview.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    textDirection: TextDirection.rtl,
                    children: [
                      Text(
                        teacher.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 8),
                        child:
                            Icon(Icons.verified, color: Colors.blue, size: 18),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  // Subjects
                  Wrap(
                    spacing: 8,
                    children: teacher.subjects
                        .map((subject) => Chip(
                              label: Text(subject),
                              backgroundColor: Colors.blue[50],
                              labelStyle: const TextStyle(
                                fontSize: 12,
                                color: Colors.blue,
                              ),
                            ))
                        .toList(),
                  ),
                  const SizedBox(height: 8),
                  // Experience
                  Row(
                    textDirection: TextDirection.rtl,
                    children: [
                      Icon(Icons.work, color: Colors.grey[600], size: 16),
                      const SizedBox(width: 4),
                      Text('${teacher.experienceYears} years experience'),
                    ],
                  ),
                  const SizedBox(height: 8),
                  // Price and Location
                  Row(
                    textDirection: TextDirection.rtl,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${teacher.baseHourlyRate}/hour',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          color: _getLocationColor(teacher.locationType),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          _getLocationText(teacher.locationType),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Keep existing color and text methods
  Color _getLocationColor(String locationType) {
    switch (locationType) {
      case 'online':
        return Colors.green;
      case 'in-person':
        return Colors.orange;
      case 'both':
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }

  String _getLocationText(String locationType) {
    switch (locationType) {
      case 'online':
        return 'Online';
      case 'in-person':
        return 'In-Person';
      case 'both':
        return 'Hybrid';
      default:
        return 'Unknown';
    }
  }
}

