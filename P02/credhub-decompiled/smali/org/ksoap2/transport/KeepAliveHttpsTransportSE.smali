.class public Lorg/ksoap2/transport/KeepAliveHttpsTransportSE;
.super Lorg/ksoap2/transport/HttpsTransportSE;
.source "KeepAliveHttpsTransportSE.java"


# direct methods
.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;I)V
    .locals 0

    .line 28
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/ksoap2/transport/HttpsTransportSE;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

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

    .line 40
    new-instance v0, Lorg/ksoap2/transport/HttpsServiceConnectionSEIgnoringConnectionClose;

    iget-object v1, p0, Lorg/ksoap2/transport/KeepAliveHttpsTransportSE;->host:Ljava/lang/String;

    iget v2, p0, Lorg/ksoap2/transport/KeepAliveHttpsTransportSE;->port:I

    iget-object v3, p0, Lorg/ksoap2/transport/KeepAliveHttpsTransportSE;->file:Ljava/lang/String;

    iget v4, p0, Lorg/ksoap2/transport/KeepAliveHttpsTransportSE;->timeout:I

    invoke-direct {v0, v1, v2, v3, v4}, Lorg/ksoap2/transport/HttpsServiceConnectionSEIgnoringConnectionClose;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    const-string v1, "Connection"

    const-string v2, "keep-alive"

    .line 42
    invoke-interface {v0, v1, v2}, Lorg/ksoap2/transport/ServiceConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method
