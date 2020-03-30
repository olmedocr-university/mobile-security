.class public Lokhttp3/internal/huc/HttpURLConnectionImpl;
.super Ljava/net/HttpURLConnection;
.source "HttpURLConnectionImpl.java"


# static fields
.field private static final EMPTY_REQUEST_BODY:Lokhttp3/RequestBody;

.field private static final METHODS:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field client:Lokhttp3/OkHttpClient;

.field private fixedContentLength:J

.field private followUpCount:I

.field handshake:Lokhttp3/Handshake;

.field protected httpEngine:Lokhttp3/internal/http/HttpEngine;

.field protected httpEngineFailure:Ljava/io/IOException;

.field private requestHeaders:Lokhttp3/Headers$Builder;

.field private responseHeaders:Lokhttp3/Headers;

.field private route:Lokhttp3/Route;

.field private urlFilter:Lokhttp3/internal/URLFilter;


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .line 83
    new-instance v0, Ljava/util/LinkedHashSet;

    const-string v1, "OPTIONS"

    const-string v2, "GET"

    const-string v3, "HEAD"

    const-string v4, "POST"

    const-string v5, "PUT"

    const-string v6, "DELETE"

    const-string v7, "TRACE"

    const-string v8, "PATCH"

    filled-new-array/range {v1 .. v8}, [Ljava/lang/String;

    move-result-object v1

    .line 84
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/LinkedHashSet;-><init>(Ljava/util/Collection;)V

    sput-object v0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->METHODS:Ljava/util/Set;

    const/4 v0, 0x0

    new-array v0, v0, [B

    const/4 v1, 0x0

    .line 85
    invoke-static {v1, v0}, Lokhttp3/RequestBody;->create(Lokhttp3/MediaType;[B)Lokhttp3/RequestBody;

    move-result-object v0

    sput-object v0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->EMPTY_REQUEST_BODY:Lokhttp3/RequestBody;

    return-void
.end method

.method public constructor <init>(Ljava/net/URL;Lokhttp3/OkHttpClient;)V
    .locals 2

    .line 114
    invoke-direct {p0, p1}, Ljava/net/HttpURLConnection;-><init>(Ljava/net/URL;)V

    .line 89
    new-instance p1, Lokhttp3/Headers$Builder;

    invoke-direct {p1}, Lokhttp3/Headers$Builder;-><init>()V

    iput-object p1, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->requestHeaders:Lokhttp3/Headers$Builder;

    const-wide/16 v0, -0x1

    .line 92
    iput-wide v0, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->fixedContentLength:J

    .line 115
    iput-object p2, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->client:Lokhttp3/OkHttpClient;

    return-void
.end method

.method public constructor <init>(Ljava/net/URL;Lokhttp3/OkHttpClient;Lokhttp3/internal/URLFilter;)V
    .locals 0

    .line 119
    invoke-direct {p0, p1, p2}, Lokhttp3/internal/huc/HttpURLConnectionImpl;-><init>(Ljava/net/URL;Lokhttp3/OkHttpClient;)V

    .line 120
    iput-object p3, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->urlFilter:Lokhttp3/internal/URLFilter;

    return-void
.end method

.method private defaultUserAgent()Ljava/lang/String;
    .locals 1

    const-string v0, "http.agent"

    .line 401
    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 402
    invoke-static {v0}, Lokhttp3/internal/Util;->toHumanReadableAscii(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_0
    invoke-static {}, Lokhttp3/internal/Version;->userAgent()Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0
.end method

.method private execute(Z)Z
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 467
    iget-object v0, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->urlFilter:Lokhttp3/internal/URLFilter;

    if-eqz v0, :cond_0

    .line 468
    iget-object v1, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->httpEngine:Lokhttp3/internal/http/HttpEngine;

    invoke-virtual {v1}, Lokhttp3/internal/http/HttpEngine;->getRequest()Lokhttp3/Request;

    move-result-object v1

    invoke-virtual {v1}, Lokhttp3/Request;->url()Lokhttp3/HttpUrl;

    move-result-object v1

    invoke-virtual {v1}, Lokhttp3/HttpUrl;->url()Ljava/net/URL;

    move-result-object v1

    invoke-interface {v0, v1}, Lokhttp3/internal/URLFilter;->checkURLPermitted(Ljava/net/URL;)V

    :cond_0
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 471
    :try_start_0
    iget-object v2, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->httpEngine:Lokhttp3/internal/http/HttpEngine;

    invoke-virtual {v2}, Lokhttp3/internal/http/HttpEngine;->sendRequest()V

    .line 472
    iget-object v2, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->httpEngine:Lokhttp3/internal/http/HttpEngine;

    invoke-virtual {v2}, Lokhttp3/internal/http/HttpEngine;->getConnection()Lokhttp3/Connection;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 474
    invoke-interface {v2}, Lokhttp3/Connection;->route()Lokhttp3/Route;

    move-result-object v3

    iput-object v3, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->route:Lokhttp3/Route;

    .line 475
    invoke-interface {v2}, Lokhttp3/Connection;->handshake()Lokhttp3/Handshake;

    move-result-object v2

    iput-object v2, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->handshake:Lokhttp3/Handshake;

    goto :goto_0

    :cond_1
    const/4 v2, 0x0

    .line 477
    iput-object v2, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->route:Lokhttp3/Route;

    .line 478
    iput-object v2, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->handshake:Lokhttp3/Handshake;

    :goto_0
    if-eqz p1, :cond_2

    .line 481
    iget-object p1, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->httpEngine:Lokhttp3/internal/http/HttpEngine;

    invoke-virtual {p1}, Lokhttp3/internal/http/HttpEngine;->readResponse()V
    :try_end_0
    .catch Lokhttp3/internal/http/RequestException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Lokhttp3/internal/http/RouteException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_2
    return v0

    :catchall_0
    move-exception p1

    goto :goto_1

    :catch_0
    move-exception p1

    .line 506
    :try_start_1
    iget-object v2, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->httpEngine:Lokhttp3/internal/http/HttpEngine;

    invoke-virtual {v2, p1}, Lokhttp3/internal/http/HttpEngine;->recover(Ljava/io/IOException;)Lokhttp3/internal/http/HttpEngine;

    move-result-object v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v2, :cond_3

    .line 509
    :try_start_2
    iput-object v2, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->httpEngine:Lokhttp3/internal/http/HttpEngine;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    return v1

    :catchall_1
    move-exception p1

    move v0, v1

    goto :goto_1

    .line 514
    :cond_3
    :try_start_3
    iput-object p1, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->httpEngineFailure:Ljava/io/IOException;

    .line 515
    throw p1

    :catch_1
    move-exception p1

    .line 493
    iget-object v2, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->httpEngine:Lokhttp3/internal/http/HttpEngine;

    invoke-virtual {p1}, Lokhttp3/internal/http/RouteException;->getLastConnectException()Ljava/io/IOException;

    move-result-object v3

    invoke-virtual {v2, v3}, Lokhttp3/internal/http/HttpEngine;->recover(Ljava/io/IOException;)Lokhttp3/internal/http/HttpEngine;

    move-result-object v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    if-eqz v2, :cond_4

    .line 496
    :try_start_4
    iput-object v2, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->httpEngine:Lokhttp3/internal/http/HttpEngine;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    return v1

    .line 501
    :cond_4
    :try_start_5
    invoke-virtual {p1}, Lokhttp3/internal/http/RouteException;->getLastConnectException()Ljava/io/IOException;

    move-result-object p1

    .line 502
    iput-object p1, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->httpEngineFailure:Ljava/io/IOException;

    .line 503
    throw p1

    :catch_2
    move-exception p1

    .line 488
    invoke-virtual {p1}, Lokhttp3/internal/http/RequestException;->getCause()Ljava/io/IOException;

    move-result-object p1

    .line 489
    iput-object p1, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->httpEngineFailure:Ljava/io/IOException;

    .line 490
    throw p1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    :goto_1
    if-eqz v0, :cond_5

    .line 519
    iget-object v0, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->httpEngine:Lokhttp3/internal/http/HttpEngine;

    invoke-virtual {v0}, Lokhttp3/internal/http/HttpEngine;->close()Lokhttp3/internal/http/StreamAllocation;

    move-result-object v0

    .line 520
    invoke-virtual {v0}, Lokhttp3/internal/http/StreamAllocation;->release()V

    .line 521
    :cond_5
    throw p1
.end method

.method private getHeaders()Lokhttp3/Headers;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 162
    iget-object v0, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->responseHeaders:Lokhttp3/Headers;

    if-nez v0, :cond_0

    .line 163
    invoke-direct {p0}, Lokhttp3/internal/huc/HttpURLConnectionImpl;->getResponse()Lokhttp3/internal/http/HttpEngine;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/internal/http/HttpEngine;->getResponse()Lokhttp3/Response;

    move-result-object v0

    .line 164
    invoke-virtual {v0}, Lokhttp3/Response;->headers()Lokhttp3/Headers;

    move-result-object v1

    .line 165
    invoke-virtual {v1}, Lokhttp3/Headers;->newBuilder()Lokhttp3/Headers$Builder;

    move-result-object v1

    sget-object v2, Lokhttp3/internal/http/OkHeaders;->SELECTED_PROTOCOL:Ljava/lang/String;

    .line 166
    invoke-virtual {v0}, Lokhttp3/Response;->protocol()Lokhttp3/Protocol;

    move-result-object v3

    invoke-virtual {v3}, Lokhttp3/Protocol;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lokhttp3/Headers$Builder;->add(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Headers$Builder;

    move-result-object v1

    sget-object v2, Lokhttp3/internal/http/OkHeaders;->RESPONSE_SOURCE:Ljava/lang/String;

    .line 167
    invoke-static {v0}, Lokhttp3/internal/huc/HttpURLConnectionImpl;->responseSourceHeader(Lokhttp3/Response;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v2, v0}, Lokhttp3/Headers$Builder;->add(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Headers$Builder;

    move-result-object v0

    .line 168
    invoke-virtual {v0}, Lokhttp3/Headers$Builder;->build()Lokhttp3/Headers;

    move-result-object v0

    iput-object v0, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->responseHeaders:Lokhttp3/Headers;

    .line 170
    :cond_0
    iget-object v0, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->responseHeaders:Lokhttp3/Headers;

    return-object v0
.end method

.method private getResponse()Lokhttp3/internal/http/HttpEngine;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 410
    invoke-direct {p0}, Lokhttp3/internal/huc/HttpURLConnectionImpl;->initHttpEngine()V

    .line 412
    iget-object v0, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->httpEngine:Lokhttp3/internal/http/HttpEngine;

    invoke-virtual {v0}, Lokhttp3/internal/http/HttpEngine;->hasResponse()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 413
    iget-object v0, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->httpEngine:Lokhttp3/internal/http/HttpEngine;

    return-object v0

    :cond_0
    :goto_0
    const/4 v0, 0x1

    .line 417
    invoke-direct {p0, v0}, Lokhttp3/internal/huc/HttpURLConnectionImpl;->execute(Z)Z

    move-result v1

    if-nez v1, :cond_1

    goto :goto_0

    .line 421
    :cond_1
    iget-object v1, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->httpEngine:Lokhttp3/internal/http/HttpEngine;

    invoke-virtual {v1}, Lokhttp3/internal/http/HttpEngine;->getResponse()Lokhttp3/Response;

    move-result-object v1

    .line 422
    iget-object v2, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->httpEngine:Lokhttp3/internal/http/HttpEngine;

    invoke-virtual {v2}, Lokhttp3/internal/http/HttpEngine;->followUpRequest()Lokhttp3/Request;

    move-result-object v2

    if-nez v2, :cond_2

    .line 425
    iget-object v0, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->httpEngine:Lokhttp3/internal/http/HttpEngine;

    invoke-virtual {v0}, Lokhttp3/internal/http/HttpEngine;->releaseStreamAllocation()V

    .line 426
    iget-object v0, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->httpEngine:Lokhttp3/internal/http/HttpEngine;

    return-object v0

    .line 429
    :cond_2
    iget v3, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->followUpCount:I

    add-int/2addr v3, v0

    iput v3, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->followUpCount:I

    const/16 v0, 0x14

    if-gt v3, v0, :cond_7

    .line 434
    invoke-virtual {v2}, Lokhttp3/Request;->url()Lokhttp3/HttpUrl;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/HttpUrl;->url()Ljava/net/URL;

    move-result-object v0

    iput-object v0, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->url:Ljava/net/URL;

    .line 435
    invoke-virtual {v2}, Lokhttp3/Request;->headers()Lokhttp3/Headers;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/Headers;->newBuilder()Lokhttp3/Headers$Builder;

    move-result-object v0

    iput-object v0, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->requestHeaders:Lokhttp3/Headers$Builder;

    .line 440
    iget-object v0, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->httpEngine:Lokhttp3/internal/http/HttpEngine;

    invoke-virtual {v0}, Lokhttp3/internal/http/HttpEngine;->getRequestBody()Lokio/Sink;

    move-result-object v0

    .line 441
    invoke-virtual {v2}, Lokhttp3/Request;->method()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->method:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    const/4 v4, 0x0

    if-nez v3, :cond_3

    move-object v0, v4

    :cond_3
    if-eqz v0, :cond_5

    .line 445
    instance-of v3, v0, Lokhttp3/internal/http/RetryableSink;

    if-eqz v3, :cond_4

    goto :goto_1

    .line 446
    :cond_4
    new-instance v0, Ljava/net/HttpRetryException;

    iget v1, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->responseCode:I

    const-string v2, "Cannot retry streamed HTTP body"

    invoke-direct {v0, v2, v1}, Ljava/net/HttpRetryException;-><init>(Ljava/lang/String;I)V

    throw v0

    .line 449
    :cond_5
    :goto_1
    iget-object v3, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->httpEngine:Lokhttp3/internal/http/HttpEngine;

    invoke-virtual {v3}, Lokhttp3/internal/http/HttpEngine;->close()Lokhttp3/internal/http/StreamAllocation;

    move-result-object v3

    .line 450
    iget-object v5, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->httpEngine:Lokhttp3/internal/http/HttpEngine;

    invoke-virtual {v2}, Lokhttp3/Request;->url()Lokhttp3/HttpUrl;

    move-result-object v6

    invoke-virtual {v5, v6}, Lokhttp3/internal/http/HttpEngine;->sameConnection(Lokhttp3/HttpUrl;)Z

    move-result v5

    if-nez v5, :cond_6

    .line 451
    invoke-virtual {v3}, Lokhttp3/internal/http/StreamAllocation;->release()V

    goto :goto_2

    :cond_6
    move-object v4, v3

    .line 455
    :goto_2
    invoke-virtual {v2}, Lokhttp3/Request;->method()Ljava/lang/String;

    move-result-object v2

    check-cast v0, Lokhttp3/internal/http/RetryableSink;

    invoke-direct {p0, v2, v4, v0, v1}, Lokhttp3/internal/huc/HttpURLConnectionImpl;->newHttpEngine(Ljava/lang/String;Lokhttp3/internal/http/StreamAllocation;Lokhttp3/internal/http/RetryableSink;Lokhttp3/Response;)Lokhttp3/internal/http/HttpEngine;

    move-result-object v0

    iput-object v0, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->httpEngine:Lokhttp3/internal/http/HttpEngine;

    goto/16 :goto_0

    .line 430
    :cond_7
    new-instance v0, Ljava/net/ProtocolException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Too many follow-up requests: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->followUpCount:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private initHttpEngine()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 324
    iget-object v0, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->httpEngineFailure:Ljava/io/IOException;

    if-nez v0, :cond_4

    .line 326
    iget-object v0, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->httpEngine:Lokhttp3/internal/http/HttpEngine;

    if-eqz v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x1

    .line 330
    iput-boolean v0, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->connected:Z

    .line 332
    :try_start_0
    iget-boolean v0, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->doOutput:Z

    if-eqz v0, :cond_3

    .line 333
    iget-object v0, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->method:Ljava/lang/String;

    const-string v1, "GET"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "POST"

    .line 335
    iput-object v0, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->method:Ljava/lang/String;

    goto :goto_0

    .line 336
    :cond_1
    iget-object v0, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->method:Ljava/lang/String;

    invoke-static {v0}, Lokhttp3/internal/http/HttpMethod;->permitsRequestBody(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    goto :goto_0

    .line 337
    :cond_2
    new-instance v0, Ljava/net/ProtocolException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->method:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " does not support writing"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 341
    :cond_3
    :goto_0
    iget-object v0, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->method:Ljava/lang/String;

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1, v1, v1}, Lokhttp3/internal/huc/HttpURLConnectionImpl;->newHttpEngine(Ljava/lang/String;Lokhttp3/internal/http/StreamAllocation;Lokhttp3/internal/http/RetryableSink;Lokhttp3/Response;)Lokhttp3/internal/http/HttpEngine;

    move-result-object v0

    iput-object v0, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->httpEngine:Lokhttp3/internal/http/HttpEngine;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 343
    iput-object v0, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->httpEngineFailure:Ljava/io/IOException;

    .line 344
    throw v0

    .line 325
    :cond_4
    throw v0
.end method

.method private newHttpEngine(Ljava/lang/String;Lokhttp3/internal/http/StreamAllocation;Lokhttp3/internal/http/RetryableSink;Lokhttp3/Response;)Lokhttp3/internal/http/HttpEngine;
    .locals 16
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/MalformedURLException;,
            Ljava/net/UnknownHostException;
        }
    .end annotation

    move-object/from16 v0, p0

    .line 352
    invoke-static/range {p1 .. p1}, Lokhttp3/internal/http/HttpMethod;->requiresRequestBody(Ljava/lang/String;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    sget-object v1, Lokhttp3/internal/huc/HttpURLConnectionImpl;->EMPTY_REQUEST_BODY:Lokhttp3/RequestBody;

    goto :goto_0

    :cond_0
    move-object v1, v2

    .line 355
    :goto_0
    invoke-virtual/range {p0 .. p0}, Lokhttp3/internal/huc/HttpURLConnectionImpl;->getURL()Ljava/net/URL;

    move-result-object v3

    .line 356
    sget-object v4, Lokhttp3/internal/Internal;->instance:Lokhttp3/internal/Internal;

    invoke-virtual {v3}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Lokhttp3/internal/Internal;->getHttpUrlChecked(Ljava/lang/String;)Lokhttp3/HttpUrl;

    move-result-object v3

    .line 357
    new-instance v4, Lokhttp3/Request$Builder;

    invoke-direct {v4}, Lokhttp3/Request$Builder;-><init>()V

    .line 358
    invoke-virtual {v4, v3}, Lokhttp3/Request$Builder;->url(Lokhttp3/HttpUrl;)Lokhttp3/Request$Builder;

    move-result-object v3

    move-object/from16 v4, p1

    .line 359
    invoke-virtual {v3, v4, v1}, Lokhttp3/Request$Builder;->method(Ljava/lang/String;Lokhttp3/RequestBody;)Lokhttp3/Request$Builder;

    move-result-object v1

    .line 360
    iget-object v3, v0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->requestHeaders:Lokhttp3/Headers$Builder;

    invoke-virtual {v3}, Lokhttp3/Headers$Builder;->build()Lokhttp3/Headers;

    move-result-object v3

    .line 361
    invoke-virtual {v3}, Lokhttp3/Headers;->size()I

    move-result v5

    const/4 v6, 0x0

    move v7, v6

    :goto_1
    if-ge v7, v5, :cond_1

    .line 362
    invoke-virtual {v3, v7}, Lokhttp3/Headers;->name(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v3, v7}, Lokhttp3/Headers;->value(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v1, v8, v9}, Lokhttp3/Request$Builder;->addHeader(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    .line 366
    :cond_1
    invoke-static/range {p1 .. p1}, Lokhttp3/internal/http/HttpMethod;->permitsRequestBody(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 368
    iget-wide v4, v0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->fixedContentLength:J

    const-wide/16 v7, -0x1

    cmp-long v7, v4, v7

    if-eqz v7, :cond_2

    .line 369
    invoke-static {v4, v5}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v4

    const-string v5, "Content-Length"

    invoke-virtual {v1, v5, v4}, Lokhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    goto :goto_2

    .line 370
    :cond_2
    iget v4, v0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->chunkLength:I

    if-lez v4, :cond_3

    const-string v4, "Transfer-Encoding"

    const-string v5, "chunked"

    .line 371
    invoke-virtual {v1, v4, v5}, Lokhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    goto :goto_2

    :cond_3
    const/4 v6, 0x1

    :goto_2
    const-string v4, "Content-Type"

    .line 377
    invoke-virtual {v3, v4}, Lokhttp3/Headers;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    if-nez v5, :cond_4

    const-string v5, "application/x-www-form-urlencoded"

    .line 378
    invoke-virtual {v1, v4, v5}, Lokhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    :cond_4
    move v10, v6

    const-string v4, "User-Agent"

    .line 382
    invoke-virtual {v3, v4}, Lokhttp3/Headers;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_5

    .line 383
    invoke-direct/range {p0 .. p0}, Lokhttp3/internal/huc/HttpURLConnectionImpl;->defaultUserAgent()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v4, v3}, Lokhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    .line 386
    :cond_5
    invoke-virtual {v1}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object v9

    .line 389
    iget-object v1, v0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->client:Lokhttp3/OkHttpClient;

    .line 390
    sget-object v3, Lokhttp3/internal/Internal;->instance:Lokhttp3/internal/Internal;

    invoke-virtual {v3, v1}, Lokhttp3/internal/Internal;->internalCache(Lokhttp3/OkHttpClient;)Lokhttp3/internal/InternalCache;

    move-result-object v3

    if-eqz v3, :cond_6

    invoke-virtual/range {p0 .. p0}, Lokhttp3/internal/huc/HttpURLConnectionImpl;->getUseCaches()Z

    move-result v3

    if-nez v3, :cond_6

    .line 391
    iget-object v1, v0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->client:Lokhttp3/OkHttpClient;

    invoke-virtual {v1}, Lokhttp3/OkHttpClient;->newBuilder()Lokhttp3/OkHttpClient$Builder;

    move-result-object v1

    .line 392
    invoke-virtual {v1, v2}, Lokhttp3/OkHttpClient$Builder;->cache(Lokhttp3/Cache;)Lokhttp3/OkHttpClient$Builder;

    move-result-object v1

    .line 393
    invoke-virtual {v1}, Lokhttp3/OkHttpClient$Builder;->build()Lokhttp3/OkHttpClient;

    move-result-object v1

    :cond_6
    move-object v8, v1

    .line 396
    new-instance v1, Lokhttp3/internal/http/HttpEngine;

    const/4 v11, 0x1

    const/4 v12, 0x0

    move-object v7, v1

    move-object/from16 v13, p2

    move-object/from16 v14, p3

    move-object/from16 v15, p4

    invoke-direct/range {v7 .. v15}, Lokhttp3/internal/http/HttpEngine;-><init>(Lokhttp3/OkHttpClient;Lokhttp3/Request;ZZZLokhttp3/internal/http/StreamAllocation;Lokhttp3/internal/http/RetryableSink;Lokhttp3/Response;)V

    return-object v1
.end method

.method private static responseSourceHeader(Lokhttp3/Response;)Ljava/lang/String;
    .locals 2

    .line 174
    invoke-virtual {p0}, Lokhttp3/Response;->networkResponse()Lokhttp3/Response;

    move-result-object v0

    if-nez v0, :cond_1

    .line 175
    invoke-virtual {p0}, Lokhttp3/Response;->cacheResponse()Lokhttp3/Response;

    move-result-object v0

    if-nez v0, :cond_0

    const-string p0, "NONE"

    return-object p0

    .line 178
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "CACHE "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lokhttp3/Response;->code()I

    move-result p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 180
    :cond_1
    invoke-virtual {p0}, Lokhttp3/Response;->cacheResponse()Lokhttp3/Response;

    move-result-object v0

    if-nez v0, :cond_2

    .line 181
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "NETWORK "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lokhttp3/Response;->code()I

    move-result p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 183
    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "CONDITIONAL_CACHE "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lokhttp3/Response;->networkResponse()Lokhttp3/Response;

    move-result-object p0

    invoke-virtual {p0}, Lokhttp3/Response;->code()I

    move-result p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private setProtocols(Ljava/lang/String;Z)V
    .locals 3

    .line 618
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    if-eqz p2, :cond_0

    .line 620
    iget-object p2, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->client:Lokhttp3/OkHttpClient;

    invoke-virtual {p2}, Lokhttp3/OkHttpClient;->protocols()Ljava/util/List;

    move-result-object p2

    invoke-interface {v0, p2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    :cond_0
    const/4 p2, -0x1

    const-string v1, ","

    .line 622
    invoke-virtual {p1, v1, p2}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object p1

    array-length p2, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, p2, :cond_1

    aget-object v2, p1, v1

    .line 624
    :try_start_0
    invoke-static {v2}, Lokhttp3/Protocol;->get(Ljava/lang/String;)Lokhttp3/Protocol;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :catch_0
    move-exception p1

    .line 626
    new-instance p2, Ljava/lang/IllegalStateException;

    invoke-direct {p2, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw p2

    .line 629
    :cond_1
    iget-object p1, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->client:Lokhttp3/OkHttpClient;

    invoke-virtual {p1}, Lokhttp3/OkHttpClient;->newBuilder()Lokhttp3/OkHttpClient$Builder;

    move-result-object p1

    .line 630
    invoke-virtual {p1, v0}, Lokhttp3/OkHttpClient$Builder;->protocols(Ljava/util/List;)Lokhttp3/OkHttpClient$Builder;

    move-result-object p1

    .line 631
    invoke-virtual {p1}, Lokhttp3/OkHttpClient$Builder;->build()Lokhttp3/OkHttpClient;

    move-result-object p1

    iput-object p1, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->client:Lokhttp3/OkHttpClient;

    return-void
.end method


# virtual methods
.method public final addRequestProperty(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 587
    iget-boolean v0, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->connected:Z

    if-nez v0, :cond_4

    if-eqz p1, :cond_3

    if-nez p2, :cond_0

    .line 599
    invoke-static {}, Lokhttp3/internal/Platform;->get()Lokhttp3/internal/Platform;

    move-result-object p2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Ignoring header "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " because its value was null."

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Lokhttp3/internal/Platform;->logW(Ljava/lang/String;)V

    return-void

    :cond_0
    const-string v0, "X-Android-Transports"

    .line 604
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    const-string v0, "X-Android-Protocols"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_0

    .line 607
    :cond_1
    iget-object v0, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->requestHeaders:Lokhttp3/Headers$Builder;

    invoke-virtual {v0, p1, p2}, Lokhttp3/Headers$Builder;->add(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Headers$Builder;

    goto :goto_1

    :cond_2
    :goto_0
    const/4 p1, 0x1

    .line 605
    invoke-direct {p0, p2, p1}, Lokhttp3/internal/huc/HttpURLConnectionImpl;->setProtocols(Ljava/lang/String;Z)V

    :goto_1
    return-void

    .line 591
    :cond_3
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "field == null"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 588
    :cond_4
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "Cannot add request property after connection is made"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final connect()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 124
    invoke-direct {p0}, Lokhttp3/internal/huc/HttpURLConnectionImpl;->initHttpEngine()V

    :cond_0
    const/4 v0, 0x0

    .line 127
    invoke-direct {p0, v0}, Lokhttp3/internal/huc/HttpURLConnectionImpl;->execute(Z)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void
.end method

.method public final disconnect()V
    .locals 1

    .line 133
    iget-object v0, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->httpEngine:Lokhttp3/internal/http/HttpEngine;

    if-nez v0, :cond_0

    return-void

    .line 135
    :cond_0
    invoke-virtual {v0}, Lokhttp3/internal/http/HttpEngine;->cancel()V

    return-void
.end method

.method public getConnectTimeout()I
    .locals 1

    .line 310
    iget-object v0, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->client:Lokhttp3/OkHttpClient;

    invoke-virtual {v0}, Lokhttp3/OkHttpClient;->connectTimeoutMillis()I

    move-result v0

    return v0
.end method

.method public final getErrorStream()Ljava/io/InputStream;
    .locals 4

    const/4 v0, 0x0

    .line 150
    :try_start_0
    invoke-direct {p0}, Lokhttp3/internal/huc/HttpURLConnectionImpl;->getResponse()Lokhttp3/internal/http/HttpEngine;

    move-result-object v1

    .line 151
    invoke-virtual {v1}, Lokhttp3/internal/http/HttpEngine;->getResponse()Lokhttp3/Response;

    move-result-object v2

    invoke-static {v2}, Lokhttp3/internal/http/HttpEngine;->hasBody(Lokhttp3/Response;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 152
    invoke-virtual {v1}, Lokhttp3/internal/http/HttpEngine;->getResponse()Lokhttp3/Response;

    move-result-object v2

    invoke-virtual {v2}, Lokhttp3/Response;->code()I

    move-result v2

    const/16 v3, 0x190

    if-lt v2, v3, :cond_0

    .line 153
    invoke-virtual {v1}, Lokhttp3/internal/http/HttpEngine;->getResponse()Lokhttp3/Response;

    move-result-object v1

    invoke-virtual {v1}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object v1

    invoke-virtual {v1}, Lokhttp3/ResponseBody;->byteStream()Ljava/io/InputStream;

    move-result-object v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_0
    return-object v0
.end method

.method public final getHeaderField(I)Ljava/lang/String;
    .locals 3

    const/4 v0, 0x0

    .line 192
    :try_start_0
    invoke-direct {p0}, Lokhttp3/internal/huc/HttpURLConnectionImpl;->getHeaders()Lokhttp3/Headers;

    move-result-object v1

    if-ltz p1, :cond_1

    .line 193
    invoke-virtual {v1}, Lokhttp3/Headers;->size()I

    move-result v2

    if-lt p1, v2, :cond_0

    goto :goto_0

    .line 194
    :cond_0
    invoke-virtual {v1, p1}, Lokhttp3/Headers;->value(I)Ljava/lang/String;

    move-result-object p1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    :cond_1
    :goto_0
    return-object v0
.end method

.method public final getHeaderField(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    if-nez p1, :cond_0

    .line 207
    :try_start_0
    invoke-direct {p0}, Lokhttp3/internal/huc/HttpURLConnectionImpl;->getResponse()Lokhttp3/internal/http/HttpEngine;

    move-result-object p1

    invoke-virtual {p1}, Lokhttp3/internal/http/HttpEngine;->getResponse()Lokhttp3/Response;

    move-result-object p1

    invoke-static {p1}, Lokhttp3/internal/http/StatusLine;->get(Lokhttp3/Response;)Lokhttp3/internal/http/StatusLine;

    move-result-object p1

    invoke-virtual {p1}, Lokhttp3/internal/http/StatusLine;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    .line 208
    :cond_0
    invoke-direct {p0}, Lokhttp3/internal/huc/HttpURLConnectionImpl;->getHeaders()Lokhttp3/Headers;

    move-result-object v0

    invoke-virtual {v0, p1}, Lokhttp3/Headers;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-object p1

    :catch_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public final getHeaderFieldKey(I)Ljava/lang/String;
    .locals 3

    const/4 v0, 0x0

    .line 216
    :try_start_0
    invoke-direct {p0}, Lokhttp3/internal/huc/HttpURLConnectionImpl;->getHeaders()Lokhttp3/Headers;

    move-result-object v1

    if-ltz p1, :cond_1

    .line 217
    invoke-virtual {v1}, Lokhttp3/Headers;->size()I

    move-result v2

    if-lt p1, v2, :cond_0

    goto :goto_0

    .line 218
    :cond_0
    invoke-virtual {v1, p1}, Lokhttp3/Headers;->name(I)Ljava/lang/String;

    move-result-object p1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    :cond_1
    :goto_0
    return-object v0
.end method

.method public final getHeaderFields()Ljava/util/Map;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .line 226
    :try_start_0
    invoke-direct {p0}, Lokhttp3/internal/huc/HttpURLConnectionImpl;->getHeaders()Lokhttp3/Headers;

    move-result-object v0

    .line 227
    invoke-direct {p0}, Lokhttp3/internal/huc/HttpURLConnectionImpl;->getResponse()Lokhttp3/internal/http/HttpEngine;

    move-result-object v1

    invoke-virtual {v1}, Lokhttp3/internal/http/HttpEngine;->getResponse()Lokhttp3/Response;

    move-result-object v1

    invoke-static {v1}, Lokhttp3/internal/http/StatusLine;->get(Lokhttp3/Response;)Lokhttp3/internal/http/StatusLine;

    move-result-object v1

    invoke-virtual {v1}, Lokhttp3/internal/http/StatusLine;->toString()Ljava/lang/String;

    move-result-object v1

    .line 226
    invoke-static {v0, v1}, Lokhttp3/internal/JavaNetHeaders;->toMultimap(Lokhttp3/Headers;Ljava/lang/String;)Ljava/util/Map;

    move-result-object v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 229
    :catch_0
    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public final getInputStream()Ljava/io/InputStream;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 243
    iget-boolean v0, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->doInput:Z

    if-eqz v0, :cond_1

    .line 247
    invoke-direct {p0}, Lokhttp3/internal/huc/HttpURLConnectionImpl;->getResponse()Lokhttp3/internal/http/HttpEngine;

    move-result-object v0

    .line 253
    invoke-virtual {p0}, Lokhttp3/internal/huc/HttpURLConnectionImpl;->getResponseCode()I

    move-result v1

    const/16 v2, 0x190

    if-ge v1, v2, :cond_0

    .line 257
    invoke-virtual {v0}, Lokhttp3/internal/http/HttpEngine;->getResponse()Lokhttp3/Response;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/ResponseBody;->byteStream()Ljava/io/InputStream;

    move-result-object v0

    return-object v0

    .line 254
    :cond_0
    new-instance v0, Ljava/io/FileNotFoundException;

    iget-object v1, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->url:Ljava/net/URL;

    invoke-virtual {v1}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 244
    :cond_1
    new-instance v0, Ljava/net/ProtocolException;

    const-string v1, "This protocol does not support input"

    invoke-direct {v0, v1}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getInstanceFollowRedirects()Z
    .locals 1

    .line 306
    iget-object v0, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->client:Lokhttp3/OkHttpClient;

    invoke-virtual {v0}, Lokhttp3/OkHttpClient;->followRedirects()Z

    move-result v0

    return v0
.end method

.method public final getOutputStream()Ljava/io/OutputStream;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 261
    invoke-virtual {p0}, Lokhttp3/internal/huc/HttpURLConnectionImpl;->connect()V

    .line 263
    iget-object v0, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->httpEngine:Lokhttp3/internal/http/HttpEngine;

    invoke-virtual {v0}, Lokhttp3/internal/http/HttpEngine;->getBufferedRequestBody()Lokio/BufferedSink;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 266
    iget-object v1, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->httpEngine:Lokhttp3/internal/http/HttpEngine;

    invoke-virtual {v1}, Lokhttp3/internal/http/HttpEngine;->hasResponse()Z

    move-result v1

    if-nez v1, :cond_0

    .line 270
    invoke-interface {v0}, Lokio/BufferedSink;->outputStream()Ljava/io/OutputStream;

    move-result-object v0

    return-object v0

    .line 267
    :cond_0
    new-instance v0, Ljava/net/ProtocolException;

    const-string v1, "cannot write request body after response has been read"

    invoke-direct {v0, v1}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 265
    :cond_1
    new-instance v0, Ljava/net/ProtocolException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "method does not support a request body: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->method:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final getPermission()Ljava/security/Permission;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 274
    invoke-virtual {p0}, Lokhttp3/internal/huc/HttpURLConnectionImpl;->getURL()Ljava/net/URL;

    move-result-object v0

    .line 275
    invoke-virtual {v0}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v1

    .line 276
    invoke-virtual {v0}, Ljava/net/URL;->getPort()I

    move-result v2

    const/4 v3, -0x1

    if-eq v2, v3, :cond_0

    .line 277
    invoke-virtual {v0}, Ljava/net/URL;->getPort()I

    move-result v0

    goto :goto_0

    .line 278
    :cond_0
    invoke-virtual {v0}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lokhttp3/HttpUrl;->defaultPort(Ljava/lang/String;)I

    move-result v0

    .line 279
    :goto_0
    invoke-virtual {p0}, Lokhttp3/internal/huc/HttpURLConnectionImpl;->usingProxy()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 280
    iget-object v0, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->client:Lokhttp3/OkHttpClient;

    invoke-virtual {v0}, Lokhttp3/OkHttpClient;->proxy()Ljava/net/Proxy;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/Proxy;->address()Ljava/net/SocketAddress;

    move-result-object v0

    check-cast v0, Ljava/net/InetSocketAddress;

    .line 281
    invoke-virtual {v0}, Ljava/net/InetSocketAddress;->getHostName()Ljava/lang/String;

    move-result-object v1

    .line 282
    invoke-virtual {v0}, Ljava/net/InetSocketAddress;->getPort()I

    move-result v0

    .line 284
    :cond_1
    new-instance v2, Ljava/net/SocketPermission;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ":"

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "connect, resolve"

    invoke-direct {v2, v0, v1}, Ljava/net/SocketPermission;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v2
.end method

.method public getReadTimeout()I
    .locals 1

    .line 320
    iget-object v0, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->client:Lokhttp3/OkHttpClient;

    invoke-virtual {v0}, Lokhttp3/OkHttpClient;->readTimeoutMillis()I

    move-result v0

    return v0
.end method

.method public final getRequestProperties()Ljava/util/Map;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .line 234
    iget-boolean v0, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->connected:Z

    if-nez v0, :cond_0

    .line 239
    iget-object v0, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->requestHeaders:Lokhttp3/Headers$Builder;

    invoke-virtual {v0}, Lokhttp3/Headers$Builder;->build()Lokhttp3/Headers;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lokhttp3/internal/JavaNetHeaders;->toMultimap(Lokhttp3/Headers;Ljava/lang/String;)Ljava/util/Map;

    move-result-object v0

    return-object v0

    .line 235
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Cannot access request header fields after connection is set"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final getRequestProperty(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 289
    :cond_0
    iget-object v0, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->requestHeaders:Lokhttp3/Headers$Builder;

    invoke-virtual {v0, p1}, Lokhttp3/Headers$Builder;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public final getResponseCode()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 549
    invoke-direct {p0}, Lokhttp3/internal/huc/HttpURLConnectionImpl;->getResponse()Lokhttp3/internal/http/HttpEngine;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/internal/http/HttpEngine;->getResponse()Lokhttp3/Response;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/Response;->code()I

    move-result v0

    return v0
.end method

.method public getResponseMessage()Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 545
    invoke-direct {p0}, Lokhttp3/internal/huc/HttpURLConnectionImpl;->getResponse()Lokhttp3/internal/http/HttpEngine;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/internal/http/HttpEngine;->getResponse()Lokhttp3/Response;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/Response;->message()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public setConnectTimeout(I)V
    .locals 3

    .line 293
    iget-object v0, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->client:Lokhttp3/OkHttpClient;

    invoke-virtual {v0}, Lokhttp3/OkHttpClient;->newBuilder()Lokhttp3/OkHttpClient$Builder;

    move-result-object v0

    int-to-long v1, p1

    sget-object p1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 294
    invoke-virtual {v0, v1, v2, p1}, Lokhttp3/OkHttpClient$Builder;->connectTimeout(JLjava/util/concurrent/TimeUnit;)Lokhttp3/OkHttpClient$Builder;

    move-result-object p1

    .line 295
    invoke-virtual {p1}, Lokhttp3/OkHttpClient$Builder;->build()Lokhttp3/OkHttpClient;

    move-result-object p1

    iput-object p1, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->client:Lokhttp3/OkHttpClient;

    return-void
.end method

.method public setFixedLengthStreamingMode(I)V
    .locals 2

    int-to-long v0, p1

    .line 642
    invoke-virtual {p0, v0, v1}, Lokhttp3/internal/huc/HttpURLConnectionImpl;->setFixedLengthStreamingMode(J)V

    return-void
.end method

.method public setFixedLengthStreamingMode(J)V
    .locals 2

    .line 646
    iget-boolean v0, p0, Ljava/net/HttpURLConnection;->connected:Z

    if-nez v0, :cond_2

    .line 647
    iget v0, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->chunkLength:I

    if-gtz v0, :cond_1

    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-ltz v0, :cond_0

    .line 649
    iput-wide p1, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->fixedContentLength:J

    const-wide/32 v0, 0x7fffffff

    .line 650
    invoke-static {p1, p2, v0, v1}, Ljava/lang/Math;->min(JJ)J

    move-result-wide p1

    long-to-int p1, p1

    iput p1, p0, Ljava/net/HttpURLConnection;->fixedContentLength:I

    return-void

    .line 648
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "contentLength < 0"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 647
    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "Already in chunked mode"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 646
    :cond_2
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "Already connected"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setIfModifiedSince(J)V
    .locals 3

    .line 578
    invoke-super {p0, p1, p2}, Ljava/net/HttpURLConnection;->setIfModifiedSince(J)V

    .line 579
    iget-wide p1, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->ifModifiedSince:J

    const-wide/16 v0, 0x0

    cmp-long p1, p1, v0

    const-string p2, "If-Modified-Since"

    if-eqz p1, :cond_0

    .line 580
    iget-object p1, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->requestHeaders:Lokhttp3/Headers$Builder;

    new-instance v0, Ljava/util/Date;

    iget-wide v1, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->ifModifiedSince:J

    invoke-direct {v0, v1, v2}, Ljava/util/Date;-><init>(J)V

    invoke-static {v0}, Lokhttp3/internal/http/HttpDate;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, p2, v0}, Lokhttp3/Headers$Builder;->set(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Headers$Builder;

    goto :goto_0

    .line 582
    :cond_0
    iget-object p1, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->requestHeaders:Lokhttp3/Headers$Builder;

    invoke-virtual {p1, p2}, Lokhttp3/Headers$Builder;->removeAll(Ljava/lang/String;)Lokhttp3/Headers$Builder;

    :goto_0
    return-void
.end method

.method public setInstanceFollowRedirects(Z)V
    .locals 1

    .line 300
    iget-object v0, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->client:Lokhttp3/OkHttpClient;

    invoke-virtual {v0}, Lokhttp3/OkHttpClient;->newBuilder()Lokhttp3/OkHttpClient$Builder;

    move-result-object v0

    .line 301
    invoke-virtual {v0, p1}, Lokhttp3/OkHttpClient$Builder;->followRedirects(Z)Lokhttp3/OkHttpClient$Builder;

    move-result-object p1

    .line 302
    invoke-virtual {p1}, Lokhttp3/OkHttpClient$Builder;->build()Lokhttp3/OkHttpClient;

    move-result-object p1

    iput-object p1, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->client:Lokhttp3/OkHttpClient;

    return-void
.end method

.method public setReadTimeout(I)V
    .locals 3

    .line 314
    iget-object v0, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->client:Lokhttp3/OkHttpClient;

    invoke-virtual {v0}, Lokhttp3/OkHttpClient;->newBuilder()Lokhttp3/OkHttpClient$Builder;

    move-result-object v0

    int-to-long v1, p1

    sget-object p1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 315
    invoke-virtual {v0, v1, v2, p1}, Lokhttp3/OkHttpClient$Builder;->readTimeout(JLjava/util/concurrent/TimeUnit;)Lokhttp3/OkHttpClient$Builder;

    move-result-object p1

    .line 316
    invoke-virtual {p1}, Lokhttp3/OkHttpClient$Builder;->build()Lokhttp3/OkHttpClient;

    move-result-object p1

    iput-object p1, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->client:Lokhttp3/OkHttpClient;

    return-void
.end method

.method public setRequestMethod(Ljava/lang/String;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/ProtocolException;
        }
    .end annotation

    .line 635
    sget-object v0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->METHODS:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 638
    iput-object p1, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->method:Ljava/lang/String;

    return-void

    .line 636
    :cond_0
    new-instance v0, Ljava/net/ProtocolException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Expected one of "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v2, Lokhttp3/internal/huc/HttpURLConnectionImpl;->METHODS:Ljava/util/Set;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, " but was "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 553
    iget-boolean v0, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->connected:Z

    if-nez v0, :cond_4

    if-eqz p1, :cond_3

    if-nez p2, :cond_0

    .line 565
    invoke-static {}, Lokhttp3/internal/Platform;->get()Lokhttp3/internal/Platform;

    move-result-object p2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Ignoring header "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " because its value was null."

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Lokhttp3/internal/Platform;->logW(Ljava/lang/String;)V

    return-void

    :cond_0
    const-string v0, "X-Android-Transports"

    .line 570
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    const-string v0, "X-Android-Protocols"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_0

    .line 573
    :cond_1
    iget-object v0, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->requestHeaders:Lokhttp3/Headers$Builder;

    invoke-virtual {v0, p1, p2}, Lokhttp3/Headers$Builder;->set(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Headers$Builder;

    goto :goto_1

    :cond_2
    :goto_0
    const/4 p1, 0x0

    .line 571
    invoke-direct {p0, p2, p1}, Lokhttp3/internal/huc/HttpURLConnectionImpl;->setProtocols(Ljava/lang/String;Z)V

    :goto_1
    return-void

    .line 557
    :cond_3
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "field == null"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 554
    :cond_4
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "Cannot set request property after connection is made"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final usingProxy()Z
    .locals 2

    .line 538
    iget-object v0, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->route:Lokhttp3/Route;

    if-eqz v0, :cond_0

    .line 539
    invoke-virtual {v0}, Lokhttp3/Route;->proxy()Ljava/net/Proxy;

    move-result-object v0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->client:Lokhttp3/OkHttpClient;

    .line 540
    invoke-virtual {v0}, Lokhttp3/OkHttpClient;->proxy()Ljava/net/Proxy;

    move-result-object v0

    :goto_0
    if-eqz v0, :cond_1

    .line 541
    invoke-virtual {v0}, Ljava/net/Proxy;->type()Ljava/net/Proxy$Type;

    move-result-object v0

    sget-object v1, Ljava/net/Proxy$Type;->DIRECT:Ljava/net/Proxy$Type;

    if-eq v0, v1, :cond_1

    const/4 v0, 0x1

    goto :goto_1

    :cond_1
    const/4 v0, 0x0

    :goto_1
    return v0
.end method
