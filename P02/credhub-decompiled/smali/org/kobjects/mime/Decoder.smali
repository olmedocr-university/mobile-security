.class public Lorg/kobjects/mime/Decoder;
.super Ljava/lang/Object;
.source "Decoder.java"


# instance fields
.field boundary:Ljava/lang/String;

.field buf:[C

.field characterEncoding:Ljava/lang/String;

.field consumed:Z

.field eof:Z

.field header:Ljava/util/Hashtable;

.field is:Ljava/io/InputStream;


# direct methods
.method public constructor <init>(Ljava/io/InputStream;Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 120
    invoke-direct {p0, p1, p2, v0}, Lorg/kobjects/mime/Decoder;-><init>(Ljava/io/InputStream;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 123
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x100

    new-array v0, v0, [C

    .line 37
    iput-object v0, p0, Lorg/kobjects/mime/Decoder;->buf:[C

    .line 125
    iput-object p3, p0, Lorg/kobjects/mime/Decoder;->characterEncoding:Ljava/lang/String;

    .line 126
    iput-object p1, p0, Lorg/kobjects/mime/Decoder;->is:Ljava/io/InputStream;

    .line 127
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "--"

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lorg/kobjects/mime/Decoder;->boundary:Ljava/lang/String;

    .line 133
    :cond_0
    invoke-direct {p0}, Lorg/kobjects/mime/Decoder;->readLine()Ljava/lang/String;

    move-result-object p2

    if-eqz p2, :cond_2

    .line 140
    iget-object p3, p0, Lorg/kobjects/mime/Decoder;->boundary:Ljava/lang/String;

    invoke-virtual {p2, p3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p3

    if-eqz p3, :cond_0

    .line 146
    invoke-virtual {p2, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p2

    const/4 p3, 0x1

    if-eqz p2, :cond_1

    .line 147
    iput-boolean p3, p0, Lorg/kobjects/mime/Decoder;->eof:Z

    .line 148
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V

    .line 151
    :cond_1
    iput-boolean p3, p0, Lorg/kobjects/mime/Decoder;->consumed:Z

    return-void

    .line 135
    :cond_2
    new-instance p1, Ljava/io/IOException;

    const-string p2, "Unexpected EOF"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public static getHeaderElements(Ljava/lang/String;)Ljava/util/Hashtable;
    .locals 9

    .line 71
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    .line 72
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    const-string v2, ""

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v1, :cond_0

    .line 77
    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v4

    const/16 v5, 0x20

    if-gt v4, v5, :cond_0

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_0
    if-lt v3, v1, :cond_1

    goto/16 :goto_2

    .line 82
    :cond_1
    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v4

    const/16 v5, 0x3b

    const/16 v6, 0x22

    const/4 v7, -0x1

    if-ne v4, v6, :cond_5

    add-int/lit8 v3, v3, 0x1

    .line 84
    invoke-virtual {p0, v6, v3}, Ljava/lang/String;->indexOf(II)I

    move-result v4

    if-eq v4, v7, :cond_4

    .line 88
    invoke-virtual {p0, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v4, v4, 0x2

    if-lt v4, v1, :cond_2

    goto :goto_2

    :cond_2
    add-int/lit8 v2, v4, -0x1

    .line 93
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    if-ne v2, v5, :cond_3

    goto :goto_1

    .line 94
    :cond_3
    new-instance v0, Ljava/lang/RuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "; expected in "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 86
    :cond_4
    new-instance v0, Ljava/lang/RuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "End quote expected in "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 97
    :cond_5
    invoke-virtual {p0, v5, v3}, Ljava/lang/String;->indexOf(II)I

    move-result v4

    if-ne v4, v7, :cond_6

    .line 99
    invoke-virtual {p0, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, v2, p0}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2

    .line 102
    :cond_6
    invoke-virtual {p0, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v4, v4, 0x1

    :goto_1
    const/16 v2, 0x3d

    .line 106
    invoke-virtual {p0, v2, v4}, Ljava/lang/String;->indexOf(II)I

    move-result v2

    if-ne v2, v7, :cond_7

    :goto_2
    return-object v0

    .line 111
    :cond_7
    invoke-virtual {p0, v4, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    add-int/lit8 v2, v2, 0x1

    move-object v8, v3

    move v3, v2

    move-object v2, v8

    goto/16 :goto_0
.end method

.method private final readLine()Ljava/lang/String;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    move v1, v0

    .line 46
    :cond_0
    :goto_0
    iget-object v2, p0, Lorg/kobjects/mime/Decoder;->is:Ljava/io/InputStream;

    invoke-virtual {v2}, Ljava/io/InputStream;->read()I

    move-result v2

    const/4 v3, -0x1

    if-ne v2, v3, :cond_1

    if-nez v1, :cond_1

    const/4 v0, 0x0

    return-object v0

    :cond_1
    if-eq v2, v3, :cond_4

    const/16 v3, 0xa

    if-ne v2, v3, :cond_2

    goto :goto_1

    :cond_2
    const/16 v3, 0xd

    if-eq v2, v3, :cond_0

    .line 52
    iget-object v3, p0, Lorg/kobjects/mime/Decoder;->buf:[C

    array-length v4, v3

    if-lt v1, v4, :cond_3

    .line 53
    array-length v4, v3

    mul-int/lit8 v4, v4, 0x3

    div-int/lit8 v4, v4, 0x2

    new-array v4, v4, [C

    .line 54
    array-length v5, v3

    invoke-static {v3, v0, v4, v0, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 55
    iput-object v4, p0, Lorg/kobjects/mime/Decoder;->buf:[C

    .line 58
    :cond_3
    iget-object v3, p0, Lorg/kobjects/mime/Decoder;->buf:[C

    add-int/lit8 v4, v1, 0x1

    int-to-char v2, v2

    aput-char v2, v3, v1

    move v1, v4

    goto :goto_0

    .line 50
    :cond_4
    :goto_1
    new-instance v2, Ljava/lang/String;

    iget-object v3, p0, Lorg/kobjects/mime/Decoder;->buf:[C

    invoke-direct {v2, v3, v0, v1}, Ljava/lang/String;-><init>([CII)V

    return-object v2
.end method


# virtual methods
.method public getHeader(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 160
    iget-object v0, p0, Lorg/kobjects/mime/Decoder;->header:Ljava/util/Hashtable;

    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    return-object p1
.end method

.method public getHeaderNames()Ljava/util/Enumeration;
    .locals 1

    .line 156
    iget-object v0, p0, Lorg/kobjects/mime/Decoder;->header:Ljava/util/Hashtable;

    invoke-virtual {v0}, Ljava/util/Hashtable;->keys()Ljava/util/Enumeration;

    move-result-object v0

    return-object v0
.end method

.method public next()Z
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 241
    iget-boolean v0, p0, Lorg/kobjects/mime/Decoder;->consumed:Z

    if-nez v0, :cond_0

    const/4 v0, 0x0

    .line 242
    invoke-virtual {p0, v0}, Lorg/kobjects/mime/Decoder;->readContent(Ljava/io/OutputStream;)V

    .line 244
    :cond_0
    iget-boolean v0, p0, Lorg/kobjects/mime/Decoder;->eof:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    return v1

    .line 250
    :cond_1
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    iput-object v0, p0, Lorg/kobjects/mime/Decoder;->header:Ljava/util/Hashtable;

    .line 254
    :goto_0
    invoke-direct {p0}, Lorg/kobjects/mime/Decoder;->readLine()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_4

    const-string v2, ""

    .line 255
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    goto :goto_1

    :cond_2
    const/16 v2, 0x3a

    .line 257
    invoke-virtual {v0, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    const/4 v3, -0x1

    if-eq v2, v3, :cond_3

    .line 261
    iget-object v3, p0, Lorg/kobjects/mime/Decoder;->header:Ljava/util/Hashtable;

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v4

    add-int/lit8 v2, v2, 0x1

    invoke-virtual {v0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v4, v0}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 259
    :cond_3
    new-instance v1, Ljava/io/IOException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "colon missing in multipart header line: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 273
    :cond_4
    :goto_1
    iput-boolean v1, p0, Lorg/kobjects/mime/Decoder;->consumed:Z

    const/4 v0, 0x1

    return v0
.end method

.method public readContent()Ljava/lang/String;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 164
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 165
    invoke-virtual {p0, v0}, Lorg/kobjects/mime/Decoder;->readContent(Ljava/io/OutputStream;)V

    .line 166
    iget-object v1, p0, Lorg/kobjects/mime/Decoder;->characterEncoding:Ljava/lang/String;

    if-nez v1, :cond_0

    new-instance v1, Ljava/lang/String;

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/String;-><init>([B)V

    goto :goto_0

    :cond_0
    new-instance v1, Ljava/lang/String;

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0

    iget-object v2, p0, Lorg/kobjects/mime/Decoder;->characterEncoding:Ljava/lang/String;

    invoke-direct {v1, v0, v2}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    .line 171
    :goto_0
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Field content: \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "\'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    return-object v1
.end method

.method public readContent(Ljava/io/OutputStream;)V
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 176
    iget-boolean v0, p0, Lorg/kobjects/mime/Decoder;->consumed:Z

    if-nez v0, :cond_a

    const-string v0, "Content-Type"

    .line 182
    invoke-virtual {p0, v0}, Lorg/kobjects/mime/Decoder;->getHeader(Ljava/lang/String;)Ljava/lang/String;

    const-string v0, "Content-Transfer-Encoding"

    .line 187
    invoke-virtual {p0, v0}, Lorg/kobjects/mime/Decoder;->getHeader(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "base64"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const-string v1, "Unexpected EOF"

    const/4 v2, 0x1

    if-eqz v0, :cond_2

    .line 188
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 190
    :goto_0
    invoke-direct {p0}, Lorg/kobjects/mime/Decoder;->readLine()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 193
    iget-object v3, p0, Lorg/kobjects/mime/Decoder;->boundary:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    goto :goto_2

    .line 196
    :cond_0
    invoke-static {v0, p1}, Lorg/kobjects/base64/Base64;->decode(Ljava/lang/String;Ljava/io/OutputStream;)V

    goto :goto_0

    .line 192
    :cond_1
    new-instance p1, Ljava/io/IOException;

    invoke-direct {p1, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 201
    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\r\n"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lorg/kobjects/mime/Decoder;->boundary:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v3, 0x0

    move v4, v3

    .line 205
    :cond_3
    :goto_1
    iget-object v5, p0, Lorg/kobjects/mime/Decoder;->is:Ljava/io/InputStream;

    invoke-virtual {v5}, Ljava/io/InputStream;->read()I

    move-result v5

    const/4 v6, -0x1

    if-eq v5, v6, :cond_9

    int-to-char v6, v5

    .line 213
    invoke-virtual {v0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v7

    if-ne v6, v7, :cond_5

    add-int/lit8 v4, v4, 0x1

    .line 215
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v5

    if-ne v4, v5, :cond_3

    .line 229
    invoke-direct {p0}, Lorg/kobjects/mime/Decoder;->readLine()Ljava/lang/String;

    move-result-object v0

    :goto_2
    const-string p1, "--"

    .line 232
    invoke-virtual {v0, p1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_4

    .line 233
    iput-boolean v2, p0, Lorg/kobjects/mime/Decoder;->eof:Z

    .line 235
    :cond_4
    iput-boolean v2, p0, Lorg/kobjects/mime/Decoder;->consumed:Z

    return-void

    :cond_5
    if-lez v4, :cond_8

    move v7, v3

    :goto_3
    if-ge v7, v4, :cond_6

    .line 221
    invoke-virtual {v0, v7}, Ljava/lang/String;->charAt(I)C

    move-result v8

    int-to-byte v8, v8

    invoke-virtual {p1, v8}, Ljava/io/OutputStream;->write(I)V

    add-int/lit8 v7, v7, 0x1

    goto :goto_3

    .line 223
    :cond_6
    invoke-virtual {v0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-ne v6, v4, :cond_7

    move v4, v2

    goto :goto_4

    :cond_7
    move v4, v3

    :cond_8
    :goto_4
    if-nez v4, :cond_3

    int-to-byte v5, v5

    .line 225
    invoke-virtual {p1, v5}, Ljava/io/OutputStream;->write(I)V

    goto :goto_1

    .line 211
    :cond_9
    new-instance p1, Ljava/lang/RuntimeException;

    invoke-direct {p1, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 177
    :cond_a
    new-instance p1, Ljava/lang/RuntimeException;

    const-string v0, "Content already consumed!"

    invoke-direct {p1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
