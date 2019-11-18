	# lucky13
iOS app to assist people with Parkinson's


# Technical Specifications
## iOS
### Software

- iOS version 12.XX
- XCode IDE version 8.4 or greater
- Swift 4.2+
- Coco Pods 1.84+

### CoCo Pods required

- pod 'Firebase/Analytics'
- pod 'Firebase/Messaging'
- pod 'Firebase/Core'
- pod 'Firebase/Firestore'
- pod 'FirebaseFirestoreSwift'

## XCode Instructions
1. Download the project into a folder.
2. Navigate to Paperplane > Signing & Capabilities > All
3. Make sure that "Automatically manage signing" is not checked.
4. Ensure that the bundle identifier is "com.anguskan.PAPER-Planes"
5. Navigate to PaperPLANES > Build Settings > Signing.
6. Ensure the field 'Development Team' has the value "YB2CH8LMF6"

## Firebase
At time of writing, our Google Firebase database allows read and writes from any user. This is intentional for development purposes. It will be closed for the production release.

## iOS App
### iOS Test Account
The test account username is "jinn@sfu.ca". The password is "helloworld"."

## Website

The team's test development server is http://cmpt275-paperplane.cjinng.com/.

### Software
- HTML5, CSS3, JavaScript

###  Website Test Account

The test account username is "herbert@test.ca. The password is "helloworld". The account is a doctor and will be able to look up patient accounts.

The patient accounts you may look up are:
- jinn@sfu.ca



### Running the Website Locally
1. Download MAMP.
2. Download the project/websites into htdocs.
3. Start up MAMP.
4. Navigate to localhost/<project-directory-inside-htdocs>
