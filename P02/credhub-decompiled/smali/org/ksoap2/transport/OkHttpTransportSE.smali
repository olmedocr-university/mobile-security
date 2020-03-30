.class public Lorg/ksoap2/transport/OkHttpTransportSE;
.super Lorg/ksoap2/transport/HttpTransportSE;
.source "OkHttpTransportSE.java"


# instance fields
.field protected final client:Lokhttp3/OkHttpClient;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 37
    invoke-direct {p0, p1}, Lorg/ksoap2/transport/HttpTransportSE;-><init>(Ljava/lang/String;)V

    const/4 p1, 0x0

    .line 38
    iput-object p1, p0, Lorg/ksoap2/transport/OkHttpTransportSE;->client:Lokhttp3/OkHttpClient;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .line 42
    invoke-direct {p0, p1, p2}, Lorg/ksoap2/transport/HttpTransportSE;-><init>(Ljava/lang/String;I)V

    const/4 p1, 0x0

    .line 43
    iput-object p1, p0, Lorg/ksoap2/transport/OkHttpTransportSE;->client:Lokhttp3/OkHttpClient;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;II)V
    .locals 0

    .line 47
    invoke-direct {p0, p1, p2, p3}, Lorg/ksoap2/transport/HttpTransportSE;-><init>(Ljava/lang/String;II)V

    const/4 p1, 0x0

    .line 48
    iput-object p1, p0, Lorg/ksoap2/transport/OkHttpTransportSE;->client:Lokhttp3/OkHttpClient;

    return-void
.end method

.method public constructor <init>(Ljava/net/Proxy;Ljava/lang/String;)V
    .locals 0

    .line 17
    invoke-direct {p0, p1, p2}, Lorg/ksoap2/transport/HttpTransportSE;-><init>(Ljava/net/Proxy;Ljava/lang/String;)V

    const/4 p1, 0x0

    .line 18
    iput-object p1, p0, Lorg/ksoap2/transport/OkHttpTransportSE;->client:Lokhttp3/OkHttpClient;

    return-void
.end method

.method public constructor <init>(Ljava/net/Proxy;Ljava/lang/String;I)V
    .locals 0

    .line 22
    invoke-direct {p0, p1, p2, p3}, Lorg/ksoap2/transport/HttpTransportSE;-><init>(Ljava/net/Proxy;Ljava/lang/String;I)V

    const/4 p1, 0x0

    .line 23
    iput-object p1, p0, Lorg/ksoap2/transport/OkHttpTransportSE;->client:Lokhttp3/OkHttpClient;

    return-void
.end method

.method public constructor <init>(Ljava/net/Proxy;Ljava/lang/String;II)V
    .locals 0

    .line 27
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/ksoap2/transport/HttpTransportSE;-><init>(Ljava/net/Proxy;Ljava/lang/String;II)V

    const/4 p1, 0x0

    .line 28
    iput-object p1, p0, Lorg/ksoap2/transport/OkHttpTransportSE;->client:Lokhttp3/OkHttpClient;

    return-void
.end method

.method public constructor <init>(Lokhttp3/OkHttpClient;Ljava/net/Proxy;Ljava/lang/String;II)V
    .locals 0

    .line 32
    invoke-direct {p0, p2, p3, p4, p5}, Lorg/ksoap2/transport/HttpTransportSE;-><init>(Ljava/net/Proxy;Ljava/lang/String;II)V

    .line 33
    iput-object p1, p0, Lorg/ksoap2/transport/OkHttpTransportSE;->client:Lokhttp3/OkHttpClient;

    return-void
.end method


# virtual methods
.method public getServiceConnection()Lorg/ksoap2/transport/ServiceConnection;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 53
    iget-object v0, p0, Lorg/ksoap2/transport/OkHttpTransportSE;->client:Lokhttp3/OkHttpClient;

    if-nez v0, :cond_0

    .line 54
    new-instance v0, Lorg/ksoap2/transport/OkHttpServiceConnectionSE;

    iget-object v1, p0, Lorg/ksoap2/transport/OkHttpTransportSE;->proxy:Ljava/net/Proxy;

    iget-object v2, p0, Lorg/ksoap2/transport/OkHttpTransportSE;->url:Ljava/lang/String;

    iget v3, p0, Lorg/ksoap2/transport/OkHttpTransportSE;->timeout:I

    invoke-direct {v0, v1, v2, v3}, Lorg/ksoap2/transport/OkHttpServiceConnectionSE;-><init>(Ljava/net/Proxy;Ljava/lang/String;I)V

    return-object v0

    .line 56
    :cond_0
    new-instance v0, Lorg/ksoap2/transport/OkHttpServiceConnectionSE;

    iget-object v1, p0, Lorg/ksoap2/transport/OkHttpTransportSE;->client:Lokhttp3/OkHttpClient;

    iget-object v2, p0, Lorg/ksoap2/transport/OkHttpTransportSE;->proxy:Ljava/net/Proxy;

    iget-object v3, p0, Lorg/ksoap2/transport/OkHttpTransportSE;->url:Ljava/lang/String;

    iget v4, p0, Lorg/ksoap2/transport/OkHttpTransportSE;->timeout:I

    invoke-direct {v0, v1, v2, v3, v4}, Lorg/ksoap2/transport/OkHttpServiceConnectionSE;-><init>(Lokhttp3/OkHttpClient;Ljava/net/Proxy;Ljava/lang/String;I)V

    return-object v0
.end method
