# 🚀 Github Action for React Native Build

This github action automatically builds the android apk under the artifact section whenever a commit is pushed into the master branch

## Installation

Add the *action.yml* as follows ``` .github/workflows/build.yml ``` in the project.
For more reference see the official [docs](https://help.github.com/en/actions/configuring-and-managing-workflows/configuring-a-workflow#creating-a-workflow-file)

```
name: react-native-android-build
on:
  push:
    branches:
      - master
jobs:
  install-and-test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - name: Install npm dependencies
        run: |
          npm install
  build-android:
    needs: install-and-test
    runs-on: ubuntu-latest
    steps: 
      - uses: actions/checkout@v2
      - name: Install npm dependencies
        run: |
          npm install
      - name: Build Android Release
        run: |
          cd android && ./gradlew assembleRelease
      - name: Upload Artifact
        uses: actions/upload-artifact@v1
        with:
          name: app-release.apk
          path: android/app/build/outputs/apk/release/

```

Build will be triggered as soon as the commit is pushed to the master branch.

## Troubleshoot

### Gradlew commands not working 

You can try to execute the following command before run gradle commands.

``` 
chmod +x ./gradlew
```

![Gradlew Command Not working in Github Actions React Native](https://dyjpb62732.i.lithium.com/t5/image/serverpage/image-id/3072i1C8314A5EA6EFEF8/image-size/large?v=1.0&px=999)
