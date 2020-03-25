package sdm_webrepo_clienttest;

import java.net.URL;
import java.security.cert.X509Certificate;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;
import org.ksoap2.HeaderProperty;
import org.ksoap2.SoapEnvelope;
import org.ksoap2.serialization.PropertyInfo;
import org.ksoap2.serialization.SoapObject;
import org.ksoap2.serialization.SoapPrimitive;
import org.ksoap2.serialization.SoapSerializationEnvelope;
import org.ksoap2.transport.HttpTransportSE;


/**
 * Sample code that shows how a client software communicates with the web-based 
 * credentials repository developed to be used alongside the 'CredHub' Android app
 * (SDM - UC3M)
 */
public class SDM_WebRepo_ClientTest {
    private static HttpTransportSE androidHttpTransport;
    private static List<HeaderProperty> headerList_basicAuth;
    private static final String WS_NAMESPACE = "http://sdm_webrepo/";
    private static final String WS_METHOD_LIST = "ListCredentials";
    private static final String WS_METHOD_IMPORT = "ImportRecord";
    private static final String WS_METHOD_EXPORT = "ExportRecord";
    
    /**
     * Méthod 'main' - Sample function calls to the webservice
     * @param args One of the following input arguments: 
     * - "http" 
     * - "http+auth"
     * - "https+auth"
     */
    public static void main(String[] args) {
        try
        {
            // Establish test code behaviour
            boolean USE_HTTPS;
            boolean USE_BASIC_AUTH;
            String BASIC_AUTH_USERNAME = "sdm";
            String BASIC_AUTH_PASSWORD = "repo4droid";
            URL urlWebService;
            if (args.length == 1 && args[0].toLowerCase().equals("http")) // HTTP
            {
                USE_HTTPS = false;
                USE_BASIC_AUTH = false;
            }
            else if (args.length == 1 && args[0].toLowerCase().equals("http+auth")) // HTTP + basic authentication
            {
                USE_HTTPS = false;
                USE_BASIC_AUTH = true;
            }
            else if (args.length == 1 && args[0].toLowerCase().equals("https+auth")) // HTTPS + basic authentication
            {
                USE_HTTPS = true;
                USE_BASIC_AUTH = true;
            }
            else // Show help
            {
                System.out.println("Usage: \n\tSDM_WebRepo_ClientTest http \t\t(HTTP server)" + 
                    "\n\tSDM_WebRepo_ClientTest http+auth \t(HTTP server + basic authentication)" + 
                    "\n\tSDM_WebRepo_ClientTest https+auth \t(HTTPS server + basic authentication)");
                
                return;
            }
            
            // Set webservice url and TLS parameters
            if (!USE_HTTPS) 
            {
                // Set HTTP URL
                androidHttpTransport = new HttpTransportSE("http://localhost/SDM/WebRepo?wsdl");
            }
            else
            {
                // Create a trust manager that does not validate certificate chains, 
                // and also disable hostname verification.
                // (**IMPORTANT NOTE: This is used here to allow our custom certificates 
                // for TESTING purposes, it is not suitable for a production environment)
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
                SSLContext sc = SSLContext.getInstance("TLSv1.2"); 
                sc.init(null, trustAllCerts, new java.security.SecureRandom()); // *Set 2nd argument to NULL for default trust managers
                HttpsURLConnection.setDefaultSSLSocketFactory(sc.getSocketFactory());

                // Set HTTPS URL
                androidHttpTransport = new HttpTransportSE("https://localhost/SDM/WebRepo?wsdl");
            }  
            
            // Activate basic authentication
            if (USE_BASIC_AUTH) {
                headerList_basicAuth = new ArrayList<HeaderProperty>();
                String strUserPass = BASIC_AUTH_USERNAME + ":" + BASIC_AUTH_PASSWORD;
                headerList_basicAuth.add(new HeaderProperty("Authorization", "Basic " + org.kobjects.base64.Base64.encode(strUserPass.getBytes())));
            }
            else {
                headerList_basicAuth = null;
            }

            // Export new record
            SoapObject request = new SoapObject(WS_NAMESPACE, WS_METHOD_EXPORT);
            PropertyInfo propId = new PropertyInfo();
            propId.name = "arg0"; propId.setValue("007"); propId.type = PropertyInfo.STRING_CLASS;
            request.addProperty(propId);
            PropertyInfo propUser = new PropertyInfo();
            propUser.name = "arg1"; propUser.setValue("jbond@qmail.co.uk"); propUser.type = PropertyInfo.STRING_CLASS;
            request.addProperty(propUser);
            PropertyInfo propPass = new PropertyInfo();
            propPass.name = "arg2"; propPass.setValue("G0ld3nEYE"); propPass.type = PropertyInfo.STRING_CLASS;
            request.addProperty(propPass);
            SoapSerializationEnvelope envelope = new SoapSerializationEnvelope(SoapEnvelope.VER11);
            envelope.setOutputSoapObject(request);
            androidHttpTransport.call("\"" + WS_NAMESPACE + WS_METHOD_EXPORT + "\"", envelope, headerList_basicAuth);
            System.out.println("Export result: " + envelope.getResponse().toString());
            System.out.println();

            // Read list of all record identifiers stored on the repository
            request = new SoapObject(WS_NAMESPACE, WS_METHOD_LIST);
            envelope = new SoapSerializationEnvelope(SoapEnvelope.VER11);
            envelope.setOutputSoapObject(request);
            androidHttpTransport.call("\"" + WS_NAMESPACE + WS_METHOD_LIST + "\"", envelope, headerList_basicAuth);
            Vector<SoapPrimitive> listIds = new Vector<SoapPrimitive>();
            if(envelope.getResponse() instanceof Vector) // 2+ elements
                listIds.addAll((Vector<SoapPrimitive>) envelope.getResponse());
            else if(envelope.getResponse() instanceof SoapPrimitive) // 1 element
                listIds.add((SoapPrimitive)envelope.getResponse());
            System.out.println("List of records stored on the repo: ");
            for(int i = 0; i < listIds.size(); i++)
            {
                System.out.println("- " + listIds.get(i).toString());
            }
            System.out.println();
            
            // Import existing record
            if (listIds.size() > 0)
            {
                request = new SoapObject(WS_NAMESPACE, WS_METHOD_IMPORT);
                propId = new PropertyInfo();
                propId.name = "arg0"; propId.setValue(listIds.get(0).toString()); propId.type = PropertyInfo.STRING_CLASS;
                request.addProperty(propId);
                envelope = new SoapSerializationEnvelope(SoapEnvelope.VER11);
                envelope.setOutputSoapObject(request);
                androidHttpTransport.call("\"" + WS_NAMESPACE + WS_METHOD_IMPORT + "\"", envelope, headerList_basicAuth);
                
                Vector<SoapPrimitive> importedRecord = (Vector<SoapPrimitive>)envelope.getResponse();
                if(importedRecord.size() == 3)
                {
                    System.out.println("Record imported successfully: ");
                    System.out.println("ID: " + importedRecord.get(0));
                    System.out.println("Username: " + importedRecord.get(1));
                    System.out.println("Password: " + importedRecord.get(2));
                } 
                else
                    System.out.println("Import error - " + importedRecord.get(0));
            }
            else System.out.println("Import aborted - No records found on the repo");
            System.out.println();
        }
        catch(Exception ex)
        {
            System.out.println("ERROR - " + ex.toString());
        }
    }
}
