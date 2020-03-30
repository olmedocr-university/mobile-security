.class public Lorg/ksoap2/transport/HttpsTransportSE;
.super Lorg/ksoap2/transport/HttpTransportSE;
.source "HttpsTransportSE.java"


# static fields
.field static final PROTOCOL:Ljava/lang/String; = "https"

.field private static final PROTOCOL_FULL:Ljava/lang/String; = "https://"


# instance fields
.field private connection:Lorg/ksoap2/transport/HttpsServiceConnectionSE;

.field protected final file:Ljava/lang/String;

.field protected final host:Ljava/lang/String;

.field protected final port:I


# direct methods
.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;I)V
    .locals 6

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move-object v3, p3

    move v4, p4

    move v5, p4

    .line 27
    invoke-direct/range {v0 .. v5}, Lorg/ksoap2/transport/HttpsTransportSE;-><init>(Ljava/lang/String;ILjava/lang/String;II)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;II)V
    .locals 2

    .line 31
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "https://"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0, p4, p5}, Lorg/ksoap2/transport/HttpTransportSE;-><init>(Ljava/lang/String;II)V

    .line 32
    iput-object p1, p0, Lorg/ksoap2/transport/HttpsTransportSE;->host:Ljava/lang/String;

    .line 33
    iput p2, p0, Lorg/ksoap2/transport/HttpsTransportSE;->port:I

    .line 34
    iput-object p3, p0, Lorg/ksoap2/transport/HttpsTransportSE;->file:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/net/Proxy;Ljava/lang/String;ILjava/lang/String;I)V
    .locals 7

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move-object v4, p4

    move v5, p5

    move v6, p5

    .line 45
    invoke-direct/range {v0 .. v6}, Lorg/ksoap2/transport/HttpsTransportSE;-><init>(Ljava/net/Proxy;Ljava/lang/String;ILjava/lang/String;II)V

    return-void
.end method

.method public constructor <init>(Ljava/net/Proxy;Ljava/lang/String;ILjava/lang/String;II)V
    .locals 2

    .line 56
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "https://"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lorg/ksoap2/transport/HttpTransportSE;-><init>(Ljava/net/Proxy;Ljava/lang/String;)V

    .line 57
    iput-object p2, p0, Lorg/ksoap2/transport/HttpsTransportSE;->host:Ljava/lang/String;

    .line 58
    iput p3, p0, Lorg/ksoap2/transport/HttpsTransportSE;->port:I

    .line 59
    iput-object p4, p0, Lorg/ksoap2/transport/HttpsTransportSE;->file:Ljava/lang/String;

    .line 60
    iput p5, p0, Lorg/ksoap2/transport/HttpsTransportSE;->timeout:I

    .line 61
    iput p6, p0, Lorg/ksoap2/transport/HttpsTransportSE;->readTimeout:I

    return-void
.end method


# virtual methods
.method public getServiceConnection()Lorg/ksoap2/transport/ServiceConnection;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 70
    iget-object v0, p0, Lorg/ksoap2/transport/HttpsTransportSE;->connection:Lorg/ksoap2/transport/HttpsServiceConnectionSE;

    if-eqz v0, :cond_0

    return-object v0

    .line 73
    :cond_0
    new-instance v0, Lorg/ksoap2/transport/HttpsServiceConnectionSE;

    iget-object v2, p0, Lorg/ksoap2/transport/HttpsTransportSE;->proxy:Ljava/net/Proxy;

    iget-object v3, p0, Lorg/ksoap2/transport/HttpsTransportSE;->host:Ljava/lang/String;

    iget v4, p0, Lorg/ksoap2/transport/HttpsTransportSE;->port:I

    iget-object v5, p0, Lorg/ksoap2/transport/HttpsTransportSE;->file:Ljava/lang/String;

    iget v6, p0, Lorg/ksoap2/transport/HttpsTransportSE;->timeout:I

    iget v7, p0, Lorg/ksoap2/transport/HttpsTransportSE;->readTimeout:I

    move-object v1, v0

    invoke-direct/range {v1 .. v7}, Lorg/ksoap2/transport/HttpsServiceConnectionSE;-><init>(Ljava/net/Proxy;Ljava/lang/String;ILjava/lang/String;II)V

    iput-object v0, p0, Lorg/ksoap2/transport/HttpsTransportSE;->connection:Lorg/ksoap2/transport/HttpsServiceConnectionSE;

    return-object v0
.end method
