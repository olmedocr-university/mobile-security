package com.gonzalezolmedo.credhub.repository;

import android.os.AsyncTask;
import android.util.Log;

import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.security.cert.X509Certificate;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import org.ksoap2.HeaderProperty;
import org.ksoap2.SoapEnvelope;
import org.ksoap2.serialization.SoapObject;
import org.ksoap2.serialization.SoapPrimitive;
import org.ksoap2.serialization.SoapSerializationEnvelope;
import org.ksoap2.transport.HttpTransportSE;

import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;

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
            TrustManager[] trustAllCerts = new TrustManager[] {
                    new X509TrustManager() {
                        @Override public java.security.cert.X509Certificate[] getAcceptedIssuers() {
                            return new X509Certificate[0]; }
                        @Override public void checkClientTrusted(
                                java.security.cert.X509Certificate[] certs, String authType) { }
                        @Override public void checkServerTrusted(
                                java.security.cert.X509Certificate[] certs, String authType) { }
                    }
            };
            HttpsURLConnection.setDefaultHostnameVerifier ((hostname, session) -> true);

            // Initialize TLS context
            SSLContext sc = null;
            try {
                sc = SSLContext.getInstance("TLSv1.2");
            } catch (NoSuchAlgorithmException e) {
                e.printStackTrace();
            }
            try {
                sc.init(null, trustAllCerts, new java.security.SecureRandom()); // *Set 2nd argument to NULL for default trust managers
            } catch (KeyManagementException e) {
                e.printStackTrace();
            }
            HttpsURLConnection.setDefaultSSLSocketFactory(sc.getSocketFactory());

            // Set HTTPS URL
            androidHttpTransport = new HttpTransportSE("https://10.0.2.2/SDM/WebRepo?wsdl");

            headerList_basicAuth = new ArrayList<HeaderProperty>();
            SingletonCredential credentials = SingletonCredential.getInstance();
            String strUserPass = credentials.username + ":" + credentials.password;
            headerList_basicAuth.add(new HeaderProperty("Authorization", "Basic " + org.kobjects.base64.Base64.encode(strUserPass.getBytes())));

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
