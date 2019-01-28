var UglifyJsPlugin = require('uglifyjs-webpack-plugin');
module.exports = {
    entry: {
        index: './src/index.js',
        main: './src/main.js',
        max: './src/main.jsx',
    },
    output: {   
        filename: '[name].js'
    },
    optimization: {
        minimizer: [new UglifyJsPlugin({
            test: /\.js(\?.*)?$/i,
        }
        )],
    }, 
    module: {
        rules: [
            {
                test: /\.jsx?$/,
                exclude: /node_modules/,
                use: {
                    loader: 'babel-loader',
                    options: {
                        presets: [
                            [
                                '@babel/env',
                                {
                                    'modules': false,
                                    'targets': {
                                        'browsers': ['ie >= 9']
                                    },
                                    'useBuiltIns': 'usage',
                                    'debug': true
                                }]
                            , '@babel/react'],
                        plugins: ['@babel/plugin-transform-runtime']
                    }
                }
            },
            {
                test: /\.css$/,
                use: ['style-loader','css-loader']
            },
            {
                test: /\.(png|jpg)$/,
                use: [
                    {
                        loader: 'url-loader',
                        options: {
                            limit: 8192
                        }
                    }
                ]
            }
        ]
    } 
};
