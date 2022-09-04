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
  <a href="https://github.com/CypherZox/ethvoting_time">
    <img src="https://github.com/CypherZox/ethvoting_time/blob/main/appstore.png" alt="Logo" width="100" height="100">
  </a>

<h3 align="center">EthVoting Time</h3>

  <p align="center">
    project_description
    <br />
    <!-- <a href="https://github.com/CypherZox/ClistApp"><strong>Explore the docs »</strong></a> -->
    <br />
    <br />
    <!-- <a href="https://github.com/CypherZox/ClistApp">View Demo</a> -->
    <!-- · -->
    <a href="https://github.com/CypherZox/ethvoting_time/issues">Report Bug</a>
    ·
    <a href="https://github.com/CypherZox/ethvoting_time/issues">Request Feature</a>
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
    <li><a href="#Features/What the app does and Screenshots">Features/What the app does and Screenshots</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>

<!-- ABOUT THE PROJECT -->

## About The Project

<img src="https://github.com/CypherZox/ethvoting_time/blob/main/appstore.png" width="350" class="center">

<!-- [![Product Name Screen Shot][product-screenshot]](https://example.com) -->

This is a dApp that makes you vote for your favourirte character fron the Adventure time, all you have to do is just fill your MetaMask wallet with some Eth(Rinkebey network) then vote and BOOM see who's winnig!

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Built With

<p><a href="https://flutter.dev/"> <img src="https://avatars.githubusercontent.com/u/14101776?s=200&v=4" width="50" ></a> Flutter</p>
<p><a href="https://docs.soliditylang.org/en/v0.8.15/brand-guide.html"> <img src="https://docs.soliditylang.org/en/v0.8.16/_static/logo.svg" width="50" ></a> Solidity</p>
<!-- - [![Flutter][flutter-logo]][flutter-url] -->

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GETTING STARTED -->

## Getting Started

The app is available for installation as an apk (Will publish on Play Store soon follow me on Twitter to get notified on that). To run on iOS devices you can run the app with an iOS Simulator.

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

You can download the app (apk) from this [link][apk-download-link].

To pay for voting (you'll vote with Rinkeby Eth so you won't pay real money here):

- Install the MetaMask app.
- create account(or import your account if you already have an account).
- switch to Rinkeby network.
- You can get balance from [here][chainlink-faucet].

### Installation

You can download the app (apk) from this [link][apk-download-link].

<!-- USAGE EXAMPLES -->

## Code Architecture

- Used [Stacked][stacked-flutter] (MVVM) to manage state in the flutter app.
- Solidity to write the smart contract.
- Infura to deploy the smart contract.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ROADMAP -->

## Features/What the app does and Screenshots

- Connect with Metamask wallet (Shows results when wallet address has already been voted with before)
- <img src="https://github.com/CypherZox/ethvoting_time/blob/main/wallet_connect_voted_before.gif" width="400">

- Vote for your chosen candidate. 
- <img src="https://github.com/CypherZox/ethvoting_time/blob/main/Pink%20Minimalist%20iPhone%20Mockup%20for%20Instagram%20(1).gif" width="404">

- Checks to see if the user(address) has voted before
- <img src="https://github.com/CypherZox/ethvoting_time/blob/main/user_can't_vote_again.gif" width="400">

See the [open issues](https://github.com/CypherZox/ethvoting_time/issues) for a full list of proposed features (and known issues).

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

Hana Fedeil - [@CypherZox\_](https://twitter.com/CypherZox_) - hanafedeil@gmail.com

LinkedIn - [![LinkedIn][linkedin-shield]][linkedin-url]

Project Link: [https://github.com/CypherZox/ethvoting_time](https://github.com/CypherZox/ethvoting_time)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ACKNOWLEDGMENTS -->

## Acknowledgments

- [Build a voting app tutorial](https://www.youtube.com/watch?v=3681ZYbDSSk&t=4984s)
- [Learn Solidity and web3 basics](https://www.youtube.com/watch?v=gyMwXuJrbJQ&t=24626s)
- [Icons from Icons8.com](https://icons8.com/)
- [Wallet animation and "waiting confirmation" andimation from: lottiefiles.com/](https://lottiefiles.com/)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->

<!-- https://github.com/CypherZox/ethvoting_time -->

[contributors-shield]: https://img.shields.io/github/contributors/CypherZox/ethvoting_time.svg?style=for-the-badge
[contributors-url]: https://github.com/CypherZox/ethvoting_time/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/CypherZox/ethvoting_time.svg?style=for-the-badge
[forks-url]: https://github.com/CypherZox/ethvoting_time/network/members
[stars-shield]: https://img.shields.io/github/stars/CypherZox/ethvoting_time.svg?style=for-the-badge
[stars-url]: https://github.com/CypherZox/ethvoting_time/stargazers
[issues-shield]: https://img.shields.io/github/issues/CypherZox/ethvoting_time.svg?style=for-the-badge
[issues-url]: https://github.com/CypherZox/ethvoting_time/issues
[license-shield]: https://img.shields.io/github/license/othneildrew/Best-README-Template.svg?style=for-the-badge
[license-url]: https://github.com/CypherZox/flutter_image_editor/blob/master/LICENSE
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/hana-fedeil-0xCypherZox
[product-screenshot]: https://play-lh.googleusercontent.com/d91JkGzJWYNnyMBZlArlMHpba6KOUKdaR1bIksAHkm-U8eAVmM7asEoS891n1IZEXkUd=w480-h960-rw
[flutter-logo]: https://avatars.githubusercontent.com/u/14101776?s=200&v=4
[flutter-url]: https://flutter.dev/
[get-it-on-gp-image]: https://cdn.freebiesupply.com/logos/large/2x/google-play-badge-logo-png-transparent.png
[flutter-for-mac]: https://docs.flutter.dev/get-started/install/macos
[flutter-for-windows]: https://docs.flutter.dev/get-started/install/windows
[flutter-for-linux]: https://docs.flutter.dev/get-started/install/linux
[apk-download-link]: https://drive.google.com/file/d/1z1zFWw0M5kPoRcqfFOdF4vG5Q1HNEA5a/view?usp=sharing
[chainlink-faucet]: https://faucets.chain.link/
[stacked-flutter]: https://pub.dev/packages/stacked
[get-it-url]: https://pub.dev/packages/get_it
[build_runner_url]: https://pub.dev/packages/build_runner
[scrnsht-1]: https://play-lh.googleusercontent.com/ntFr1_5VOsIZ4LP0jRLVpVIhaRgk2oPcSbv8fjTZ5sq8ttb0-3VATZxYl9KD230eWNA=w5120-h2880-rw
[scrnsht-2]: https://play-lh.googleusercontent.com/dJ2hpjCzOBUVDrlY3744I4TCIMfRA3YU9QWW7iWp94zZd995L_j3ctEvKrT9FDfN9Ms=w5120-h2880-rw
