.class public final Lorg/kobjects/util/Util;
.super Ljava/lang/Object;
.source "Util.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static buildUrl(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 5

    const/16 v0, 0x3a

    .line 58
    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    const-string v2, "/"

    .line 62
    invoke-virtual {p1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    const-string v4, "file:///"

    if-nez v3, :cond_5

    const/4 v3, 0x1

    if-ne v1, v3, :cond_0

    goto :goto_1

    :cond_0
    const/4 v3, 0x2

    if-le v1, v3, :cond_1

    const/4 v3, 0x6

    if-ge v1, v3, :cond_1

    return-object p1

    :cond_1
    if-nez p0, :cond_2

    goto :goto_0

    .line 73
    :cond_2
    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_3

    .line 74
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 76
    :cond_3
    invoke-virtual {p0, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_4

    .line 77
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_0

    :cond_4
    move-object v4, p0

    .line 80
    :goto_0
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 63
    :cond_5
    :goto_1
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static indexOf([Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 2

    const/4 v0, 0x0

    .line 49
    :goto_0
    array-length v1, p0

    if-ge v0, v1, :cond_1

    .line 50
    aget-object v1, p0, v0

    invoke-virtual {v1, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    return v0

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    const/4 p0, -0x1

    return p0
.end method

.method public static sort([Ljava/lang/Object;II)V
    .locals 9

    sub-int v0, p2, p1

    const/4 v1, 0x2

    if-gt v0, v1, :cond_1

    if-ne v0, v1, :cond_0

    .line 87
    aget-object p2, p0, p1

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    add-int/lit8 v0, p1, 0x1

    aget-object v1, p0, v0

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result p2

    if-lez p2, :cond_0

    .line 90
    aget-object p2, p0, p1

    .line 91
    aget-object v1, p0, v0

    aput-object v1, p0, p1

    .line 92
    aput-object p2, p0, v0

    :cond_0
    return-void

    :cond_1
    const/4 v2, 0x3

    if-ne v0, v2, :cond_2

    add-int/lit8 p2, p1, 0x2

    .line 100
    invoke-static {p0, p1, p2}, Lorg/kobjects/util/Util;->sort([Ljava/lang/Object;II)V

    add-int/lit8 v0, p1, 0x1

    add-int/lit8 v1, p1, 0x3

    .line 101
    invoke-static {p0, v0, v1}, Lorg/kobjects/util/Util;->sort([Ljava/lang/Object;II)V

    .line 102
    invoke-static {p0, p1, p2}, Lorg/kobjects/util/Util;->sort([Ljava/lang/Object;II)V

    return-void

    :cond_2
    add-int v2, p1, p2

    .line 107
    div-int/2addr v2, v1

    .line 109
    invoke-static {p0, p1, v2}, Lorg/kobjects/util/Util;->sort([Ljava/lang/Object;II)V

    .line 110
    invoke-static {p0, v2, p2}, Lorg/kobjects/util/Util;->sort([Ljava/lang/Object;II)V

    .line 112
    new-array v1, v0, [Ljava/lang/Object;

    const/4 v3, 0x0

    move v5, p1

    move v6, v2

    move v4, v3

    :goto_0
    if-ge v4, v0, :cond_6

    if-ne v5, v2, :cond_3

    add-int/lit8 v7, v6, 0x1

    .line 121
    aget-object v6, p0, v6

    aput-object v6, v1, v4

    :goto_1
    move v6, v7

    goto :goto_3

    :cond_3
    if-eq v6, p2, :cond_5

    .line 123
    aget-object v7, p0, v5

    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    aget-object v8, p0, v6

    invoke-virtual {v8}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v7

    if-gez v7, :cond_4

    goto :goto_2

    :cond_4
    add-int/lit8 v7, v6, 0x1

    .line 129
    aget-object v6, p0, v6

    aput-object v6, v1, v4

    goto :goto_1

    :cond_5
    :goto_2
    add-int/lit8 v7, v5, 0x1

    .line 126
    aget-object v5, p0, v5

    aput-object v5, v1, v4

    move v5, v7

    :goto_3
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 133
    :cond_6
    invoke-static {v1, v3, p0, p1, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-void
.end method

.method public static streamcopy(Ljava/io/InputStream;Ljava/io/OutputStream;)Ljava/io/OutputStream;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 34
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Runtime;->freeMemory()J

    move-result-wide v0

    const-wide/32 v2, 0x100000

    cmp-long v0, v0, v2

    if-ltz v0, :cond_0

    const/16 v0, 0x4000

    goto :goto_0

    :cond_0
    const/16 v0, 0x80

    :goto_0
    new-array v1, v0, [B

    :goto_1
    const/4 v2, 0x0

    .line 39
    invoke-virtual {p0, v1, v2, v0}, Ljava/io/InputStream;->read([BII)I

    move-result v3

    const/4 v4, -0x1

    if-ne v3, v4, :cond_1

    .line 44
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V

    return-object p1

    .line 42
    :cond_1
    invoke-virtual {p1, v1, v2, v3}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_1
.end method
