package info.applike.advertisingid;

import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;

public class RNAdvertisingIdModule extends ReactContextBaseJavaModule {

    public RNAdvertisingIdModule(ReactApplicationContext reactContext) {
        super(reactContext);
    }

    @ReactMethod
    public void getAdvertisingId(Promise result) {
        ReactApplicationContext context = getReactApplicationContext();
        context.runOnNativeModulesQueueThread(new RNAdvertisingIdThread(context, result));
    }

    @Override
    public String getName() {
        return "RNAdvertisingId";
    }
}
