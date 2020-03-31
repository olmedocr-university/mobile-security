package com.gonzalezolmedo.credhub.repository;

import android.os.AsyncTask;
import android.util.Log;

import com.gonzalezolmedo.credhub.model.Credential;

import org.ksoap2.HeaderProperty;
import org.ksoap2.SoapEnvelope;
import org.ksoap2.SoapFault;
import org.ksoap2.serialization.PropertyInfo;
import org.ksoap2.serialization.SoapObject;
import org.ksoap2.serialization.SoapSerializationEnvelope;
import org.ksoap2.transport.HttpTransportSE;
import org.xmlpull.v1.XmlPullParserException;

import java.io.IOException;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.security.cert.X509Certificate;
import java.util.ArrayList;
import java.util.List;

import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;

public class ExportCredentialTask extends AsyncTask<String, Void, Boolean> {
    private final String TAG = "ExportCredentialTask";
    private static HttpTransportSE androidHttpTransport;
    private static List<HeaderProperty> headerList_basicAuth;
    private static final String WS_NAMESPACE = "http://sdm_webrepo/";
    private static final String WS_METHOD_EXPORT = "ExportRecord";

    @Override
    protected Boolean doInBackground(String... strings) {

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

        SoapObject request = new SoapObject(WS_NAMESPACE, WS_METHOD_EXPORT);

        PropertyInfo propId = new PropertyInfo();
        propId.name = "arg0";
        propId.setValue(strings[0]);
        propId.type = PropertyInfo.STRING_CLASS;
        request.addProperty(propId);

        PropertyInfo propUser = new PropertyInfo();
        propUser.name = "arg1";
        propUser.setValue(strings[1]);
        propUser.type = PropertyInfo.STRING_CLASS;
        request.addProperty(propUser);

        PropertyInfo propPass = new PropertyInfo();
        propPass.name = "arg2";
        propPass.setValue(strings[2]);
        propPass.type = PropertyInfo.STRING_CLASS;
        request.addProperty(propPass);


        SoapSerializationEnvelope envelope = new SoapSerializationEnvelope(SoapEnvelope.VER11);
        envelope.setOutputSoapObject(request);

        try {
            androidHttpTransport.call("\"" + WS_NAMESPACE + WS_METHOD_EXPORT + "\"", envelope, headerList_basicAuth);
        } catch (IOException | XmlPullParserException e) {
            Log.e(TAG, "doInBackground: error in SOAP call ", e);
        }

        try {
            Log.i(TAG, "doInBackground: export result: " + envelope.getResponse().toString());
            return true;
        } catch (SoapFault soapFault) {
            Log.e(TAG, "doInBackground: error in response", soapFault);
        }

        return false;
    }
}
