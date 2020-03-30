.class public abstract Lorg/ksoap2/transport/Transport;
.super Ljava/lang/Object;
.source "Transport.java"


# static fields
.field protected static final CONTENT_TYPE_SOAP_XML_CHARSET_UTF_8:Ljava/lang/String; = "application/soap+xml;charset=utf-8"

.field protected static final CONTENT_TYPE_XML_CHARSET_UTF_8:Ljava/lang/String; = "text/xml;charset=utf-8"

.field protected static final USER_AGENT:Ljava/lang/String; = "ksoap2-android/2.6.0+"


# instance fields
.field private bufferLength:I

.field public debug:Z

.field private prefixes:Ljava/util/HashMap;

.field protected proxy:Ljava/net/Proxy;

.field protected readTimeout:I

.field public requestDump:Ljava/lang/String;

.field public responseDump:Ljava/lang/String;

.field protected timeout:I

.field protected url:Ljava/lang/String;

.field private xmlVersionTag:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 79
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x4e20

    .line 53
    iput v0, p0, Lorg/ksoap2/transport/Transport;->timeout:I

    .line 54
    iput v0, p0, Lorg/ksoap2/transport/Transport;->readTimeout:I

    const-string v0, ""

    .line 61
    iput-object v0, p0, Lorg/ksoap2/transport/Transport;->xmlVersionTag:Ljava/lang/String;

    const/high16 v0, 0x40000

    .line 67
    iput v0, p0, Lorg/ksoap2/transport/Transport;->bufferLength:I

    .line 69
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/ksoap2/transport/Transport;->prefixes:Ljava/util/HashMap;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x0

    .line 83
    invoke-direct {p0, v0, p1}, Lorg/ksoap2/transport/Transport;-><init>(Ljava/net/Proxy;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;I)V
    .locals 1

    .line 86
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x4e20

    .line 53
    iput v0, p0, Lorg/ksoap2/transport/Transport;->timeout:I

    .line 54
    iput v0, p0, Lorg/ksoap2/transport/Transport;->readTimeout:I

    const-string v0, ""

    .line 61
    iput-object v0, p0, Lorg/ksoap2/transport/Transport;->xmlVersionTag:Ljava/lang/String;

    const/high16 v0, 0x40000

    .line 67
    iput v0, p0, Lorg/ksoap2/transport/Transport;->bufferLength:I

    .line 69
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/ksoap2/transport/Transport;->prefixes:Ljava/util/HashMap;

    .line 87
    iput-object p1, p0, Lorg/ksoap2/transport/Transport;->url:Ljava/lang/String;

    .line 88
    iput p2, p0, Lorg/ksoap2/transport/Transport;->timeout:I

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;II)V
    .locals 1

    .line 91
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x4e20

    .line 53
    iput v0, p0, Lorg/ksoap2/transport/Transport;->timeout:I

    .line 54
    iput v0, p0, Lorg/ksoap2/transport/Transport;->readTimeout:I

    const-string v0, ""

    .line 61
    iput-object v0, p0, Lorg/ksoap2/transport/Transport;->xmlVersionTag:Ljava/lang/String;

    const/high16 v0, 0x40000

    .line 67
    iput v0, p0, Lorg/ksoap2/transport/Transport;->bufferLength:I

    .line 69
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/ksoap2/transport/Transport;->prefixes:Ljava/util/HashMap;

    .line 92
    iput-object p1, p0, Lorg/ksoap2/transport/Transport;->url:Ljava/lang/String;

    .line 93
    iput p2, p0, Lorg/ksoap2/transport/Transport;->timeout:I

    .line 94
    iput p2, p0, Lorg/ksoap2/transport/Transport;->readTimeout:I

    .line 95
    iput p3, p0, Lorg/ksoap2/transport/Transport;->bufferLength:I

    return-void
.end method

.method public constructor <init>(Ljava/net/Proxy;Ljava/lang/String;)V
    .locals 1

    .line 109
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x4e20

    .line 53
    iput v0, p0, Lorg/ksoap2/transport/Transport;->timeout:I

    .line 54
    iput v0, p0, Lorg/ksoap2/transport/Transport;->readTimeout:I

    const-string v0, ""

    .line 61
    iput-object v0, p0, Lorg/ksoap2/transport/Transport;->xmlVersionTag:Ljava/lang/String;

    const/high16 v0, 0x40000

    .line 67
    iput v0, p0, Lorg/ksoap2/transport/Transport;->bufferLength:I

    .line 69
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/ksoap2/transport/Transport;->prefixes:Ljava/util/HashMap;

    .line 110
    iput-object p1, p0, Lorg/ksoap2/transport/Transport;->proxy:Ljava/net/Proxy;

    .line 111
    iput-object p2, p0, Lorg/ksoap2/transport/Transport;->url:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/net/Proxy;Ljava/lang/String;I)V
    .locals 1

    .line 114
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x4e20

    .line 53
    iput v0, p0, Lorg/ksoap2/transport/Transport;->timeout:I

    .line 54
    iput v0, p0, Lorg/ksoap2/transport/Transport;->readTimeout:I

    const-string v0, ""

    .line 61
    iput-object v0, p0, Lorg/ksoap2/transport/Transport;->xmlVersionTag:Ljava/lang/String;

    const/high16 v0, 0x40000

    .line 67
    iput v0, p0, Lorg/ksoap2/transport/Transport;->bufferLength:I

    .line 69
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/ksoap2/transport/Transport;->prefixes:Ljava/util/HashMap;

    .line 115
    iput-object p1, p0, Lorg/ksoap2/transport/Transport;->proxy:Ljava/net/Proxy;

    .line 116
    iput-object p2, p0, Lorg/ksoap2/transport/Transport;->url:Ljava/lang/String;

    .line 117
    iput p3, p0, Lorg/ksoap2/transport/Transport;->timeout:I

    .line 118
    iput p3, p0, Lorg/ksoap2/transport/Transport;->readTimeout:I

    return-void
.end method

.method public constructor <init>(Ljava/net/Proxy;Ljava/lang/String;II)V
    .locals 1

    .line 121
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x4e20

    .line 53
    iput v0, p0, Lorg/ksoap2/transport/Transport;->timeout:I

    .line 54
    iput v0, p0, Lorg/ksoap2/transport/Transport;->readTimeout:I

    const-string v0, ""

    .line 61
    iput-object v0, p0, Lorg/ksoap2/transport/Transport;->xmlVersionTag:Ljava/lang/String;

    const/high16 v0, 0x40000

    .line 67
    iput v0, p0, Lorg/ksoap2/transport/Transport;->bufferLength:I

    .line 69
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/ksoap2/transport/Transport;->prefixes:Ljava/util/HashMap;

    .line 122
    iput-object p1, p0, Lorg/ksoap2/transport/Transport;->proxy:Ljava/net/Proxy;

    .line 123
    iput-object p2, p0, Lorg/ksoap2/transport/Transport;->url:Ljava/lang/String;

    .line 124
    iput p3, p0, Lorg/ksoap2/transport/Transport;->timeout:I

    .line 125
    iput p3, p0, Lorg/ksoap2/transport/Transport;->readTimeout:I

    .line 126
    iput p4, p0, Lorg/ksoap2/transport/Transport;->bufferLength:I

    return-void
.end method


# virtual methods
.method public abstract call(Ljava/lang/String;Lorg/ksoap2/SoapEnvelope;Ljava/util/List;)Ljava/util/List;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/xmlpull/v1/XmlPullParserException;
        }
    .end annotation
.end method

.method public abstract call(Ljava/lang/String;Lorg/ksoap2/SoapEnvelope;Ljava/util/List;Ljava/io/File;)Ljava/util/List;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/xmlpull/v1/XmlPullParserException;
        }
    .end annotation
.end method

.method public call(Ljava/lang/String;Lorg/ksoap2/SoapEnvelope;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/xmlpull/v1/XmlPullParserException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 269
    invoke-virtual {p0, p1, p2, v0}, Lorg/ksoap2/transport/Transport;->call(Ljava/lang/String;Lorg/ksoap2/SoapEnvelope;Ljava/util/List;)Ljava/util/List;

    return-void
.end method

.method protected createRequestData(Lorg/ksoap2/SoapEnvelope;)[B
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 177
    invoke-virtual {p0, p1, v0}, Lorg/ksoap2/transport/Transport;->createRequestData(Lorg/ksoap2/SoapEnvelope;Ljava/lang/String;)[B

    move-result-object p1

    return-object p1
.end method

.method protected createRequestData(Lorg/ksoap2/SoapEnvelope;Ljava/lang/String;)[B
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 149
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    iget v1, p0, Lorg/ksoap2/transport/Transport;->bufferLength:I

    invoke-direct {v0, v1}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    .line 151
    iget-object v1, p0, Lorg/ksoap2/transport/Transport;->xmlVersionTag:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/ByteArrayOutputStream;->write([B)V

    .line 152
    new-instance v1, Lorg/kxml2/io/KXmlSerializer;

    invoke-direct {v1}, Lorg/kxml2/io/KXmlSerializer;-><init>()V

    .line 154
    iget-object v2, p0, Lorg/ksoap2/transport/Transport;->prefixes:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 156
    invoke-interface {v1, v0, p2}, Lorg/xmlpull/v1/XmlSerializer;->setOutput(Ljava/io/OutputStream;Ljava/lang/String;)V

    .line 157
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_0

    .line 158
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/String;

    .line 159
    iget-object v3, p0, Lorg/ksoap2/transport/Transport;->prefixes:Ljava/util/HashMap;

    invoke-virtual {v3, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-interface {v1, p2, v3}, Lorg/xmlpull/v1/XmlSerializer;->setPrefix(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 161
    :cond_0
    invoke-virtual {p1, v1}, Lorg/ksoap2/SoapEnvelope;->write(Lorg/xmlpull/v1/XmlSerializer;)V

    .line 162
    invoke-interface {v1}, Lorg/xmlpull/v1/XmlSerializer;->flush()V

    const/16 p1, 0xd

    .line 163
    invoke-virtual {v0, p1}, Ljava/io/ByteArrayOutputStream;->write(I)V

    const/16 p1, 0xa

    .line 164
    invoke-virtual {v0, p1}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 165
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->flush()V

    .line 166
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p1

    return-object p1
.end method

.method public getHost()Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/MalformedURLException;
        }
    .end annotation

    .line 279
    new-instance v0, Ljava/net/URL;

    iget-object v1, p0, Lorg/ksoap2/transport/Transport;->url:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getPath()Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/MalformedURLException;
        }
    .end annotation

    .line 300
    new-instance v0, Ljava/net/URL;

    iget-object v1, p0, Lorg/ksoap2/transport/Transport;->url:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/net/URL;->getPath()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getPort()I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/MalformedURLException;
        }
    .end annotation

    .line 290
    new-instance v0, Ljava/net/URL;

    iget-object v1, p0, Lorg/ksoap2/transport/Transport;->url:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/net/URL;->getPort()I

    move-result v0

    return v0
.end method

.method public getPrefixes()Ljava/util/HashMap;
    .locals 1

    .line 72
    iget-object v0, p0, Lorg/ksoap2/transport/Transport;->prefixes:Ljava/util/HashMap;

    return-object v0
.end method

.method public abstract getServiceConnection()Lorg/ksoap2/transport/ServiceConnection;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public getUrl()Ljava/lang/String;
    .locals 1

    .line 192
    iget-object v0, p0, Lorg/ksoap2/transport/Transport;->url:Ljava/lang/String;

    return-object v0
.end method

.method protected parseResponse(Lorg/ksoap2/SoapEnvelope;Ljava/io/InputStream;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 134
    new-instance v0, Lorg/kxml2/io/KXmlParser;

    invoke-direct {v0}, Lorg/kxml2/io/KXmlParser;-><init>()V

    const-string v1, "http://xmlpull.org/v1/doc/features.html#process-namespaces"

    const/4 v2, 0x1

    .line 135
    invoke-interface {v0, v1, v2}, Lorg/xmlpull/v1/XmlPullParser;->setFeature(Ljava/lang/String;Z)V

    const/4 v1, 0x0

    .line 136
    invoke-interface {v0, p2, v1}, Lorg/xmlpull/v1/XmlPullParser;->setInput(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 137
    invoke-virtual {p1, v0}, Lorg/ksoap2/SoapEnvelope;->parse(Lorg/xmlpull/v1/XmlPullParser;)V

    .line 141
    invoke-virtual {p2}, Ljava/io/InputStream;->close()V

    return-void
.end method

.method public reset()V
    .locals 0

    return-void
.end method

.method public setReadTimeout(I)V
    .locals 0

    .line 76
    iput p1, p0, Lorg/ksoap2/transport/Transport;->readTimeout:I

    return-void
.end method

.method public setUrl(Ljava/lang/String;)V
    .locals 0

    .line 187
    iput-object p1, p0, Lorg/ksoap2/transport/Transport;->url:Ljava/lang/String;

    return-void
.end method

.method public setXmlVersionTag(Ljava/lang/String;)V
    .locals 0

    .line 204
    iput-object p1, p0, Lorg/ksoap2/transport/Transport;->xmlVersionTag:Ljava/lang/String;

    return-void
.end method
