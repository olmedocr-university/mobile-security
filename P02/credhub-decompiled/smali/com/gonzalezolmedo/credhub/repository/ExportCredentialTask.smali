.class public Lcom/gonzalezolmedo/credhub/repository/ExportCredentialTask;
.super Landroid/os/AsyncTask;
.source "ExportCredentialTask.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/lang/String;",
        "Ljava/lang/Void;",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation


# static fields
.field private static final WS_METHOD_EXPORT:Ljava/lang/String; = "ExportRecord"

.field private static final WS_NAMESPACE:Ljava/lang/String; = "http://sdm_webrepo/"

.field private static androidHttpTransport:Lorg/ksoap2/transport/HttpTransportSE;

.field private static headerList_basicAuth:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lorg/ksoap2/HeaderProperty;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final TAG:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 21
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    const-string v0, "ExportCredentialTask"

    .line 22
    iput-object v0, p0, Lcom/gonzalezolmedo/credhub/repository/ExportCredentialTask;->TAG:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 6

    const-string v0, "ExportCredentialTask"

    .line 30
    new-instance v1, Lorg/ksoap2/transport/HttpTransportSE;

    const-string v2, "http://10.0.2.2:80/SDM/WebRepo?wsdl"

    invoke-direct {v1, v2}, Lorg/ksoap2/transport/HttpTransportSE;-><init>(Ljava/lang/String;)V

    sput-object v1, Lcom/gonzalezolmedo/credhub/repository/ExportCredentialTask;->androidHttpTransport:Lorg/ksoap2/transport/HttpTransportSE;

    .line 32
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    sput-object v1, Lcom/gonzalezolmedo/credhub/repository/ExportCredentialTask;->headerList_basicAuth:Ljava/util/List;

    .line 33
    invoke-static {}, Lcom/gonzalezolmedo/credhub/repository/SingletonCredential;->getInstance()Lcom/gonzalezolmedo/credhub/repository/SingletonCredential;

    move-result-object v1

    .line 34
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, v1, Lcom/gonzalezolmedo/credhub/repository/SingletonCredential;->username:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ":"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, v1, Lcom/gonzalezolmedo/credhub/repository/SingletonCredential;->password:Ljava/lang/String;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 35
    sget-object v2, Lcom/gonzalezolmedo/credhub/repository/ExportCredentialTask;->headerList_basicAuth:Ljava/util/List;

    new-instance v3, Lorg/ksoap2/HeaderProperty;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Basic "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    invoke-static {v1}, Lorg/kobjects/base64/Base64;->encode([B)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v4, "Authorization"

    invoke-direct {v3, v4, v1}, Lorg/ksoap2/HeaderProperty;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 37
    new-instance v1, Lorg/ksoap2/serialization/SoapObject;

    const-string v2, "http://sdm_webrepo/"

    const-string v3, "ExportRecord"

    invoke-direct {v1, v2, v3}, Lorg/ksoap2/serialization/SoapObject;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 39
    new-instance v2, Lorg/ksoap2/serialization/PropertyInfo;

    invoke-direct {v2}, Lorg/ksoap2/serialization/PropertyInfo;-><init>()V

    const-string v3, "arg0"

    .line 40
    iput-object v3, v2, Lorg/ksoap2/serialization/PropertyInfo;->name:Ljava/lang/String;

    const/4 v3, 0x0

    .line 41
    aget-object v4, p1, v3

    invoke-virtual {v2, v4}, Lorg/ksoap2/serialization/PropertyInfo;->setValue(Ljava/lang/Object;)V

    .line 42
    sget-object v4, Lorg/ksoap2/serialization/PropertyInfo;->STRING_CLASS:Ljava/lang/Class;

    iput-object v4, v2, Lorg/ksoap2/serialization/PropertyInfo;->type:Ljava/lang/Object;

    .line 43
    invoke-virtual {v1, v2}, Lorg/ksoap2/serialization/SoapObject;->addProperty(Lorg/ksoap2/serialization/PropertyInfo;)Lorg/ksoap2/serialization/SoapObject;

    .line 45
    new-instance v2, Lorg/ksoap2/serialization/PropertyInfo;

    invoke-direct {v2}, Lorg/ksoap2/serialization/PropertyInfo;-><init>()V

    const-string v4, "arg1"

    .line 46
    iput-object v4, v2, Lorg/ksoap2/serialization/PropertyInfo;->name:Ljava/lang/String;

    const/4 v4, 0x1

    .line 47
    aget-object v5, p1, v4

    invoke-virtual {v2, v5}, Lorg/ksoap2/serialization/PropertyInfo;->setValue(Ljava/lang/Object;)V

    .line 48
    sget-object v5, Lorg/ksoap2/serialization/PropertyInfo;->STRING_CLASS:Ljava/lang/Class;

    iput-object v5, v2, Lorg/ksoap2/serialization/PropertyInfo;->type:Ljava/lang/Object;

    .line 49
    invoke-virtual {v1, v2}, Lorg/ksoap2/serialization/SoapObject;->addProperty(Lorg/ksoap2/serialization/PropertyInfo;)Lorg/ksoap2/serialization/SoapObject;

    .line 51
    new-instance v2, Lorg/ksoap2/serialization/PropertyInfo;

    invoke-direct {v2}, Lorg/ksoap2/serialization/PropertyInfo;-><init>()V

    const-string v5, "arg2"

    .line 52
    iput-object v5, v2, Lorg/ksoap2/serialization/PropertyInfo;->name:Ljava/lang/String;

    const/4 v5, 0x2

    .line 53
    aget-object p1, p1, v5

    invoke-virtual {v2, p1}, Lorg/ksoap2/serialization/PropertyInfo;->setValue(Ljava/lang/Object;)V

    .line 54
    sget-object p1, Lorg/ksoap2/serialization/PropertyInfo;->STRING_CLASS:Ljava/lang/Class;

    iput-object p1, v2, Lorg/ksoap2/serialization/PropertyInfo;->type:Ljava/lang/Object;

    .line 55
    invoke-virtual {v1, v2}, Lorg/ksoap2/serialization/SoapObject;->addProperty(Lorg/ksoap2/serialization/PropertyInfo;)Lorg/ksoap2/serialization/SoapObject;

    .line 58
    new-instance p1, Lorg/ksoap2/serialization/SoapSerializationEnvelope;

    const/16 v2, 0x6e

    invoke-direct {p1, v2}, Lorg/ksoap2/serialization/SoapSerializationEnvelope;-><init>(I)V

    .line 59
    invoke-virtual {p1, v1}, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->setOutputSoapObject(Ljava/lang/Object;)V

    .line 62
    :try_start_0
    sget-object v1, Lcom/gonzalezolmedo/credhub/repository/ExportCredentialTask;->androidHttpTransport:Lorg/ksoap2/transport/HttpTransportSE;

    const-string v2, "\"http://sdm_webrepo/ExportRecord\""

    sget-object v5, Lcom/gonzalezolmedo/credhub/repository/ExportCredentialTask;->headerList_basicAuth:Ljava/util/List;

    invoke-virtual {v1, v2, p1, v5}, Lorg/ksoap2/transport/HttpTransportSE;->call(Ljava/lang/String;Lorg/ksoap2/SoapEnvelope;Ljava/util/List;)Ljava/util/List;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v1

    goto :goto_0

    :catch_1
    move-exception v1

    :goto_0
    const-string v2, "doInBackground: error in SOAP call "

    .line 64
    invoke-static {v0, v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 68
    :goto_1
    :try_start_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "doInBackground: export result: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->getResponse()Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 69
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1
    :try_end_1
    .catch Lorg/ksoap2/SoapFault; {:try_start_1 .. :try_end_1} :catch_2

    return-object p1

    :catch_2
    move-exception p1

    const-string v1, "doInBackground: error in response"

    .line 71
    invoke-static {v0, v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 74
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 21
    check-cast p1, [Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/gonzalezolmedo/credhub/repository/ExportCredentialTask;->doInBackground([Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1
.end method
