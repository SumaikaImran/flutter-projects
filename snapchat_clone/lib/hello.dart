// // ...existing code...

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     backgroundColor: Colors.black,
//     body: Stack(
//       children: [
//         Center(
//           child: widget.isVideo
//               ? (_videoController.value.isInitialized
//                     ? AspectRatio(
//                         aspectRatio: _videoController.value.aspectRatio,
//                         child: VideoPlayer(_videoController),
//                       )
//                     : const CircularProgressIndicator())
//               : Image.file(File(widget.filePath)),
//         ),
//         // Top left close button
//         Positioned(
//           top: 40,
//           left: 20,
//           child: GestureDetector(
//             onTap: () => Navigator.pop(context),
//             child: Container(
//               padding: const EdgeInsets.all(8),
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: Colors.black.withOpacity(0.5),
//               ),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Icon(Icons.close, color: Colors.white, size: 30),
//                   Text(
//                     "Close",
//                     style: TextStyle(color: Colors.white, fontSize: 12),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//         // Top right Snapchat-style options
//         Positioned(
//           top: 40,
//           right: 20,
//           child: Column(
//             children: [
//               // Text option
//               IconButton(
//                 icon: Icon(Icons.text_fields, color: Colors.white, size: 28),
//                 onPressed: () {
//                   // TODO: Implement add text overlay
//                 },
//                 tooltip: "Add Text",
//               ),
//               SizedBox(height: 18),
//               // Draw option
//               IconButton(
//                 icon: Icon(Icons.edit, color: Colors.white, size: 28),
//                 onPressed: () {
//                   // TODO: Implement draw on image
//                 },
//                 tooltip: "Draw",
//               ),
//               SizedBox(height: 18),
//               // Crop option
//               IconButton(
//                 icon: Icon(Icons.crop, color: Colors.white, size: 28),
//                 onPressed: () {
//                   // TODO: Implement crop functionality
//                 },
//                 tooltip: "Crop",
//               ),
//               // Add more options as needed
//             ],
//           ),
//         ),
//         // Bottom right save button
//         Positioned(
//           bottom: 40,
//           right: 20,
//           child: GestureDetector(
//             onTap: saveToGallery,
//             child: Container(
//               padding: const EdgeInsets.all(12),
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: Colors.black.withOpacity(0.5),
//               ),
//               child: Column(
//                 children: [
//                   Icon(Icons.save_alt, color: Colors.white, size: 30),
//                   Text(
//                     "Save",
//                     style: TextStyle(color: Colors.white, fontSize: 12),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ],
//     ),
//   );
// }
// // ...existing code...
