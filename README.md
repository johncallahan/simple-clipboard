# Simple Clipboard

## Overview

This is a very minimalist Ruby Gem that demonstrates how native extensions can be used to access a user's clipboard.

## Dependencies

### Build tools

You will need git, cmake, and an appropriate C++ compiler tool-chain (e.g. GCC) to install this gem.

### libclipboard

Assuming you have git, cmake, and a compatible C++ compiler tool-chain installed, you should be able to install libclipboard by following these steps:

    git clone https://github.com/jtanx/libclipboard
    cd libclipboard
    mkdir build
    cd build
    cmake ..
    make -j4
    sudo make install

## Build

Building the gem should be as simple as:

    gem build simple_clipboard.gemspec

## Installation

Assuming that libclipboard has been installed, you will be able to install the gem:

    gem install simple_clipboard-0.0.1.gem

## Usage

This gem defines a module called `SimpleClipboard`, with two methods for interacting with a user's clipboard:

* `get_text` - returns the current clipboard contents as a string
* `set_text(new_text)` - replaces the contents of the clipboard with the value of `new_text`, and returns the previous contents of the clipboard

## License ##

This project is licensed under the MIT License.

See the LICENSE file for more information.
