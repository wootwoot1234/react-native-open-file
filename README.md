# react-native-open-file

## Why

We want an easy to way to open documents on disk (and possibly remote files as well) using default native behavior on both
android and ios without dealing with the details of the two platforms.

## How

On iOS, use `DocumentInteractionController` to present a preview. On android...TBD

## Status

Very early stage WIP. Only iOS is supported, and only in the most basic way.

```javascript
import {RNDocumentInteractionController} from 'NativeModules';
RNDocumentInteractionController.open({path: filePath, name: "Text displayed in header bar"}); // name is optional
```

## Usage

```
npm install --save react-native-open-file@https://github.com/wootwoot1234/react-native-open-file.git
```

And the usual iOS linking business for `DocumentInteractionController.xcodeproj`.

