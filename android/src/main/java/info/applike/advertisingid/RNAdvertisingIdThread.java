package info.applike.advertisingid;

import com.facebook.react.bridge.Arguments;
import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReactApplicationContext;

import com.facebook.react.bridge.WritableMap;
import com.google.android.gms.ads.identifier.AdvertisingIdClient;
import com.google.android.gms.ads.identifier.AdvertisingIdClient.Info;
import com.google.android.gms.common.GooglePlayServicesNotAvailableException;
import com.google.android.gms.common.GooglePlayServicesRepairableException;

import java.io.IOException;

public class RNAdvertisingIdThread implements Runnable {
    ReactApplicationContext context;
    Promise result;

    public RNAdvertisingIdThread(ReactApplicationContext reactContext, Promise promise) {
        this.context = reactContext;
        this.result = promise;
    }

    // Do not call this function from the main thread. Otherwise,
    // an IllegalStateException will be thrown.
    @Override
    public void run() {
        try {
            Info adInfo = AdvertisingIdClient.getAdvertisingIdInfo(context);
            WritableMap map = Arguments.createMap();
            map.putString("advertisingId", adInfo.getId());
            map.putBoolean("isLimitAdTrackingEnabled", adInfo.isLimitAdTrackingEnabled());
            result.resolve(map);

        } catch (IOException e) {
            // Unrecoverable error connecting to Google Play services (e.g.,
            // the old version of the service doesn't support getting AdvertisingId)
            result.reject(e);
        } catch (GooglePlayServicesNotAvailableException e) {
            // Google Play services is not available entirely.
            result.reject(e);
        } catch (GooglePlayServicesRepairableException e) {
            // Encountered a recoverable error connecting to Google Play services.
            result.reject(e);
        }
    }
}
