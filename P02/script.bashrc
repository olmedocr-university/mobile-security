#!/bin/bash
project_dir='/Users/raul/development/mobile-security/P02/credhub'
keystore_dir='/Users/raul/development/mobile-security/keystore'
working_dir='/Users/raul/development/mobile-security/P02/delivery'

# Generate release apk
cd $project_dir
cp $project_dir/app/release/app-release.apk $working_dir
cd $working_dir
mv app-release.apk credhub.apk

# Decompile
apktool d -f credhub.apk

echo "Press any key once you've finished editing the decompiled apk"
read

# Build apk 
apktool b credhub -o credhub-pwned.apk

# Sign apk
jarsigner -sigalg SHA1withRSA -digestalg SHA1 -keystore $keystore_dir -storepass Paquete1-keystore credhub-pwned.apk android_key -keypass Paquete1-android

# Install in emulator
cd $working_dir
adb install credhub-pwned.apk
