package com.android.attention;

import android.content.BroadcastReceiver;
import android.content.ContentResolver;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.provider.Settings;

public class DefaultSettingsReceiver extends BroadcastReceiver {
    private static final String PREFS_NAME = "default_settings";
    private static final String KEY_SEEDED = "defaults_seeded";
    private static final String[] KEYS = {
        "adaptive_sleep",
        "system_navigation_keys_enabled",
    };

    @Override
    public void onReceive(Context context, Intent intent) {
        if (!Intent.ACTION_BOOT_COMPLETED.equals(intent.getAction())) {
            return;
        }

        SharedPreferences prefs = context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE);
        if (prefs.getBoolean(KEY_SEEDED, false)) {
            return;
        }

        ContentResolver cr = context.getContentResolver();
        for (String key : KEYS) {
            if (Settings.Secure.getString(cr, key) == null) {
                Settings.Secure.putInt(cr, key, 1);
            }
        }
        prefs.edit().putBoolean(KEY_SEEDED, true).apply();
    }
}
