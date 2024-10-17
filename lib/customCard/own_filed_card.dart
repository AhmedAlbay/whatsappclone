import 'package:flutter/material.dart';
class OwnFiledCard extends StatelessWidget {
  const OwnFiledCard({
    Key? key,
    required this.path,
    required this.message,
    required this.time,
  }) : super(key: key);

  final String path;
  final String message;
  final String time;

  @override
  Widget build(BuildContext context) {

    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        width: MediaQuery.of(context).size.width / 1.8,
        height: MediaQuery.of(context).size.height / 2.3,
        decoration: BoxDecoration(
       
          color: Colors.green[300],
        ),
        child: Card(
          margin: const EdgeInsets.all(3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ClipRRect(
                 
                  child:
                   Image.network(
                          "http://192.168.1.4:5000/uploads/$path",
                          fit: BoxFit.cover,
                          width: double.infinity,
                          errorBuilder: (context, error, stackTrace) => const Center(
                            child: Text('Image not available'),
                          ),
                        ),
                ),
              ),
              message.isNotEmpty
                  ? Container(
                    color:  Colors.green[300],
                    child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              message,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              time,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                  )
                  : Container(
                    
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
