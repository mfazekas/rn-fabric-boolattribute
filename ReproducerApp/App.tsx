import React from 'react';
import {View, Text} from 'react-native';
import RTNCenteredText from 'rtn-centered-text/js/RTNCenteredTextNativeComponent';

export default function App() {
  return (
    <View style={{backgroundColor: 'red', flex: 1, padding: 30, margin: 16}}>
      <View style={{flex: 1, backgroundColor: 'green'}}>
        <Text>Hello!</Text>
        <RTNCenteredText
          style={{flex: 1}}
          hasBlueText={true}
          hasRedBackground={true}
          text={'2 Hello :)'}
        />
      </View>
    </View>
  );
}