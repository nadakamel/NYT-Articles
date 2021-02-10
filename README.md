# NYT-Articles
A simple app to hit the NY Times Most Popular Articles API and show a list of articles, that shows details when items on the list are tapped.

## Base Tooling

- `Alamofire` + `Moya` for networking.
- `ObjectMapper` for JSON Object mapping.
- `ReachabilitySwift` for internet connection handling.
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
