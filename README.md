# iOS Assignment for skill assessment.

## Technology Stack:
* iOS 12.0+
* Xcode 13.3.1
* Swift 5.5

## Objective:
Ojective of this assignment is to Create an app that can visualize the contents of the attached CSV file on the screen to demonstrate some aspect of clean architecture using  MVVM-C pattern, loose coupling, **unit testing** and some of the best practices used in modern iOS programming using `Swift`.

## Requirements:
• Correctly implemented, at community widely recognized, architecture, designpatterns, and technologies by your choice
• UI thread is not blocked during file reading, parsing or content browsing.

## Focus on quality:
1. Code style and formatting
2. High cohesion of modules
3. Scalability without refactoring
4. Performance aspects
5. Unit Tests
6. No irrelevant or dead code
7. Code is concise, but production ready requiring no additional touches to code.
8. Ready for CSV files in size above 5MB
9. Ready for malformed content
10. The result should be delivered as a link or email attachment

## Bonus - You can impress with:
1. Advanced setup of the project
2. The CSV parser created by yourself
3. Nice looking UI
4. UI Tests
5. File selector to avoid hard-coded paths and ease validation
6. If a Git repository is provided it contains more than initial commit


## Installation

- Xcode **13.3.1**(required)
- Clean `/DerivedData` folder if any

## 3rd Party Libraries
No Third Party Librariies used in the  Project 

## Technical notes:
- MVVM-C - My preferred architecture.
- MVVM-C stands for “Model View ViewModel Coordinator”
- It’s a software architecture often used by Apple developers to replace MVC. Model-View-ViewModel-Coordinator (MVVM-C)  is a structural design pattern that separates objects into three distinct groups:
- Models hold application data. They’re usually structs or simple classes.
- Views display visual elements and controls on the screen. They’re typically - subclasses of UIView.
- View models transform model information into values that can be displayed on a view. They’re usually classes, so they can be passed around as references.
- Coordinators Coordinates flow of the Application
