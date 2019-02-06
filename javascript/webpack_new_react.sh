#!/bin/bash
# Goal:
# install dependencies automatic  when you want to create react project

# How to use:
# copy this file to your project directory and execute it

# you should executed webpack_global_install.sh first

# webpack 
webpack="webpack webpack-dev-server webpack-cli "

# babel 
# version: 8
babel="babel-loader@8 @babel/core @babel/preset-env @babel/preset-react "

# babel-polyfill
polyfill="@babel/plugin-transform-runtime "

# css-loader
css="style-loader css-loader "

# image-loader
image="url-loader file-loader "

# uglifyjs
# if you don't parse es6 to es5 
# it will throw error: Unexpected token: name
uglylify="uglifyjs-webpack-plugin "

# react
npm install -S react react-dom
npm install -D ${webpack}${babel}${polyfill}${css}${image}${uglylify}
npm install @babel/runtime
