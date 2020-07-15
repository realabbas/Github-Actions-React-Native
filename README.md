![Github Action for React Native Build](https://raw.githubusercontent.com/realabbas/Github-Actions-React-Native/master/demo/github%20action.png)

This github action automatically builds the android apk under the artifact section whenever a commit is pushed into the master branch

![Visitors](https://visitor-badge.glitch.me/badge?page_id=realabbas.github-actions-react-native)

## Installation

Add the *action.yml* as follows ``` .github/workflows/build.yml ``` in the project.
For more reference see the official [docs](https://help.github.com/en/actions/configuring-and-managing-workflows/configuring-a-workflow#creating-a-workflow-file)

```
name: react-native-android-build-apk
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


