# Thought sharing app - MVVM Firebase Firestore
app which allows users to read/write/edit and delete their post/thought and also see what other users have written

![splash screen](https://github.com/androidclubvitbhopal/Temp_Predict-O-R/assets/118997882/28b7a9f6-291e-4085-9ed5-1564534081fc) ![home-my thoughts screen](https://github.com/androidclubvitbhopal/Temp_Predict-O-R/assets/118997882/1fff6dbe-281c-4bc8-aec9-d0fb63f0f468)

## Features
* Write Posts: Create and share your thoughts effortlessly.
* Edit Posts: Modify your existing posts to refine or update your ideas.
* Delete Posts: Remove posts you no longer wish to keep.
* View: your profile and others user's priofiles
* View Other User's Posts: Browse and read thoughts shared by other users.

## Installation
* Clone this repository to your local machine using 'git clone'.
* Open the project in Android Studio and run 'pub get' to install following dependencies.
  * hexcolor: ^3.0.1
  * firebase_core: ^2.31.1
  * firebase_auth: ^4.19.6
  * cloud_firestore: ^4.17.4
  * provider: ^6.1.2
* Build and run the application on an Android device or emulator.

## Architecture
used the MVVM- Model-View-View model architecture to manage all code files
* Model - firestore databse code and app colors model
* View - all screens: login,registration,home,profile and users
* ViewModel : divided into
   * components - consists of custom buttons, showDialog, textfields
   * routes - consist of named routes and routes model code files
![MVVM](https://github.com/androidclubvitbhopal/Temp_Predict-O-R/assets/118997882/7783c2a0-b273-427f-a87a-f05aa1d2b643)

  
## Flow diagram of navigation throughout the app
![image](https://github.com/AyushmanKS/MemoNeet-Task-FlutterApp/assets/118997882/8db7ab5e-0433-4b93-9812-e4d27556d560)

## Steps to use the app
* Open the app and log in with your credentials, i.e., email ID and password.
* Register with your username, email ID, and password if you don't have an existing account.
![login screen](https://github.com/androidclubvitbhopal/Temp_Predict-O-R/assets/118997882/cd710957-2c42-4ff6-818d-b4685452bb35) ![registration screen](https://github.com/androidclubvitbhopal/Temp_Predict-O-R/assets/118997882/ebe47ed9-75de-446e-8586-aaeee5a281ed) 

* After logging in/registering, you will be navigated to the My Thoughts screen, where you can create a post.
* Posts created will be displayed on this screen along with posts from other users, if any.
![home-my thoughts screen](https://github.com/androidclubvitbhopal/Temp_Predict-O-R/assets/118997882/09564b8a-3d5c-4671-b3e5-52d88045dc17)
![post your thought](https://github.com/androidclubvitbhopal/Temp_Predict-O-R/assets/118997882/a2e44d58-702b-4aef-b9a1-6693b80813fc)
  
* you can edit or delete your post with edit,delete buttons parallel to the post
  
![write-create a thought](https://github.com/androidclubvitbhopal/Temp_Predict-O-R/assets/118997882/c8620c4e-e3bf-4b08-920b-9554a0c2e884)
![edit thought](https://github.com/androidclubvitbhopal/Temp_Predict-O-R/assets/118997882/3a2b6385-cb87-456d-9f31-1fab6f483ddf)  

  
* On the App Bar, there are two buttons: one for the drawer and the other for logout.
* The drawer will help you navigate through Profile, Users, and My Thoughts screens.
* Logout will end the session and redirect you to the login screen.

![drawer](https://github.com/androidclubvitbhopal/Temp_Predict-O-R/assets/118997882/0b76adf7-03ed-4861-be65-9d8aa7365424)
  
* You can view the current user on the Profile screen.
* You can view all previous and current users on the Users screen.

![users screen](https://github.com/androidclubvitbhopal/Temp_Predict-O-R/assets/118997882/534b56d5-219a-4e9a-b918-8d6fd34cbb33)
![profile screen](https://github.com/androidclubvitbhopal/Temp_Predict-O-R/assets/118997882/914a16ba-a274-4044-95de-7f3701d1264f)

## Cloud Firestore
* Firebase email password authentication
![authentication](https://github.com/androidclubvitbhopal/Tempsor/assets/118997882/1058fc8f-e531-4efa-aa11-fa3b074ec642)

* Cloud Firestore to store and manage Thought posts and user credentials
  
![thoughts db](https://github.com/androidclubvitbhopal/Tempsor/assets/118997882/d8ccbc3b-9f3a-4091-abf7-54689253616a)
![users db](https://github.com/androidclubvitbhopal/Tempsor/assets/118997882/1c17ae65-73bc-4fe3-8592-0951d8e1c1fc)
