package templates

import model.AndroidApplication
import model.GCMBroadcastReceiver
import model.Component

class GCMBroadcastReceiverTemplate implements ComponentTemplate {
	private static var GCMBroadcastReceiverTemplate INSTANCE = null;
	
	def GCMBroadcastReceiverTemplate() {}
	
	def static public GCMBroadcastReceiverTemplate getInstance() {
		if (INSTANCE == null)
			INSTANCE = new GCMBroadcastReceiverTemplate
		return INSTANCE
	}

	override generate(AndroidApplication app, Component b) '''
	«var br = b as GCMBroadcastReceiver»
/*
	Generated with DroidModeler
 */
package «app.javaName»;

import android.app.Activity;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.support.v4.content.WakefulBroadcastReceiver;

public class «br.name» extends WakefulBroadcastReceiver {

    @Override
    public void onReceive(Context context, Intent intent) {
    	«IF br.startIntentService != null»
    	ComponentName comp = new ComponentName(context.getPackageName(),
                «br.startIntentService.name».class.getName());
    	startWakefulService(context, (intent.setComponent(comp)));
        «ELSE»
    	// TODO: implement intent handling here
        «ENDIF»
        setResultCode(Activity.RESULT_OK);
    }
}

'''
}
