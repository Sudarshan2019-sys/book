// import 'dart:io';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:image_cropper/image_cropper.dart';
// import 'package:image_picker/image_picker.dart';

// class Upload extends StatefulWidget {
//   @override
//   _UploadState createState() => _UploadState();
// }

// class _UploadState extends State<Upload> {
//   File _image;

//   Future getImage() async {
//     File image = await ImagePicker.pickImage(source: ImageSource.camera);

//     setState(() {
//       _image = image;
//     });
//   }

//   Future<void> _cropImage() async{
//     File croppedFile = await ImageCropper.cropImage(
//       sourcePath: _image.path,
//       // aspectRatioPresets: [
//       //   CropAspectRatioPreset.square,
//       //   CropAspectRatioPreset.ratio3x2,
//       //   CropAspectRatioPreset.original,
//       //   CropAspectRatioPreset.ratio4x3,
//       //   CropAspectRatioPreset.ratio16x9
//       // ],
//       androidUiSettings: AndroidUiSettings(
//           toolbarTitle: 'Cropper',
//           toolbarColor: Colors.deepOrange,
//           toolbarWidgetColor: Colors.white,
//           initAspectRatio: CropAspectRatioPreset.original,
//           lockAspectRatio: false),
//       iosUiSettings: IOSUiSettings(
//         minimumAspectRatio: 1.0,
//       )
//     );

//     setState(() {
//      _image=croppedFile??_image;

//     });
//   }
//   void _clear(){
//     setState(()=>_image==null);
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       // appBar: AppBar(
//       //   title: Text('Upload your file'),
//       // ),
//       child:Column(
//         children: <Widget>[
//           Container(
//             child: Center(
//               child: _image == null
//                 ? Text('No image selected.')
//                 : Image.file(_image),
//             ),
//           ),
//           Row(
//             children: <Widget>[
//               FlatButton(
//                 child: Icon(Icons.crop,),
//                 onPressed: _cropImage,
//               ),
//               FlatButton(
//                 child: Icon(Icons.refresh,),
//                 onPressed: _clear,
//               ),
//             ],
//           ),
//           Uploader(file:_image),

//           FloatingActionButton(
//             onPressed: getImage,
//             tooltip: 'Pick Image',
//             child: Icon(Icons.add_a_photo),
//           )
//         ],
//       )
      
//     );
//   }
// }

// class Uploader extends StatefulWidget {
//   final File file;

//   Uploader({Key key,this.file}):super(key:key);
//   @override
//   _UploaderState createState() => _UploaderState();
// }

// class _UploaderState extends State<Uploader> {
//   final FirebaseStorage _storage=
//       FirebaseStorage(storageBucket: 'gs://book-d3e1a.appspot.com');

//   StorageUploadTask _uploadTask;

//   void _startUpload(){
//     String filePath='images/${DateTime.now()}.png';
//     setState(() {

//      _uploadTask=_storage.ref().child(filePath).putFile(widget.file) ;
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     if(_uploadTask!=null){
//       return StreamBuilder<StorageTaskEvent>(
//         stream: _uploadTask.events,
//         builder: (context, snapshot){
//           var event=snapshot?.data?.snapshot;
//           double progressPercet=event!=null
//           ?event.bytesTransferred/event.totalByteCount
//           :0;
//           return Column(
//             children: <Widget>[
//               if(_uploadTask.isComplete)
//               FlatButton(
//                 child: Icon(Icons.play_arrow),
//                 onPressed: _uploadTask.resume,
//               ),
//               if(_uploadTask.isPaused)
//               Text('Success'),
//               if(_uploadTask.isInProgress)
//               FlatButton(
//                 child: Icon(Icons.pause,),
//                 onPressed: _uploadTask.pause,
//               ),
//               LinearProgressIndicator(value: progressPercet,),
//               Text('${(progressPercet*100).toStringAsFixed(2)}%')
//             ],
//           );
//         },
//       );
//     }else{
//       return FlatButton.icon(
//         label: Text('Upload to Firebase'),
//         icon: Icon(Icons.cloud_upload),
//         onPressed: _startUpload,
//       );
//     }
//   }
// }
