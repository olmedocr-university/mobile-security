.class public Lorg/ksoap2/transport/HttpResponseException;
.super Ljava/io/IOException;
.source "HttpResponseException.java"


# instance fields
.field private responseHeaders:Ljava/util/List;

.field private statusCode:I


# direct methods
.method public constructor <init>(I)V
    .locals 0

    .line 18
    invoke-direct {p0}, Ljava/io/IOException;-><init>()V

    .line 19
    iput p1, p0, Lorg/ksoap2/transport/HttpResponseException;->statusCode:I

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .line 23
    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 24
    iput p2, p0, Lorg/ksoap2/transport/HttpResponseException;->statusCode:I

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILjava/util/List;)V
    .locals 0

    .line 28
    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 29
    iput p2, p0, Lorg/ksoap2/transport/HttpResponseException;->statusCode:I

    .line 30
    iput-object p3, p0, Lorg/ksoap2/transport/HttpResponseException;->responseHeaders:Ljava/util/List;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Throwable;I)V
    .locals 0

    .line 34
    invoke-direct {p0, p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 35
    iput p3, p0, Lorg/ksoap2/transport/HttpResponseException;->statusCode:I

    return-void
.end method

.method public constructor <init>(Ljava/lang/Throwable;I)V
    .locals 0

    .line 39
    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/Throwable;)V

    .line 40
    iput p2, p0, Lorg/ksoap2/transport/HttpResponseException;->statusCode:I

    return-void
.end method


# virtual methods
.method public getResponseHeaders()Ljava/util/List;
    .locals 1

    .line 58
    iget-object v0, p0, Lorg/ksoap2/transport/HttpResponseException;->responseHeaders:Ljava/util/List;

    return-object v0
.end method

.method public getStatusCode()I
    .locals 1

    .line 49
    iget v0, p0, Lorg/ksoap2/transport/HttpResponseException;->statusCode:I

    return v0
.end method
