import 'dart:ffi';
import 'dart:io';
import 'dart:math';
import 'dart:ui';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image/image.dart' as img;

class Scanner {
  final ImagePicker _imagePicker = ImagePicker();
  final ImageCropper _imageCropper = ImageCropper();


  Future<List<String>?> pickImage(ImageSource source) async {
    final pickedFile = await _imagePicker.pickImage(source: source);
    if (pickedFile != null) {
      String? croppedImagePath = await _cropImage(pickedFile.path);
      if (croppedImagePath != null) {
        _preprocessImage(croppedImagePath);
        List<String> body = await _translateImage(croppedImagePath);
        return body;
      }
    }
    return null;
  }

  Future<String?> _cropImage(String imagePath) async {
    CroppedFile? croppedFile = await _imageCropper.cropImage(sourcePath: imagePath);
    if (croppedFile != null) {
      return croppedFile.path;
    }
    return null;
  }

  Future<String?> _preprocessImage(String imagePath) async {
    File imageFile = File(imagePath);
    var imageBytes = await imageFile.readAsBytes();
    img.Image? image = img.decodeImage(imageBytes);
    if (image != null) {
      img.Image grayScaleImage = img.grayscale(image);
      final String processedImagePath = imagePath.replaceAll('.jpg', '_processed.jpg');
      await File(processedImagePath).writeAsBytes(img.encodeJpg(grayScaleImage));
    }
    return '';
  }

  Future<List<String>> _translateImage(String imagePath) async {
    print('TRANSLATE IMAGE TRIGGERED!');
    final InputImage inputImage = InputImage.fromFilePath(imagePath);
    final TextRecognizer textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
    final RecognizedText recognizedText = await textRecognizer.processImage(inputImage);
    String text = recognizedText.text;
    List<String> body = [];
    print('------------------');
    for (TextBlock block in recognizedText.blocks) {
      final Rect rect = block.boundingBox;
      final List<Point<int>> cornerPoints = block.cornerPoints;
      final String text = block.text;
      final List<String> languages = block.recognizedLanguages;
      // print(text);
      body.add(text);
    }
    textRecognizer.close();
    return body;
  }



}
