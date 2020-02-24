package com.gonzalezolmedo.credhub.repository;

import android.os.AsyncTask;
import android.util.Log;

import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import org.ksoap2.HeaderProperty;
import org.ksoap2.SoapEnvelope;
import org.ksoap2.serialization.SoapObject;
import org.ksoap2.serialization.SoapPrimitive;
import org.ksoap2.serialization.SoapSerializationEnvelope;
import org.ksoap2.transport.HttpTransportSE;

public class RetrieveCredentialListTask extends AsyncTask<Void, Void, List<String>> {
    private final String TAG = "RetrieveCredentialListTask";
    private static HttpTransportSE androidHttpTransport;
    private static List<HeaderProperty> headerList_basicAuth;
    private static final String WS_NAMESPACE = "http://sdm_webrepo/";
    private static final String WS_METHOD_LIST = "ListCredentials";

    @Override
    protected List<String> doInBackground(Void... voids) {
        List<String> remoteCredentials = new ArrayList<>();
        try {
            androidHttpTransport = new HttpTransportSE("http://10.0.2.2:80/SDM/WebRepo?wsdl");
            headerList_basicAuth = null;
            SoapObject request = new SoapObject(WS_NAMESPACE, WS_METHOD_LIST);
            SoapSerializationEnvelope envelope = new SoapSerializationEnvelope(SoapEnvelope.VER11);
            envelope.setOutputSoapObject(request);
            androidHttpTransport.call("\"" + WS_NAMESPACE + WS_METHOD_LIST + "\"", envelope, headerList_basicAuth);

            Vector<SoapPrimitive> listIds = new Vector<>();

            if (envelope.getResponse() instanceof Vector) {
                listIds.addAll((Vector<SoapPrimitive>) envelope.getResponse());
            } else if (envelope.getResponse() instanceof SoapPrimitive) {
                listIds.add((SoapPrimitive) envelope.getResponse());
            }

            Log.i(TAG, "doInBackground: got credential list from server");

            for (int i = 0; i < listIds.size(); i++) {
                remoteCredentials.add(listIds.get(i).toString());
            }

            return remoteCredentials;
        } catch (Exception ex) {
            Log.e(TAG, "doInBackground: error while making http request to repo", ex);
        }
        return null;
    }
}
