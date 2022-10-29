# Race Weather

Simple weather forecast app for motorsport events. Currently supported series are Formula 1 and MotoGP.

<a href="https://apps.apple.com/us/app/race-weather-app/id6444075511"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Download_on_the_App_Store_Badge.svg/640px-Download_on_the_App_Store_Badge.svg.png" alt="Architecture Diagram" width="160"></a>

| App Icon  | Main Screen | Event Detail | Serie Detail |
| ------------- | ------------- | ------------- | ------------- |
| ![App Icon](https://github.com/lukas-ruzicka/race-weather-ios/blob/main/Resources/Assets.xcassets/AppIcon.appiconset/RaceWeatherIconV2.png?raw=true)  | ![Main Screen](https://github.com/lukas-ruzicka/race-weather-ios/blob/main/DocuAssets/screenshot_main_screen.png?raw=true)  | ![Event Detail](https://github.com/lukas-ruzicka/race-weather-ios/blob/main/DocuAssets/screenshot_event_detail.png?raw=true)  | ![Serie Detail](https://github.com/lukas-ruzicka/race-weather-ios/blob/main/DocuAssets/screenshot_serie_detail.png?raw=true)  |

The main intention to create this project was to **demonstrate the usage of clean architecture** and show a few examples in which the architecture may be helpful in a mobile app.

### Setup

1. Clone the repository
2. Create an empty directory for generated files by running `mkdir PresentationLayer/Sources/PresentationLayer/Generated`
2. Run `swiftgen config run` (if you don't have `swiftgen` installed, follow the instructions [here](https://github.com/SwiftGen/SwiftGen#installation))
3. Open the `RaceWeather.xcodeproj` and run

## Description

As described in the introduction, I've built this app using clean architecture (and simplified MVVM for the presentation layer) to demonstrate the benefits and advantages it may bring. The structure is following:

<img src="https://github.com/lukas-ruzicka/race-weather-ios/blob/main/DocuAssets/architecture_diagram.png?raw=true" alt="Architecture Diagram" width="600">

As you can see in the diagram, it has a separate _layer for data processing_ (data layer), _a business logic layer_ (domain layer) that defines the main value of the app, and _a presentation layer_ that translates all the data to the user interface and encapsulates the logic of interactions with the app.

### Benefits of the architecture

Apart from the obvious advantages of using such architecture, like:
- isolated layers and components that can be developed and tested separately
- the business logic defining the app structure and interfaces
- each component of the architecture is easily interchangeable

.., in this context, you can make **the possibility to swap implementations worth it** - in particular for the `EventsRepository`. You can already see two example implementations of the repository for the two supported series. They have two different services from which they consume the content and different logic for observing the content - yet, the remaining of the application seamlessly interacts with them both in the same way.

It means that adding support of a new serie is **completely isolated** and can be done **without interfering any other parts of the app**. Adding a new serie would consist of these few steps:
- adding new implementation of `EventsRepository` (_data layer_)
- adding a new case in the `Serie` enum  (_domain layer_)
- adding translation of the serie name and icon for the new `Serie` case (_presentation layer_)

And that's it, the new serie will seamlessly be integrated into the app without any other dependencies or integrations required.

#### Dependency injection

To distribute all the components easily within the architecture, it was necessary to introduce dependency injection. It also helps to maintain the lifecycle of the components - e.g. data layer components need to be shared through the whole codebase, but presentation modules can have multiple living duplicates at one time.

#### Unit tests

As mentioned above, the architecture enables us to test each layer separately. I've created a few examples of these unit tests - especially in the domain layer (more or less testing only happy scenarios - can and should be tested much more, but it's sufficient for the demonstration here).

#### Simplified areas

I've simplified a few areas of the architecture as they weren't the core of the demonstration. They wouldn't bring that much of an advantage considering the effort to support them. These areas are:
- using domain models in Views (the presentation layer should have its models)
- data layer is merged with the repository layer (may be beneficial to separate them if the project grows)


### Project structure

The project structure has been built using Swift Packages - each layer of the architecture is detached in a package and project-wide utilities are separated in another package. That means the project itself contains only 4 source files that shouldn't be changed frequently (i.e. no more conflicts in the project file 🙌🏼).

> The packages currently divide the project only horizontally (by layers), but it would also make sense to separate it vertically (e.g. each networking service could have its package or target within the package).

### Routing

The navigation is handled using the new `NavigationStack` component of `SwiftUI`. However, in order to make it compatible with the dependency injection (to avoid resolving all of the "stacked" screens and their dependencies over and over again), I've had to create a wrapper that stores the already presented screens in the stack. For more info, see the `RaceWeather/Router.swift` file.

### Tech stack

I wanted to avoid using external dependencies, so the project mainly uses the Apple SDK, especially these frameworks:
- Swift concurrency (`async/await`) for asynchronous code
- `URLSession` for networking
- `WeatherKit` for gathering the weather data

It was inevitable to use some external dependencies (wasn't worth the effort to use a custom solution), so I ended up using a few:
- [`Resolver`](https://github.com/hmlongco/Resolver) for dependency injection
- [`SwiftGen`](https://github.com/SwiftGen/SwiftGen) for strongly typed references of assets and translations
- [`Firebase`](https://github.com/firebase/firebase-ios-sdk) for monitoring of crashes and app insights

