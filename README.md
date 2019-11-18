# Lucky13
iOS app to assist people with Parkinson's

## Description
Paper plane is a iOS app and website combo aim to assist doctors to check-in with their patients that have Parkinson's Disease. It provides doctors the means to communicate with their patients and monitor their symptoms.

The team's test development server is [cmpt275-paperplane.cjinng.com](http://cmpt275-paperplane.cjinng.com/).

# Technical Guidelines
## Overview Specifications
Paper Plane will work with the following  specifications:
- iOS version 12.XX or greater
- iPhone 8 or greater
- Google Chrome

## iOS Specifications
The project was developed with the following software
- XCode IDE 8.4+
- Swift 4.2+
- CocoaPods 1.84+
  - pod 'Firebase/Analytics'
  - pod 'Firebase/Messaging'
  - pod 'Firebase/Core'
  - pod 'Firebase/Firestore'
  - pod 'FirebaseFirestoreSwift'

## Website Specifications
The project was developed with the following:
- HTML5, CSS3, JavaScript
- jQuery

## Database Specifications
- Firebase

# Building from Source
## iOS Instructions
1. Download the project into a folder.
2. Navigate to Paperplane > Signing & Capabilities > All
3. Make sure that "Automatically manage signing" is not checked.
4. Ensure that the bundle identifier is "com.anguskan.PAPER-Planes"
5. Navigate to PaperPLANES > Build Settings > Signing.
6. Ensure the field 'Development Team' has the value "YB2CH8LMF6"

## Web Instructions
1. Download MAMP.
2. Download the project/websites into htdocs.
3. Start up MAMP.
4. Navigate to localhost/<project-directory-inside-htdocs>

# Testing
## Firebase
At time of writing, our Google Firebase database allows read and writes from any user. This is intentional for development purposes. It will be closed for the production release.

<<<<<<< HEAD
## iOS App
The test account username is "jinn@sfu.ca". The password is "helloworld".

## Website
The test account username is "herbert@test.ca. The password is "helloworld". The account is a doctor and will be able to look up patient accounts.

The patient accounts you may look up are:
- jinn@sfu.ca
