# Facebot Birthdays
Facebook-bot in Robot Framework to automatically send birthday congratulations and poke automatically back. Designed for my Raspberry PI.

## Features
* Automatically pokes everyone back that has poked you.
* Automatically congratulates people on their birthday with a message chosen at random.
* Totally uses advanced IT-tools that are used in Software Testing for something way more fun.

## Background
![Cartoon](https://raw.githubusercontent.com/sbrugman/facebot-birthdays/master/cartoon.jpg)

## Installation
Facebot requires Robot Framework (http://robotframework.org/) to work. With Python's `pip`, installation of Robot Framework is a piece of cake:
`pip install robotframework`

Change the `[username]` and `[password]` in `config.robot`.

## Usage
Simply run the following command in this folder and watch the browser go mad:
`pybot --outputdir output/ facebook.robot`

You could setup a crontab on a Raspberry Pi or server by adding this line to the crontab.
