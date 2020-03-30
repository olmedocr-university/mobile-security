.class public Lorg/ksoap2/transport/KeepAliveHttpTransportSE;
.super Lorg/ksoap2/transport/HttpTransportSE;
.source "KeepAliveHttpTransportSE.java"


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x0

    .line 47
    invoke-direct {p0, v0, p1}, Lorg/ksoap2/transport/HttpTransportSE;-><init>(Ljava/net/Proxy;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .line 72
    invoke-direct {p0, p1, p2}, Lorg/ksoap2/transport/HttpTransportSE;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;II)V
    .locals 0

    .line 90
    invoke-direct {p0, p1, p2}, Lorg/ksoap2/transport/HttpTransportSE;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public constructor <init>(Ljava/net/Proxy;Ljava/lang/String;)V
    .locals 0

    .line 60
    invoke-direct {p0, p1, p2}, Lorg/ksoap2/transport/HttpTransportSE;-><init>(Ljava/net/Proxy;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/net/Proxy;Ljava/lang/String;I)V
    .locals 0

    .line 76
    invoke-direct {p0, p1, p2, p3}, Lorg/ksoap2/transport/HttpTransportSE;-><init>(Ljava/net/Proxy;Ljava/lang/String;I)V

    return-void
.end method

.method public constructor <init>(Ljava/net/Proxy;Ljava/lang/String;II)V
    .locals 0

    .line 94
    invoke-direct {p0, p1, p2, p3}, Lorg/ksoap2/transport/HttpTransportSE;-><init>(Ljava/net/Proxy;Ljava/lang/String;I)V

    return-void
.end method


# virtual methods
.method public call(Ljava/lang/String;Lorg/ksoap2/SoapEnvelope;Ljava/util/List;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/xmlpull/v1/XmlPullParserException;
        }
    .end annotation

    if-nez p3, :cond_0

    .line 115
    new-instance p3, Ljava/util/ArrayList;

    invoke-direct {p3}, Ljava/util/ArrayList;-><init>()V

    :cond_0
    const-string v0, "Connection"

    .line 118
    invoke-virtual {p0, p3, v0}, Lorg/ksoap2/transport/KeepAliveHttpTransportSE;->getHeader(Ljava/util/List;Ljava/lang/String;)Lorg/ksoap2/HeaderProperty;

    move-result-object v1

    const-string v2, "keep-alive"

    if-nez v1, :cond_1

    .line 121
    new-instance v1, Lorg/ksoap2/HeaderProperty;

    invoke-direct {v1, v0, v2}, Lorg/ksoap2/HeaderProperty;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 122
    invoke-interface {p3, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 124
    :cond_1
    invoke-virtual {v1, v2}, Lorg/ksoap2/HeaderProperty;->setValue(Ljava/lang/String;)V

    .line 127
    :goto_0
    invoke-super {p0, p1, p2, p3}, Lorg/ksoap2/transport/HttpTransportSE;->call(Ljava/lang/String;Lorg/ksoap2/SoapEnvelope;Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method protected getHeader(Ljava/util/List;Ljava/lang/String;)Lorg/ksoap2/HeaderProperty;
    .locals 3

    if-eqz p1, :cond_1

    const/4 v0, 0x0

    .line 135
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 136
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/ksoap2/HeaderProperty;

    .line 137
    invoke-virtual {v1}, Lorg/ksoap2/HeaderProperty;->getKey()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p2, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_1

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    :goto_1
    return-object v1
.end method
