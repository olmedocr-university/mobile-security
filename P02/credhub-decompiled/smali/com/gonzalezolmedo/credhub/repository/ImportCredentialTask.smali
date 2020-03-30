.class public Lcom/gonzalezolmedo/credhub/repository/ImportCredentialTask;
.super Landroid/os/AsyncTask;
.source "ImportCredentialTask.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/lang/String;",
        "Ljava/lang/Void;",
        "Lcom/gonzalezolmedo/credhub/model/Credential;",
        ">;"
    }
.end annotation


# static fields
.field private static final WS_METHOD_IMPORT:Ljava/lang/String; = "ImportRecord"

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

    .line 20
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    const-string v0, "ImportCredentialTask"

    .line 21
    iput-object v0, p0, Lcom/gonzalezolmedo/credhub/repository/ImportCredentialTask;->TAG:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/String;)Lcom/gonzalezolmedo/credhub/model/Credential;
    .locals 8

    const-string v0, "ImportCredentialTask"

    const/4 v1, 0x0

    .line 30
    :try_start_0
    new-instance v2, Lorg/ksoap2/transport/HttpTransportSE;

    const-string v3, "http://10.0.2.2:80/SDM/WebRepo?wsdl"

    invoke-direct {v2, v3}, Lorg/ksoap2/transport/HttpTransportSE;-><init>(Ljava/lang/String;)V

    sput-object v2, Lcom/gonzalezolmedo/credhub/repository/ImportCredentialTask;->androidHttpTransport:Lorg/ksoap2/transport/HttpTransportSE;

    .line 32
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    sput-object v2, Lcom/gonzalezolmedo/credhub/repository/ImportCredentialTask;->headerList_basicAuth:Ljava/util/List;

    .line 33
    invoke-static {}, Lcom/gonzalezolmedo/credhub/repository/SingletonCredential;->getInstance()Lcom/gonzalezolmedo/credhub/repository/SingletonCredential;

    move-result-object v2

    .line 34
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, v2, Lcom/gonzalezolmedo/credhub/repository/SingletonCredential;->username:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, ":"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, v2, Lcom/gonzalezolmedo/credhub/repository/SingletonCredential;->password:Ljava/lang/String;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 35
    sget-object v3, Lcom/gonzalezolmedo/credhub/repository/ImportCredentialTask;->headerList_basicAuth:Ljava/util/List;

    new-instance v4, Lorg/ksoap2/HeaderProperty;

    const-string v5, "Authorization"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Basic "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B

    move-result-object v2

    invoke-static {v2}, Lorg/kobjects/base64/Base64;->encode([B)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v4, v5, v2}, Lorg/ksoap2/HeaderProperty;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 37
    new-instance v2, Lorg/ksoap2/serialization/PropertyInfo;

    invoke-direct {v2}, Lorg/ksoap2/serialization/PropertyInfo;-><init>()V

    const-string v3, "arg0"

    .line 38
    iput-object v3, v2, Lorg/ksoap2/serialization/PropertyInfo;->name:Ljava/lang/String;

    const/4 v3, 0x0

    .line 39
    aget-object p1, p1, v3

    invoke-virtual {v2, p1}, Lorg/ksoap2/serialization/PropertyInfo;->setValue(Ljava/lang/Object;)V

    .line 40
    sget-object p1, Lorg/ksoap2/serialization/PropertyInfo;->STRING_CLASS:Ljava/lang/Class;

    iput-object p1, v2, Lorg/ksoap2/serialization/PropertyInfo;->type:Ljava/lang/Object;

    .line 42
    new-instance p1, Lorg/ksoap2/serialization/SoapObject;

    const-string v4, "http://sdm_webrepo/"

    const-string v5, "ImportRecord"

    invoke-direct {p1, v4, v5}, Lorg/ksoap2/serialization/SoapObject;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 43
    invoke-virtual {p1, v2}, Lorg/ksoap2/serialization/SoapObject;->addProperty(Lorg/ksoap2/serialization/PropertyInfo;)Lorg/ksoap2/serialization/SoapObject;

    .line 45
    new-instance v2, Lorg/ksoap2/serialization/SoapSerializationEnvelope;

    const/16 v4, 0x6e

    invoke-direct {v2, v4}, Lorg/ksoap2/serialization/SoapSerializationEnvelope;-><init>(I)V

    .line 46
    invoke-virtual {v2, p1}, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->setOutputSoapObject(Ljava/lang/Object;)V

    .line 48
    sget-object p1, Lcom/gonzalezolmedo/credhub/repository/ImportCredentialTask;->androidHttpTransport:Lorg/ksoap2/transport/HttpTransportSE;

    const-string v4, "\"http://sdm_webrepo/ImportRecord\""

    sget-object v5, Lcom/gonzalezolmedo/credhub/repository/ImportCredentialTask;->headerList_basicAuth:Ljava/util/List;

    invoke-virtual {p1, v4, v2, v5}, Lorg/ksoap2/transport/HttpTransportSE;->call(Ljava/lang/String;Lorg/ksoap2/SoapEnvelope;Ljava/util/List;)Ljava/util/List;

    .line 50
    invoke-virtual {v2}, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->getResponse()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/Vector;

    .line 52
    invoke-virtual {p1}, Ljava/util/Vector;->size()I

    move-result v2

    const/4 v4, 0x3

    if-ne v2, v4, :cond_0

    const-string v2, "doInBackground: record imported successfully"

    .line 53
    invoke-static {v0, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 54
    new-instance v2, Lcom/gonzalezolmedo/credhub/model/Credential;

    invoke-virtual {p1, v3}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/ksoap2/serialization/SoapPrimitive;

    invoke-virtual {v3}, Lorg/ksoap2/serialization/SoapPrimitive;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x1

    invoke-virtual {p1, v4}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/ksoap2/serialization/SoapPrimitive;

    invoke-virtual {v4}, Lorg/ksoap2/serialization/SoapPrimitive;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x2

    invoke-virtual {p1, v5}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/ksoap2/serialization/SoapPrimitive;

    invoke-virtual {p1}, Lorg/ksoap2/serialization/SoapPrimitive;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v2, v3, v4, p1, v1}, Lcom/gonzalezolmedo/credhub/model/Credential;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/graphics/drawable/Drawable;)V

    return-object v2

    :cond_0
    const-string p1, "doInBackground: record received does not match credential structure"

    .line 56
    invoke-static {v0, p1, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const-string v2, "doInBackground: error while making http request to repo"

    .line 60
    invoke-static {v0, v2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_0
    return-object v1
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 20
    check-cast p1, [Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/gonzalezolmedo/credhub/repository/ImportCredentialTask;->doInBackground([Ljava/lang/String;)Lcom/gonzalezolmedo/credhub/model/Credential;

    move-result-object p1

    return-object p1
.end method
