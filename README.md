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
- XCode IDE 11.2+
- Swift 4.2+
- CocoaPods 1.84+
  - pod 'FirebaseUI/Auth'
  - pod 'FirebaseUI/Email'
  - pod 'FirebaseUI/Google'
  - pod 'Firebase/Analytics'
  - pod 'Firebase/Core'
  - pod 'Firebase/Firestore'
  - pod 'Firebase/Auth'
  - pod 'MessageKit'


## Website Specifications
The project was developed with the following:
- HTML5, CSS3, JavaScript
- jQuery

## Database Specifications
- Firebase

## Automation testing
The following tools were used to test the project:
Website
- Selenium C#
- NUnit Test

# Building from Source
## iOS Instructions
1. Download the project into a folder.
2. Open PAPER Planes.xcworkspace in Xcode
3. Build and run on emulator/iOS device
4. If running on iOS device, must ensure project team is set in Project Settings > Signing & Capabilities

## Web Instructions
1. Download MAMP.
2. Download the project/websites into htdocs.
3. Start up MAMP.
4. Navigate to localhost/<project-directory-inside-htdocs>

# Testing
## Firebase
At time of writing, our Google Firebase database allows read and writes from any user. This is intentional for development purposes. It will be closed for the production release.

## iOS App
The test account username is "jinn@sfu.ca". The password is "helloworld".

## Website
The test account username is "herbert@test.ca. The password is "helloworld". The account is a doctor and will be able to look up patient accounts.

The patient accounts you may look up are:
- csmith@gmail.com
