#!/bin/bash
cd $HOME

echo "Creating Android directory"
mkdir Android
cd Android

# command line tools only, without android studio
# https://developer.android.com/studio/index.html#command-line-tools-only
version=commandlinetools-linux-11076708_latest.zip
echo "Downloading command line tools $version"
wget "https://dl.google.com/android/repository/$version"
unzip "$version"
rm "$version"

echo "Installing platform and build tools"
$HOME/Android/cmdline-tools/bin/sdkmanager "platform-tools" "platforms;android-26" "build-tools;26.0.3" --sdk_root=$HOME/Android
