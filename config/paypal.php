<?php
return array(
    // set your paypal credential
     'client_id' => 'AXqLapWl_MRF8BNMm9szmFVuLnn6slLuoGW1zPhRWQNHnK_BVtaQgQc7vPnxZfwO6_Afletuk3t29Ju6',
    'secret' => 'EIYTubn7dbr3G7pr86_JwqK6fUAKeoYp_k1KQp4qUYSCZEs--yimespo1mcEZ9_iiBmedQ78Tr1V9x5R',

    /**
     * SDK configuration 
     */
    'settings' => array(
        /**
         * Available option 'sandbox' or 'live'
         */
        'mode' => 'sandbox',

        /**
         * Specify the max request time in seconds
         */
        'http.ConnectionTimeOut' => 30,

        /**
         * Whether want to log to a file
         */
        'log.LogEnabled' => true,

        /**
         * Specify the file that want to write on
         */
        'log.FileName' => storage_path() . '/logs/paypal.log',

        /**
         * Available option 'FINE', 'INFO', 'WARN' or 'ERROR'
         *
         * Logging is most verbose in the 'FINE' level and decreases as you
         * proceed towards ERROR
         */
        'log.LogLevel' => 'FINE'
    ),
);