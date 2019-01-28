#!/bin/bash
# Goal:
# install dependencies automatic  when you want to create react project

# How to use:
# copy this file to your project directory and execute it

# you should executed webpack_global_install.sh first

# webpack 
npm install -D webpack webpack-dev-server webpack-cli

# babel 
# version: 8
npm install -D babel-loader@8 @babel/core @babel/preset-env @babel/preset-react

# babel-polyfill
npm install -D @babel/plugin-transform-runtime

# react
npm install -S react react-dom

# css-loader
npm install -D style-loader css-loader

# image-loader
npm install -D url-loader file-loader

# uglifyjs
# if you don't parse es6 to es5 
# it will throw error: Unexpected token: name
npm intall -D uglifyjs-webpack-plugin

