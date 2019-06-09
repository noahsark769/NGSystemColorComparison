# NGSystemColorComparison
A small app which shows the system UIColors and generates code for backwards compatibility.

<img width="350" alt="Screen Shot 2019-06-09 at 3 21 50 PM" src="https://user-images.githubusercontent.com/1168853/59165054-77d53880-8aca-11e9-8b20-14a4a6a7c16f.png">

This repo contains an app which lists all the new system colors on UIColor which were introduced in iOS 13+. These colors adapt to the user's preferred color scheme (aka Dark Mode). If you'd like to see the hex values of each system color, you can find them in this app.

This app also generates (by printing to the console on launch) some swift code which will allow you to use the system colors in a backwards compatible way.

Note that compiling and running this app requires Xcode 11 (in beta at the time of writing).
