<!-- Improved compatibility of back to top link: See: https://github.com/othneildrew/Best-README-Template/pull/73 -->

<a name="readme-top"></a>

<!--
*** Thanks for checking out the Best-README-Template. If you have a suggestion
*** that would make this better, please fork the repo and create a pull request
*** or simply open an issue with the tag "enhancement".
*** Don't forget to give the project a star!
*** Thanks again! Now go create something AMAZING! :D
-->

<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]
[![LinkedIn][linkedin-shield]][linkedin-url]

<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/CypherZox/ClistApp">
    <img src="https://play-lh.googleusercontent.com/d91JkGzJWYNnyMBZlArlMHpba6KOUKdaR1bIksAHkm-U8eAVmM7asEoS891n1IZEXkUd=w480-h960-rw" alt="Logo" width="80" height="80">
  </a>

<h3 align="center">ClistApp</h3>

  <p align="center">
    project_description

    <br />
    <a href="https://github.com/CypherZox/ClistApp">View Demo</a>
    ·
    <a href="https://github.com/CypherZox/ClistApp/issues">Report Bug</a>
    ·
    <a href="https://github.com/CypherZox/ClistApp/issues">Request Feature</a>
  </p>
</div>

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#Code Architecture">Code Architecture</a></li>
    <li><a href="#Screenshots and videos">Screenshots and videos</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>

<!-- ABOUT THE PROJECT -->

## About The Project

<img src="https://play-lh.googleusercontent.com/d91JkGzJWYNnyMBZlArlMHpba6KOUKdaR1bIksAHkm-U8eAVmM7asEoS891n1IZEXkUd=w480-h960-rw" width="150" class="center">

<!-- [![Product Name Screen Shot][product-screenshot]](https://example.com) -->

There are many people interested in competitive programming and compete online on sites like: codechef.com, topcoder.com,...etc. To view the upcoming events a website called [clist.by][clist-link] this app uses the API from [clist.by][clist-link] to view all the upcoming events of competitive programming.
The Clean Architecture(with the help of the BLoC package) was used to build the app.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Built With

<p><a href="https://flutter.dev/"> <img src="https://avatars.githubusercontent.com/u/14101776?s=200&v=4" width="50" ></a> Flutter</p>

<!-- - [![Flutter][flutter-logo]][flutter-url] -->

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GETTING STARTED -->

## Getting Started

The app is available for installation in Google Play Store. To run on iOS devices
you can run the app with an iOS Simulator.

### Prerequisites

To run the code you have to install Flutter on your device with the following links:

- [macOS][flutter-for-mac]
- [Windows][flutter-for-windows]
- [Linux][flutter-for-linux]

To run the app:

```sh
  flutter pub get
```

```sh
  flutter packages pub run build_runner build --delete-conflicting-outputs
```

```sh
  flutter run
```

You can download the app on Google Play Store.

### Installation

You can download the Android version of the app from Google Play
<br><a href="https://play.google.com/store/apps/details?id=com.hanafedeil.clist.by"> <img src="https://cdn.freebiesupply.com/logos/large/2x/google-play-badge-logo-png-transparent.png" width="180" ></a>

<!-- USAGE EXAMPLES -->

## Code Architecture

- The app was coded following the clean architecture with the help of the flutter BLoC package.
- Dependency injection was used in this project as well using [get_it][get-it-url] and [build runner][build_runner_url]
- TDD unit tests were applied using [mockito](https://pub.dev/packages/mockito)
  ps. I recommend using Mocktail instead because it's more suitable for the null-safety development environment .

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ROADMAP -->

## Screenshots

- <img src="https://play-lh.googleusercontent.com/ntFr1_5VOsIZ4LP0jRLVpVIhaRgk2oPcSbv8fjTZ5sq8ttb0-3VATZxYl9KD230eWNA=w5120-h2880-rw" width="200">

- <img src="https://play-lh.googleusercontent.com/dJ2hpjCzOBUVDrlY3744I4TCIMfRA3YU9QWW7iWp94zZd995L_j3ctEvKrT9FDfN9Ms=w5120-h2880-rw" width="200">

See the [open issues](https://github.com/CypherZox/ClistApp/issues) for a full list of proposed features (and known issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->

## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LICENSE -->

## License

Distributed under the MIT License. See `LICENSE.txt` for more information.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTACT -->

## Contact

Your Name - [@CypherZox\_](https://twitter.com/CypherZox_) - hanafedeil@gmail.com

LinkedIn - [![LinkedIn][linkedin-shield]][linkedin-url]

Project Link: [https://github.com/CypherZox/ClistApp](https://github.com/CypherZox/ClistApp)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ACKNOWLEDGMENTS -->

## Acknowledgments

- [Clean Code Architecture](https://www.freecodecamp.org/news/a-quick-introduction-to-clean-architecture-990c014448d2/)
- [TDD for flutter (a little bit outdated)](https://www.youtube.com/watch?v=KjE2IDphA_U&list=PLB6lc7nQ1n4iYGE_khpXRdJkJEp9WOech)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->

[contributors-shield]: https://img.shields.io/github/contributors/CypherZox/ClistApp.svg?style=for-the-badge
[clist-link]: https://clist.by/
[contributors-url]: https://github.com/CypherZox/ClistApp/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/CypherZox/ClistApp.svg?style=for-the-badge
[forks-url]: https://github.com/CypherZox/ClistApp/network/members
[stars-shield]: https://img.shields.io/github/stars/CypherZox/ClistApp.svg?style=for-the-badge
[stars-url]: https://github.com/CypherZox/ClistApp/stargazers
[issues-shield]: https://img.shields.io/github/issues/CypherZox/ClistApp.svg?style=for-the-badge
[issues-url]: https://github.com/CypherZox/ClistApp/issues
[license-shield]: https://img.shields.io/github/license/othneildrew/Best-README-Template.svg?style=for-the-badge
[license-url]: https://github.com/CypherZox/flutter_image_editor/blob/master/LICENSE
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/hana-fedeil-0xCypherZox
[product-screenshot]: https://play-lh.googleusercontent.com/d91JkGzJWYNnyMBZlArlMHpba6KOUKdaR1bIksAHkm-U8eAVmM7asEoS891n1IZEXkUd=w480-h960-rw
[flutter-logo]: https://avatars.githubusercontent.com/u/14101776?s=200&v=4
[flutter-url]: https://flutter.dev/
[get-it-on-gp-image]: https://cdn.freebiesupply.com/logos/large/2x/google-play-badge-logo-png-transparent.png
[get-it-on-gp-url]: https://play.google.com/store/apps/details?id=com.hanafedeil.clist.by
[flutter-for-mac]: https://docs.flutter.dev/get-started/install/macos
[flutter-for-windows]: https://docs.flutter.dev/get-started/install/windows
[flutter-for-linux]: https://docs.flutter.dev/get-started/install/linux
[get-it-url]: https://pub.dev/packages/get_it
[build_runner_url]: https://pub.dev/packages/build_runner
[scrnsht-1]: https://play-lh.googleusercontent.com/ntFr1_5VOsIZ4LP0jRLVpVIhaRgk2oPcSbv8fjTZ5sq8ttb0-3VATZxYl9KD230eWNA=w5120-h2880-rw
[scrnsht-2]: https://play-lh.googleusercontent.com/dJ2hpjCzOBUVDrlY3744I4TCIMfRA3YU9QWW7iWp94zZd995L_j3ctEvKrT9FDfN9Ms=w5120-h2880-rw
