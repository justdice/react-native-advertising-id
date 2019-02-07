using ReactNative.Bridge;
using System;
using System.Collections.Generic;
using Windows.ApplicationModel.Core;
using Windows.UI.Core;

namespace Advertising.Id.RNAdvertisingId
{
    /// <summary>
    /// A module that allows JS to share data.
    /// </summary>
    class RNAdvertisingIdModule : NativeModuleBase
    {
        /// <summary>
        /// Instantiates the <see cref="RNAdvertisingIdModule"/>.
        /// </summary>
        internal RNAdvertisingIdModule()
        {

        }

        /// <summary>
        /// The name of the native module.
        /// </summary>
        public override string Name
        {
            get
            {
                return "RNAdvertisingId";
            }
        }
    }
}
