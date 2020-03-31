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

import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.security.cert.X509Certificate;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;

public class ImportCredentialTask extends AsyncTask<String, Void, Credential> {
    private final String TAG = "ImportCredentialTask";
    private static HttpTransportSE androidHttpTransport;
    private static List<HeaderProperty> headerList_basicAuth;
    private static final String WS_NAMESPACE = "http://sdm_webrepo/";
    private static final String WS_METHOD_IMPORT = "ImportRecord";

    @Override
    protected Credential doInBackground(String... credentialsIds) {
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
