# 🚀 Github Action for React Native Build

Add the ``` .github/workflows/build.yml ``` in the project.

```
name: build
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