.class public Lcom/gonzalezolmedo/credhub/repository/RetrieveCredentialListTask;
.super Landroid/os/AsyncTask;
.source "RetrieveCredentialListTask.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Ljava/util/List<",
        "Ljava/lang/String;",
        ">;>;"
    }
.end annotation


# static fields
.field private static final WS_METHOD_LIST:Ljava/lang/String; = "ListCredentials"

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

    .line 17
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    const-string v0, "RetrieveCredentialListTask"

    .line 18
    iput-object v0, p0, Lcom/gonzalezolmedo/credhub/repository/RetrieveCredentialListTask;->TAG:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 17
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/gonzalezolmedo/credhub/repository/RetrieveCredentialListTask;->doInBackground([Ljava/lang/Void;)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/util/List;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Void;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    const-string p1, "RetrieveCredentialListTask"

    .line 26
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 28
    :try_start_0
    new-instance v1, Lorg/ksoap2/transport/HttpTransportSE;

    const-string v2, "http://10.0.2.2:80/SDM/WebRepo?wsdl"

    invoke-direct {v1, v2}, Lorg/ksoap2/transport/HttpTransportSE;-><init>(Ljava/lang/String;)V

    sput-object v1, Lcom/gonzalezolmedo/credhub/repository/RetrieveCredentialListTask;->androidHttpTransport:Lorg/ksoap2/transport/HttpTransportSE;

    .line 30
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    sput-object v1, Lcom/gonzalezolmedo/credhub/repository/RetrieveCredentialListTask;->headerList_basicAuth:Ljava/util/List;

    .line 31
    invoke-static {}, Lcom/gonzalezolmedo/credhub/repository/SingletonCredential;->getInstance()Lcom/gonzalezolmedo/credhub/repository/SingletonCredential;

    move-result-object v1

    .line 32
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

    .line 33
    sget-object v2, Lcom/gonzalezolmedo/credhub/repository/RetrieveCredentialListTask;->headerList_basicAuth:Ljava/util/List;

    new-instance v3, Lorg/ksoap2/HeaderProperty;

    const-string v4, "Authorization"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Basic "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    invoke-static {v1}, Lorg/kobjects/base64/Base64;->encode([B)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v3, v4, v1}, Lorg/ksoap2/HeaderProperty;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 35
    new-instance v1, Lorg/ksoap2/serialization/SoapObject;

    const-string v2, "http://sdm_webrepo/"

    const-string v3, "ListCredentials"

    invoke-direct {v1, v2, v3}, Lorg/ksoap2/serialization/SoapObject;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    new-instance v2, Lorg/ksoap2/serialization/SoapSerializationEnvelope;

    const/16 v3, 0x6e

    invoke-direct {v2, v3}, Lorg/ksoap2/serialization/SoapSerializationEnvelope;-><init>(I)V

    .line 37
    invoke-virtual {v2, v1}, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->setOutputSoapObject(Ljava/lang/Object;)V

    .line 38
    sget-object v1, Lcom/gonzalezolmedo/credhub/repository/RetrieveCredentialListTask;->androidHttpTransport:Lorg/ksoap2/transport/HttpTransportSE;

    const-string v3, "\"http://sdm_webrepo/ListCredentials\""

    sget-object v4, Lcom/gonzalezolmedo/credhub/repository/RetrieveCredentialListTask;->headerList_basicAuth:Ljava/util/List;

    invoke-virtual {v1, v3, v2, v4}, Lorg/ksoap2/transport/HttpTransportSE;->call(Ljava/lang/String;Lorg/ksoap2/SoapEnvelope;Ljava/util/List;)Ljava/util/List;

    .line 40
    new-instance v1, Ljava/util/Vector;

    invoke-direct {v1}, Ljava/util/Vector;-><init>()V

    .line 42
    invoke-virtual {v2}, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->getResponse()Ljava/lang/Object;

    move-result-object v3

    instance-of v3, v3, Ljava/util/Vector;

    if-eqz v3, :cond_0

    .line 43
    invoke-virtual {v2}, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->getResponse()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Vector;

    invoke-virtual {v1, v2}, Ljava/util/Vector;->addAll(Ljava/util/Collection;)Z

    goto :goto_0

    .line 44
    :cond_0
    invoke-virtual {v2}, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->getResponse()Ljava/lang/Object;

    move-result-object v3

    instance-of v3, v3, Lorg/ksoap2/serialization/SoapPrimitive;

    if-eqz v3, :cond_1

    .line 45
    invoke-virtual {v2}, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->getResponse()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/ksoap2/serialization/SoapPrimitive;

    invoke-virtual {v1, v2}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    :cond_1
    :goto_0
    const-string v2, "doInBackground: got credential list from server"

    .line 48
    invoke-static {p1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v2, 0x0

    .line 50
    :goto_1
    invoke-virtual {v1}, Ljava/util/Vector;->size()I

    move-result v3

    if-ge v2, v3, :cond_2

    .line 51
    invoke-virtual {v1, v2}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/ksoap2/serialization/SoapPrimitive;

    invoke-virtual {v3}, Lorg/ksoap2/serialization/SoapPrimitive;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_2
    return-object v0

    :catch_0
    move-exception v0

    const-string v1, "doInBackground: error while making http request to repo"

    .line 56
    invoke-static {p1, v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    const/4 p1, 0x0

    return-object p1
.end method
