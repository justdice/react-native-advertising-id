/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow
 * @lint-ignore-every XPLATJSCOPYRIGHT1
 */

import React, { Component } from 'react';
import { NativeModules, StyleSheet, Text, View } from 'react-native';
import RNAdvertisingId from 'react-native-advertising-id';

export default class App extends Component {
  getAdvertisingId = () => {
    console.log(NativeModules, RNAdvertisingId);
    RNAdvertisingId.getAdvertisingId()
      .then(response => {
        console.log(response);
      })
      .catch(error => console.error(error));
  }

  render() {
    this.getAdvertisingId();
    debugger;
    return (
      <View style={styles.container}>
        <Text style={styles.welcome}>Welcome to React Native!</Text>
        <Text style={styles.instructions}>Is Limited: </Text>
        <Text style={styles.instructions}>AdId: </Text>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF',
  },
  welcome: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10,
  },
  instructions: {
    textAlign: 'center',
    color: '#333333',
    marginBottom: 5,
  },
});
