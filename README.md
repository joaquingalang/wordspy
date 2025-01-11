# 🧩 WordSpy 🕵️
WordSpy is a mobile application developed with Dart and Flutter that solves scanned word search puzzle images and solves them automatically after being given a list of words to be found. 

## How To Use 🔍
**Step 1:** After opening WordSpy, you should land in the Home Screen.
<br>
<img height="250" src="https://github.com/user-attachments/assets/77f93094-2108-46a8-945e-350d103a1384">
<br>
**Step 2:** Next, click the camera button and select an image to scan either by snapping an image with the **Camera** or choosing from the **Gallery**
<br>
<img height="250" src="https://github.com/user-attachments/assets/5593a905-1ae7-4c92-b194-4a37fd52b71f">
<br>
**Step 3:** Crop the image so that only the word search puzzle is included. Additional characters that are not part of the puzzle may cause the puzzle the render incorrectly. 
<br>
<img height="250" src="https://github.com/user-attachments/assets/0c797d31-612b-4887-adee-80fe9fd274ce">
<br>
**Step 4:** After the image is processed, the app redirects you to the solver screen.
<br>
<img height="250" src="https://github.com/user-attachments/assets/c58fe286-7e8b-4537-852a-3ddb7bf962df">
<br>
**Step 5:** Add a word to search.
<br>
<img height="250" src="https://github.com/user-attachments/assets/3c3d2124-1273-492e-b562-e6f68049ee51">
<br>
**Step 5:** WordSpy scans the grid and highlights the word if found.
<br>
<img height="250" src="https://github.com/user-attachments/assets/48f3dbb4-89fc-4032-94a2-3ceaf29d7db9">
<br>
**Step 4:** Add more words!
<br>
<img height="250" src="https://github.com/user-attachments/assets/0c9a0f6f-b48c-418f-b9f0-8f45d268ddd1">
<br>

## Technologies Used 🛠️
As mentioned above, the mobile application was constructed with **Dart** and **Flutter**. External Flutter packages that involved image selection, image cropping, and text recognition were employed to implement the OCR scanning features.

Flutter Packages from [**pub.dev**](https://pub.dev/):
- [image_picker](https://pub.dev/packages/image_picker)
- [image_cropper](https://pub.dev/packages/image_cropper)
- [google_mlkit_text_recognition](https://pub.dev/packages/google_mlkit_text_recognition)

## Future Improvements 🌱
The WordSpy project was developed with the intention of sharpening my proficiency Flutter libraries from [pub.dev](https://pub.dev/) as well as to train my critical thinking skills during the process of creating the algorithm used to scan word search puzzles and highlight matches. That being said, there were unexpected issues that proved to be quite a challenge to address. 

I theorize that the [google_mlkit_text_recognition](https://pub.dev/packages/google_mlkit_text_recognition) was designed to efficiently recognize words. The flutter package continues to struggle scanning the letters present in word search puzzles. It often excludes one or two letters from the puzzle or hallucinates and adds new letters that were not in the puzzle in the first place. This causes an altered version of the puzzle to render instead. 

I've explored other OCR scanner packages but a majority of them have underperformed, making the results worse. In the future, I may explore ways to preprocess to address this issue. Increasing contrast, converting to grayscale, and reducing noise may help [google_mlkit_text_recognition](https://pub.dev/packages/google_mlkit_text_recognition) recognize the letters better.
