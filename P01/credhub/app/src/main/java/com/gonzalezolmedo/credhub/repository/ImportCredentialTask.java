package com.gonzalezolmedo.credhub.repository;

import android.os.AsyncTask;
import android.util.Log;

import com.gonzalezolmedo.credhub.model.Credential;

import org.ksoap2.HeaderProperty;
import org.ksoap2.SoapEnvelope;
import org.ksoap2.serialization.PropertyInfo;
import org.ksoap2.serialization.SoapObject;
import org.ksoap2.serialization.SoapPrimitive;
import org.ksoap2.serialization.SoapSerializationEnvelope;
import org.ksoap2.transport.HttpTransportSE;

import java.util.List;
import java.util.Vector;

public class ImportCredentialTask extends AsyncTask<String, Void, Credential> {
    private final String TAG = "ImportCredentialTask";
    private static HttpTransportSE androidHttpTransport;
    private static List<HeaderProperty> headerList_basicAuth;
    private static final String WS_NAMESPACE = "http://sdm_webrepo/";
    private static final String WS_METHOD_IMPORT = "ImportRecord";

    @Override
    protected Credential doInBackground(String... credentialsIds) {
        try {
            androidHttpTransport = new HttpTransportSE("http://10.0.2.2:80/SDM/WebRepo?wsdl");
            headerList_basicAuth = null;

            PropertyInfo propId = new PropertyInfo();
            propId.name = "arg0";
            propId.setValue(credentialsIds[0]);
            propId.type = PropertyInfo.STRING_CLASS;

            SoapObject request = new SoapObject(WS_NAMESPACE, WS_METHOD_IMPORT);
            request.addProperty(propId);

            SoapSerializationEnvelope envelope = new SoapSerializationEnvelope(SoapEnvelope.VER11);
            envelope.setOutputSoapObject(request);

            androidHttpTransport.call("\"" + WS_NAMESPACE + WS_METHOD_IMPORT + "\"", envelope, headerList_basicAuth);

            Vector<SoapPrimitive> importedRecord = (Vector<SoapPrimitive>) envelope.getResponse();

            if (importedRecord.size() == 3) {
                Log.i(TAG, "doInBackground: record imported successfully");
                return new Credential(importedRecord.get(0).toString(), importedRecord.get(1).toString(), importedRecord.get(2).toString(), null);
            } else {
                Log.e(TAG, "doInBackground: record received does not match credential structure", null);
            }

        } catch (Exception ex) {
            Log.e(TAG, "doInBackground: error while making http request to repo", ex);
        }

        return null;
    }
}
