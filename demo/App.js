/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow
 * @lint-ignore-every XPLATJSCOPYRIGHT1
 */

import React, { Component } from 'react';
import { StyleSheet, Text, View } from 'react-native';
import RNAdvertisingId from 'react-native-advertising-id';

export default class App extends Component {
  state = {
    advertisingId: 'TBD',
    isLimitAdTrackingEnabled: true,
  }

  componentDidMount() {
    this.getAdvertisingId();
  }

  getAdvertisingId = () => {
    RNAdvertisingId.getAdvertisingId()
      .then(response => {
        this.setState({
          advertisingId: response.advertisingId,
          isLimitAdTrackingEnabled: response.isLimitAdTrackingEnabled,
        });
      })
      .catch(error => console.error(error));
  }

  render() {
    const { advertisingId, isLimitAdTrackingEnabled } = this.state;

      return (
      <View style={styles.container}>
        <Text style={styles.welcome}>Welcome to React Native!</Text>
        <Text style={styles.instructions}>Advertising Id: {advertisingId}</Text>
        <Text style={styles.instructions}>Is Limited: {isLimitAdTrackingEnabled ? 'Yes' : 'No'}</Text>
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
