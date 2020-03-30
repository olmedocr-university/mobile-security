.class public Lorg/ksoap2/transport/HttpTransportSE;
.super Lorg/ksoap2/transport/Transport;
.source "HttpTransportSE.java"


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x0

    .line 49
    invoke-direct {p0, v0, p1}, Lorg/ksoap2/transport/Transport;-><init>(Ljava/net/Proxy;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .line 74
    invoke-direct {p0, p1, p2}, Lorg/ksoap2/transport/Transport;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;II)V
    .locals 0

    .line 92
    invoke-direct {p0, p1, p2}, Lorg/ksoap2/transport/Transport;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public constructor <init>(Ljava/net/Proxy;Ljava/lang/String;)V
    .locals 0

    .line 62
    invoke-direct {p0, p1, p2}, Lorg/ksoap2/transport/Transport;-><init>(Ljava/net/Proxy;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/net/Proxy;Ljava/lang/String;I)V
    .locals 0

    .line 78
    invoke-direct {p0, p1, p2, p3}, Lorg/ksoap2/transport/Transport;-><init>(Ljava/net/Proxy;Ljava/lang/String;I)V

    return-void
.end method

.method public constructor <init>(Ljava/net/Proxy;Ljava/lang/String;II)V
    .locals 0

    .line 96
    invoke-direct {p0, p1, p2, p3}, Lorg/ksoap2/transport/Transport;-><init>(Ljava/net/Proxy;Ljava/lang/String;I)V

    return-void
.end method

.method private getUnZippedInputStream(Ljava/io/InputStream;)Ljava/io/InputStream;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 347
    :try_start_0
    check-cast p1, Ljava/util/zip/GZIPInputStream;
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    .line 349
    :catch_0
    new-instance v0, Ljava/util/zip/GZIPInputStream;

    invoke-direct {v0, p1}, Ljava/util/zip/GZIPInputStream;-><init>(Ljava/io/InputStream;)V

    return-object v0
.end method

.method private readDebug(Ljava/io/InputStream;ILjava/io/File;)Ljava/io/InputStream;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    if-eqz p3, :cond_0

    .line 311
    new-instance p2, Ljava/io/FileOutputStream;

    invoke-direct {p2, p3}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    goto :goto_1

    .line 314
    :cond_0
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    if-lez p2, :cond_1

    goto :goto_0

    :cond_1
    const/high16 p2, 0x40000

    :goto_0
    invoke-direct {v0, p2}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    move-object p2, v0

    :goto_1
    const/16 v0, 0x100

    new-array v1, v0, [B

    :goto_2
    const/4 v2, 0x0

    .line 320
    invoke-virtual {p1, v1, v2, v0}, Ljava/io/InputStream;->read([BII)I

    move-result v3

    const/4 v4, -0x1

    if-ne v3, v4, :cond_4

    .line 327
    invoke-virtual {p2}, Ljava/io/OutputStream;->flush()V

    .line 328
    instance-of v0, p2, Ljava/io/ByteArrayOutputStream;

    if-eqz v0, :cond_2

    .line 329
    check-cast p2, Ljava/io/ByteArrayOutputStream;

    invoke-virtual {p2}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v1

    .line 332
    :cond_2
    new-instance p2, Ljava/lang/String;

    invoke-direct {p2, v1}, Ljava/lang/String;-><init>([B)V

    iput-object p2, p0, Lorg/ksoap2/transport/HttpTransportSE;->responseDump:Ljava/lang/String;

    .line 333
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V

    if-eqz p3, :cond_3

    .line 336
    new-instance p1, Ljava/io/FileInputStream;

    invoke-direct {p1, p3}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    return-object p1

    .line 338
    :cond_3
    new-instance p1, Ljava/io/ByteArrayInputStream;

    invoke-direct {p1, v1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    return-object p1

    .line 324
    :cond_4
    invoke-virtual {p2, v1, v2, v3}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_2
.end method


# virtual methods
.method public call(Ljava/lang/String;Lorg/ksoap2/SoapEnvelope;Ljava/util/List;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/ksoap2/transport/HttpResponseException;,
            Ljava/io/IOException;,
            Lorg/xmlpull/v1/XmlPullParserException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 118
    invoke-virtual {p0, p1, p2, p3, v0}, Lorg/ksoap2/transport/HttpTransportSE;->call(Ljava/lang/String;Lorg/ksoap2/SoapEnvelope;Ljava/util/List;Ljava/io/File;)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method public call(Ljava/lang/String;Lorg/ksoap2/SoapEnvelope;Ljava/util/List;Ljava/io/File;)Ljava/util/List;
    .locals 17
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/ksoap2/transport/HttpResponseException;,
            Ljava/io/IOException;,
            Lorg/xmlpull/v1/XmlPullParserException;
        }
    .end annotation

    move-object/from16 v1, p0

    move-object/from16 v2, p2

    move-object/from16 v0, p3

    move-object/from16 v3, p4

    if-nez p1, :cond_0

    const-string v4, "\"\""

    goto :goto_0

    :cond_0
    move-object/from16 v4, p1

    :goto_0
    const-string v5, "UTF-8"

    .line 149
    invoke-virtual {v1, v2, v5}, Lorg/ksoap2/transport/HttpTransportSE;->createRequestData(Lorg/ksoap2/SoapEnvelope;Ljava/lang/String;)[B

    move-result-object v5

    .line 151
    iget-boolean v6, v1, Lorg/ksoap2/transport/HttpTransportSE;->debug:Z

    const/4 v7, 0x0

    if-eqz v6, :cond_1

    new-instance v6, Ljava/lang/String;

    invoke-direct {v6, v5}, Ljava/lang/String;-><init>([B)V

    goto :goto_1

    :cond_1
    move-object v6, v7

    :goto_1
    iput-object v6, v1, Lorg/ksoap2/transport/HttpTransportSE;->requestDump:Ljava/lang/String;

    .line 152
    iput-object v7, v1, Lorg/ksoap2/transport/HttpTransportSE;->responseDump:Ljava/lang/String;

    .line 154
    invoke-virtual/range {p0 .. p0}, Lorg/ksoap2/transport/HttpTransportSE;->getServiceConnection()Lorg/ksoap2/transport/ServiceConnection;

    move-result-object v6

    const-string v8, "User-Agent"

    const-string v9, "ksoap2-android/2.6.0+"

    .line 156
    invoke-interface {v6, v8, v9}, Lorg/ksoap2/transport/ServiceConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 160
    iget v8, v2, Lorg/ksoap2/SoapEnvelope;->version:I

    const/16 v9, 0x78

    if-eq v8, v9, :cond_2

    const-string v8, "SOAPAction"

    .line 161
    invoke-interface {v6, v8, v4}, Lorg/ksoap2/transport/ServiceConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 164
    :cond_2
    iget v4, v2, Lorg/ksoap2/SoapEnvelope;->version:I

    const-string v8, "Content-Type"

    if-ne v4, v9, :cond_3

    const-string v4, "application/soap+xml;charset=utf-8"

    .line 165
    invoke-interface {v6, v8, v4}, Lorg/ksoap2/transport/ServiceConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    :cond_3
    const-string v4, "text/xml;charset=utf-8"

    .line 167
    invoke-interface {v6, v8, v4}, Lorg/ksoap2/transport/ServiceConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    :goto_2
    const-string v4, "gzip"

    const-string v9, "Accept-Encoding"

    .line 172
    invoke-interface {v6, v9, v4}, Lorg/ksoap2/transport/ServiceConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v9, 0x0

    if-eqz v0, :cond_4

    move v10, v9

    .line 177
    :goto_3
    invoke-interface/range {p3 .. p3}, Ljava/util/List;->size()I

    move-result v11

    if-ge v10, v11, :cond_4

    .line 178
    invoke-interface {v0, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lorg/ksoap2/HeaderProperty;

    .line 179
    invoke-virtual {v11}, Lorg/ksoap2/HeaderProperty;->getKey()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11}, Lorg/ksoap2/HeaderProperty;->getValue()Ljava/lang/String;

    move-result-object v11

    invoke-interface {v6, v12, v11}, Lorg/ksoap2/transport/ServiceConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    add-int/lit8 v10, v10, 0x1

    goto :goto_3

    :cond_4
    const-string v0, "POST"

    .line 183
    invoke-interface {v6, v0}, Lorg/ksoap2/transport/ServiceConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 184
    invoke-virtual {v1, v5, v6, v2}, Lorg/ksoap2/transport/HttpTransportSE;->sendData([BLorg/ksoap2/transport/ServiceConnection;Lorg/ksoap2/SoapEnvelope;)V

    .line 192
    invoke-interface {v6}, Lorg/ksoap2/transport/ServiceConnection;->getResponseCode()I

    move-result v0

    .line 195
    :try_start_0
    invoke-interface {v6}, Lorg/ksoap2/transport/ServiceConnection;->getResponseProperties()Ljava/util/List;

    move-result-object v10
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2

    move v11, v9

    move v12, v11

    const/16 v13, 0x2000

    .line 197
    :goto_4
    :try_start_1
    invoke-interface {v10}, Ljava/util/List;->size()I

    move-result v14

    if-ge v9, v14, :cond_9

    .line 198
    invoke-interface {v10, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lorg/ksoap2/HeaderProperty;

    .line 200
    invoke-virtual {v14}, Lorg/ksoap2/HeaderProperty;->getKey()Ljava/lang/String;

    move-result-object v15

    const/16 v16, 0x1

    if-nez v15, :cond_5

    goto :goto_6

    .line 205
    :cond_5
    invoke-virtual {v14}, Lorg/ksoap2/HeaderProperty;->getKey()Ljava/lang/String;

    move-result-object v15

    const-string v5, "content-length"

    invoke-virtual {v15, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_6

    .line 206
    invoke-virtual {v14}, Lorg/ksoap2/HeaderProperty;->getValue()Ljava/lang/String;

    move-result-object v5
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    if-eqz v5, :cond_6

    .line 208
    :try_start_2
    invoke-virtual {v14}, Lorg/ksoap2/HeaderProperty;->getValue()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v13
    :try_end_2
    .catch Ljava/lang/NumberFormatException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_5

    :catch_0
    const/16 v13, 0x2000

    .line 218
    :cond_6
    :goto_5
    :try_start_3
    invoke-virtual {v14}, Lorg/ksoap2/HeaderProperty;->getKey()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_7

    .line 219
    invoke-virtual {v14}, Lorg/ksoap2/HeaderProperty;->getValue()Ljava/lang/String;

    move-result-object v5

    const-string v15, "xml"

    invoke-virtual {v5, v15}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_7

    move/from16 v12, v16

    .line 226
    :cond_7
    invoke-virtual {v14}, Lorg/ksoap2/HeaderProperty;->getKey()Ljava/lang/String;

    move-result-object v5

    const-string v15, "Content-Encoding"

    invoke-virtual {v5, v15}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_8

    .line 227
    invoke-virtual {v14}, Lorg/ksoap2/HeaderProperty;->getValue()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_8

    move/from16 v11, v16

    :cond_8
    :goto_6
    add-int/lit8 v9, v9, 0x1

    goto :goto_4

    :cond_9
    const/16 v4, 0xc8

    if-eq v0, v4, :cond_b

    const/16 v4, 0xca

    if-ne v0, v4, :cond_a

    goto :goto_7

    .line 235
    :cond_a
    new-instance v4, Lorg/ksoap2/transport/HttpResponseException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "HTTP request failed, HTTP status: "

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5, v0, v10}, Lorg/ksoap2/transport/HttpResponseException;-><init>(Ljava/lang/String;ILjava/util/List;)V

    throw v4

    :cond_b
    :goto_7
    if-lez v13, :cond_11

    if-eqz v11, :cond_c

    .line 240
    new-instance v0, Ljava/io/BufferedInputStream;

    .line 241
    invoke-interface {v6}, Lorg/ksoap2/transport/ServiceConnection;->openInputStream()Ljava/io/InputStream;

    move-result-object v4

    invoke-direct {v0, v4, v13}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;I)V

    .line 240
    invoke-direct {v1, v0}, Lorg/ksoap2/transport/HttpTransportSE;->getUnZippedInputStream(Ljava/io/InputStream;)Ljava/io/InputStream;

    move-result-object v7

    goto :goto_a

    .line 243
    :cond_c
    new-instance v0, Ljava/io/BufferedInputStream;

    invoke-interface {v6}, Lorg/ksoap2/transport/ServiceConnection;->openInputStream()Ljava/io/InputStream;

    move-result-object v4

    invoke-direct {v0, v4, v13}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;I)V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1

    move-object v7, v0

    goto :goto_a

    :catch_1
    move-exception v0

    move v9, v11

    move v5, v13

    goto :goto_8

    :catch_2
    move-exception v0

    move-object v10, v7

    move v12, v9

    const/16 v5, 0x2000

    :goto_8
    if-lez v5, :cond_e

    if-eqz v9, :cond_d

    .line 249
    new-instance v4, Ljava/io/BufferedInputStream;

    .line 250
    invoke-interface {v6}, Lorg/ksoap2/transport/ServiceConnection;->getErrorStream()Ljava/io/InputStream;

    move-result-object v7

    invoke-direct {v4, v7, v5}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;I)V

    .line 249
    invoke-direct {v1, v4}, Lorg/ksoap2/transport/HttpTransportSE;->getUnZippedInputStream(Ljava/io/InputStream;)Ljava/io/InputStream;

    move-result-object v7

    goto :goto_9

    .line 252
    :cond_d
    new-instance v7, Ljava/io/BufferedInputStream;

    invoke-interface {v6}, Lorg/ksoap2/transport/ServiceConnection;->getErrorStream()Ljava/io/InputStream;

    move-result-object v4

    invoke-direct {v7, v4, v5}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;I)V

    .line 256
    :cond_e
    :goto_9
    instance-of v4, v0, Lorg/ksoap2/transport/HttpResponseException;

    if-eqz v4, :cond_10

    if-nez v12, :cond_10

    .line 258
    iget-boolean v2, v1, Lorg/ksoap2/transport/HttpTransportSE;->debug:Z

    if-eqz v2, :cond_f

    if-eqz v7, :cond_f

    .line 260
    invoke-direct {v1, v7, v5, v3}, Lorg/ksoap2/transport/HttpTransportSE;->readDebug(Ljava/io/InputStream;ILjava/io/File;)Ljava/io/InputStream;

    .line 264
    :cond_f
    invoke-interface {v6}, Lorg/ksoap2/transport/ServiceConnection;->disconnect()V

    .line 265
    throw v0

    :cond_10
    move v13, v5

    .line 270
    :cond_11
    :goto_a
    iget-boolean v0, v1, Lorg/ksoap2/transport/HttpTransportSE;->debug:Z

    if-eqz v0, :cond_12

    .line 271
    invoke-direct {v1, v7, v13, v3}, Lorg/ksoap2/transport/HttpTransportSE;->readDebug(Ljava/io/InputStream;ILjava/io/File;)Ljava/io/InputStream;

    move-result-object v7

    :cond_12
    if-eqz v7, :cond_13

    .line 276
    invoke-virtual {v1, v2, v7, v10}, Lorg/ksoap2/transport/HttpTransportSE;->parseResponse(Lorg/ksoap2/SoapEnvelope;Ljava/io/InputStream;Ljava/util/List;)V

    .line 284
    :cond_13
    invoke-interface {v6}, Lorg/ksoap2/transport/ServiceConnection;->disconnect()V

    return-object v10
.end method

.method public call(Ljava/lang/String;Lorg/ksoap2/SoapEnvelope;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/ksoap2/transport/HttpResponseException;,
            Ljava/io/IOException;,
            Lorg/xmlpull/v1/XmlPullParserException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 113
    invoke-virtual {p0, p1, p2, v0}, Lorg/ksoap2/transport/HttpTransportSE;->call(Ljava/lang/String;Lorg/ksoap2/SoapEnvelope;Ljava/util/List;)Ljava/util/List;

    return-void
.end method

.method public getServiceConnection()Lorg/ksoap2/transport/ServiceConnection;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 354
    new-instance v0, Lorg/ksoap2/transport/ServiceConnectionSE;

    iget-object v1, p0, Lorg/ksoap2/transport/HttpTransportSE;->proxy:Ljava/net/Proxy;

    iget-object v2, p0, Lorg/ksoap2/transport/HttpTransportSE;->url:Ljava/lang/String;

    iget v3, p0, Lorg/ksoap2/transport/HttpTransportSE;->timeout:I

    iget v4, p0, Lorg/ksoap2/transport/HttpTransportSE;->readTimeout:I

    invoke-direct {v0, v1, v2, v3, v4}, Lorg/ksoap2/transport/ServiceConnectionSE;-><init>(Ljava/net/Proxy;Ljava/lang/String;II)V

    return-object v0
.end method

.method protected parseResponse(Lorg/ksoap2/SoapEnvelope;Ljava/io/InputStream;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 304
    invoke-virtual {p0, p1, p2}, Lorg/ksoap2/transport/HttpTransportSE;->parseResponse(Lorg/ksoap2/SoapEnvelope;Ljava/io/InputStream;)V

    return-void
.end method

.method protected sendData([BLorg/ksoap2/transport/ServiceConnection;Lorg/ksoap2/SoapEnvelope;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 292
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, ""

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    array-length v0, p1

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    const-string v0, "Content-Length"

    invoke-interface {p2, v0, p3}, Lorg/ksoap2/transport/ServiceConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 293
    array-length p3, p1

    invoke-interface {p2, p3}, Lorg/ksoap2/transport/ServiceConnection;->setFixedLengthStreamingMode(I)V

    .line 295
    invoke-interface {p2}, Lorg/ksoap2/transport/ServiceConnection;->openOutputStream()Ljava/io/OutputStream;

    move-result-object p2

    .line 296
    array-length p3, p1

    const/4 v0, 0x0

    invoke-virtual {p2, p1, v0, p3}, Ljava/io/OutputStream;->write([BII)V

    .line 297
    invoke-virtual {p2}, Ljava/io/OutputStream;->flush()V

    .line 298
    invoke-virtual {p2}, Ljava/io/OutputStream;->close()V

    return-void
.end method
