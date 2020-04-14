# Folio App
[![Built with Flutter](https://img.shields.io/badge/Built%20with-flutter-blue?style=plastic)](https://flutter.dev/)
[![Last commits](https://img.shields.io/github/last-commit/dscbvppune/dsc?style=plastic)](https://github.com/dscbvppune/folio-app/commits/master/)
[![LICENSE](https://img.shields.io/badge/License-MIT?style=plastic)](https://github.com/dscbvppune/folio-app/blob/master/LICENSE)

## Overview
This project aims at making websites easier to manage. We at DSC BVP Pune noticed that many students or professionals either don't have a website or face difficulty maintaining one. We came up with a solution to make it accesssible for everyone to be able to manage and build a website with the help of a mobile app. 

## Features

| Feature                 | Description                                                                                |
| ----------------------- | ------------------------------------------------------------------------------------------ |
| **Built using Flutter** | The App is built exclusively in Flutter, while the adjoining website is built using Vue.js |
| **Portability**         | This Web-App can be used as a template by ant student or professional                      |
| **User Experience**     | User-friendly and reliable, as well as handy and easy to use                               |
| **Powered by Firebase** | Cloud Firestore of Firebase provides solutions for storage issues                          |

## Getting Started

1. [Fork](https://github.com/dscbvppune/folio-app/fork) our repository and clone it locally.
2. Open the repo in [VSCode](https://code.visualstudio.com/) or [Android Studio](https://developer.android.com/studio).
3. Open [Firebase Console](https://console.firebase.google.com/) and create a new project.
4. Connect your mobile-app project, either Android or iOS, with Firebase.
5. For Android refer to Firebase docs: [Add Firebase to your Android project](https://firebase.google.com/docs/android/setup?authuser=0).
6. For iOS refer to the Firebase docs: [Add Firebase to your iOS project](https://firebase.google.com/docs/ios/setup?authuser=0).
7. After setup has been done, Connect your phone to your workstation via USB.
8. Build the application in the IDE which you use for Flutter development or run `flutter run --release` on your console.
9. For setting up Firestore refer to the documentation below.
10. Great! Now your app is ready to go.
11. Enter the gmail ID of your DSC(admin) account that will have create, delete and update rights.
12. Add details of your team members, events organized by your DSC and the Code of Conduct of your DSC.
13. For Android users: If you want to build the apk: Run `flutter build apk --release` in your console.
14. For iOS users : Run 'flutter build ios' in your console of Xcode. Refer [Create a build archive](https://flutter.dev/docs/deployment/ios#create-a-build-archive) for detailed info.

### Setting up on Firestore

#### Setting security rules on Firestore
Create a Firestore Database in production mode, and add the following security rules to the database, to add authentication for only specific people to be able to update details on Firestore:
```
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /{document=**} {
      allow read;
      allow create, write, update, delete: if request.auth.token.email.matches("personalemailaddress[@]gmail[.]com");
    }
  }
}
```

#### Setting security rules on Firebase Storage
Enable the Firebase Storage, and add the following security rules to the database, to add authentication for only specific people to be able to add / update media to the storage bucket:
```
rules_version = '2';
service firebase.storage {
  match /b/{bucket}/o {
    match /{allPaths=**} {
      allow read;
      allow write, create, delete, update: if request.auth.token.email.matches("personalemailaddress[@]gmail[.]com");
    }
  }
}
```

## Technology Stacks
- [Flutter](https://flutter.dev/)
- [Firebase](https://firebase.google.com/)

## Contributors

| Name              | Github username                                   | E-Mail                                                                |
| ----------------- | ------------------------------------------------- | --------------------------------------------------------------------- |
| Dewansh Rawat    | [dewanshrawat15](https://github.com/dewanshrawat15)| [dewanshrawat15@gmail.com](mailto:dewanshrawat15@gmail.com)       |
| Aayushi Gupta    | [aayushigupt](https://github.com/aayushigupt)      | [aayushigupta108@gmail.com](mailto:aayushigupta108@gmail.com)      |
| Nandini Sahni    | [nandinisahni](https://github.com/nandinisahni)    | [nandinisahni@gmail.com](mailto:nandinisahni@gmail.com)         |
| Aastha Sharma    | [Aastha04](https://github.com/Aastha04)            | [s.frozenstar18@gmail.com](mailto:s.frozenstar18@gmail.com)       |

## Contributing

### Using GitHub Issues
- Feel free to use GitHub issues for questions, bug reports, and feature requests
- Use the search feature to check for an existing issue
- Include as much information as possible and provide any relevant resources (Eg. screenshots)
- For bug reports ensure you have a reproducible test case
  - A pull request with a breaking test would be super preferable here but isn't required

### Submitting a Pull Request
- Squash commits
- Include relevant test updates/additions

## Support

- If you have any issues, feel free to hit us up at [dscbvppune@gmail.com](mailto:dscbvppune@gmail.com).
- You can also put up queries on GitHub issues [here](https://github.com/dscbvppune/folio-app/issues).

## License

This project is licensed under the MIT License - see the [LICENSE](/LICENSE) file for details.
