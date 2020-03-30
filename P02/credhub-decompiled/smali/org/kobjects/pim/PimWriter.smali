.class public Lorg/kobjects/pim/PimWriter;
.super Ljava/lang/Object;
.source "PimWriter.java"


# instance fields
.field writer:Ljava/io/Writer;


# direct methods
.method public constructor <init>(Ljava/io/Writer;)V
    .locals 0

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    iput-object p1, p0, Lorg/kobjects/pim/PimWriter;->writer:Ljava/io/Writer;

    return-void
.end method


# virtual methods
.method public writeEntry(Lorg/kobjects/pim/PimItem;)V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 41
    iget-object v0, p0, Lorg/kobjects/pim/PimWriter;->writer:Ljava/io/Writer;

    const-string v1, "begin:"

    invoke-virtual {v0, v1}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 42
    iget-object v0, p0, Lorg/kobjects/pim/PimWriter;->writer:Ljava/io/Writer;

    invoke-virtual {p1}, Lorg/kobjects/pim/PimItem;->getType()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 43
    iget-object v0, p0, Lorg/kobjects/pim/PimWriter;->writer:Ljava/io/Writer;

    const-string v1, "\r\n"

    invoke-virtual {v0, v1}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 45
    invoke-virtual {p1}, Lorg/kobjects/pim/PimItem;->fieldNames()Ljava/util/Enumeration;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 46
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    const/4 v3, 0x0

    .line 47
    :goto_0
    invoke-virtual {p1, v2}, Lorg/kobjects/pim/PimItem;->getFieldCount(Ljava/lang/String;)I

    move-result v4

    if-ge v3, v4, :cond_0

    .line 48
    invoke-virtual {p1, v2, v3}, Lorg/kobjects/pim/PimItem;->getField(Ljava/lang/String;I)Lorg/kobjects/pim/PimField;

    move-result-object v4

    .line 49
    iget-object v5, p0, Lorg/kobjects/pim/PimWriter;->writer:Ljava/io/Writer;

    invoke-virtual {v5, v2}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 50
    iget-object v5, p0, Lorg/kobjects/pim/PimWriter;->writer:Ljava/io/Writer;

    const/16 v6, 0x3a

    invoke-virtual {v5, v6}, Ljava/io/Writer;->write(I)V

    .line 51
    iget-object v5, p0, Lorg/kobjects/pim/PimWriter;->writer:Ljava/io/Writer;

    invoke-virtual {v4}, Lorg/kobjects/pim/PimField;->getValue()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v5, v4}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 52
    iget-object v4, p0, Lorg/kobjects/pim/PimWriter;->writer:Ljava/io/Writer;

    invoke-virtual {v4, v1}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 56
    :cond_1
    iget-object v0, p0, Lorg/kobjects/pim/PimWriter;->writer:Ljava/io/Writer;

    const-string v1, "end:"

    invoke-virtual {v0, v1}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 57
    iget-object v0, p0, Lorg/kobjects/pim/PimWriter;->writer:Ljava/io/Writer;

    invoke-virtual {p1}, Lorg/kobjects/pim/PimItem;->getType()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 58
    iget-object p1, p0, Lorg/kobjects/pim/PimWriter;->writer:Ljava/io/Writer;

    const-string v0, "\r\n\r\n"

    invoke-virtual {p1, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    return-void
.end method
