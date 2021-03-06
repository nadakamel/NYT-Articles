# NYTimes Popular Articles
A simple app to hit the NY Times Most Popular Articles API and show a list of articles, that shows details when items on the list are tapped.

## Base Tooling

- `Moya` based on `Alamofire` for networking.
- `Kingfisher` for downloading and caching images from the web.

## Getting Started

### Prerequisites
This project uses cocoapods for dependencies management. If you don't have cocoapods installed in your machine, or are using older version of cocoapods, you can install it in terminal by running command ```sudo gem install cocoapods```. For more information go to https://cocoapods.org/

### Installation

1. Clone this repository to your machine in Xcode or using your machine's Terminal whatever you prefer.\
`git clone https://github.com/nadakamel/NYT-Articles.git`

2. Download CocoaPods on your machine if you don't already have it\
`sudo gem install cocoapods`

3. Install third-party libraries using `pod`\
`pod install`

### Usage
Open  ```NYTimes Articles.xcworkspace``` and run the project.

## Architecture

Model-View-ViewModel (MVVM) architecture

## Requirements
- Swift 5
- Xcode Version 12.2
- iOS 12 or later
- iPhone 5s or later

## Screenshots
Shows a list of articles from 1 day ago, and details of an article gets displayed when tapped.

<img src="https://github.com/nadakamel/NYT-Articles/blob/main/Screenshots/HomeScreen-1.png" width="300" height="650"> <img src="https://github.com/nadakamel/NYT-Articles/blob/main/Screenshots/Details%20Screen.png" width="300" height="650">

Also you can check articles from a week ago or 30 days ago.

<img src="https://github.com/nadakamel/NYT-Articles/blob/main/Screenshots/HomeScreen-2.png" width="300" height="650"> <img src="https://github.com/nadakamel/NYT-Articles/blob/main/Screenshots/HomeScreen-3.png" width="300" height="650">
