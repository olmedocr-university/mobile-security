.class Lorg/ksoap2/serialization/DM;
.super Ljava/lang/Object;
.source "DM.java"

# interfaces
.implements Lorg/ksoap2/serialization/Marshal;


# direct methods
.method constructor <init>()V
    .locals 0

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public readInstance(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;Ljava/lang/String;Lorg/ksoap2/serialization/PropertyInfo;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/xmlpull/v1/XmlPullParserException;
        }
    .end annotation

    .line 38
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x0

    .line 39
    invoke-virtual {p3, p2}, Ljava/lang/String;->charAt(I)C

    move-result p2

    const/16 p3, 0x62

    if-eq p2, p3, :cond_3

    const/16 p3, 0x69

    if-eq p2, p3, :cond_2

    const/16 p3, 0x6c

    if-eq p2, p3, :cond_1

    const/16 p3, 0x73

    if-ne p2, p3, :cond_0

    return-object p1

    .line 49
    :cond_0
    new-instance p1, Ljava/lang/RuntimeException;

    invoke-direct {p1}, Ljava/lang/RuntimeException;-><init>()V

    throw p1

    .line 45
    :cond_1
    new-instance p2, Ljava/lang/Long;

    invoke-static {p1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide p3

    invoke-direct {p2, p3, p4}, Ljava/lang/Long;-><init>(J)V

    return-object p2

    .line 43
    :cond_2
    new-instance p2, Ljava/lang/Integer;

    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p1

    invoke-direct {p2, p1}, Ljava/lang/Integer;-><init>(I)V

    return-object p2

    .line 47
    :cond_3
    new-instance p2, Ljava/lang/Boolean;

    invoke-static {p1}, Lorg/ksoap2/SoapEnvelope;->stringToBoolean(Ljava/lang/String;)Z

    move-result p1

    invoke-direct {p2, p1}, Ljava/lang/Boolean;-><init>(Z)V

    return-object p2
.end method

.method public register(Lorg/ksoap2/serialization/SoapSerializationEnvelope;)V
    .locals 3

    .line 108
    iget-object v0, p1, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->xsd:Ljava/lang/String;

    sget-object v1, Lorg/ksoap2/serialization/PropertyInfo;->INTEGER_CLASS:Ljava/lang/Class;

    const-string v2, "int"

    invoke-virtual {p1, v0, v2, v1, p0}, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->addMapping(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Class;Lorg/ksoap2/serialization/Marshal;)V

    .line 109
    iget-object v0, p1, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->xsd:Ljava/lang/String;

    sget-object v1, Lorg/ksoap2/serialization/PropertyInfo;->LONG_CLASS:Ljava/lang/Class;

    const-string v2, "long"

    invoke-virtual {p1, v0, v2, v1, p0}, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->addMapping(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Class;Lorg/ksoap2/serialization/Marshal;)V

    .line 110
    iget-object v0, p1, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->xsd:Ljava/lang/String;

    sget-object v1, Lorg/ksoap2/serialization/PropertyInfo;->STRING_CLASS:Ljava/lang/Class;

    const-string v2, "string"

    invoke-virtual {p1, v0, v2, v1, p0}, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->addMapping(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Class;Lorg/ksoap2/serialization/Marshal;)V

    .line 111
    iget-object v0, p1, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->xsd:Ljava/lang/String;

    sget-object v1, Lorg/ksoap2/serialization/PropertyInfo;->BOOLEAN_CLASS:Ljava/lang/Class;

    const-string v2, "boolean"

    invoke-virtual {p1, v0, v2, v1, p0}, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->addMapping(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Class;Lorg/ksoap2/serialization/Marshal;)V

    return-void
.end method

.method public writeInstance(Lorg/xmlpull/v1/XmlSerializer;Ljava/lang/Object;)V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 62
    instance-of v0, p2, Lorg/ksoap2/serialization/AttributeContainer;

    const-string v1, ""

    const/4 v2, 0x0

    if-eqz v0, :cond_2

    .line 63
    move-object v0, p2

    check-cast v0, Lorg/ksoap2/serialization/AttributeContainer;

    .line 64
    invoke-virtual {v0}, Lorg/ksoap2/serialization/AttributeContainer;->getAttributeCount()I

    move-result v3

    :goto_0
    if-ge v2, v3, :cond_5

    .line 66
    new-instance v4, Lorg/ksoap2/serialization/AttributeInfo;

    invoke-direct {v4}, Lorg/ksoap2/serialization/AttributeInfo;-><init>()V

    .line 67
    invoke-virtual {v0, v2, v4}, Lorg/ksoap2/serialization/AttributeContainer;->getAttributeInfo(ILorg/ksoap2/serialization/AttributeInfo;)V

    .line 69
    :try_start_0
    invoke-virtual {v0, v2, v4}, Lorg/ksoap2/serialization/AttributeContainer;->getAttribute(ILorg/ksoap2/serialization/AttributeInfo;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v5

    .line 71
    invoke-virtual {v5}, Ljava/lang/Exception;->printStackTrace()V

    .line 73
    :goto_1
    invoke-virtual {v4}, Lorg/ksoap2/serialization/AttributeInfo;->getValue()Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_1

    .line 74
    invoke-virtual {v4}, Lorg/ksoap2/serialization/AttributeInfo;->getNamespace()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4}, Lorg/ksoap2/serialization/AttributeInfo;->getName()Ljava/lang/String;

    move-result-object v6

    .line 75
    invoke-virtual {v4}, Lorg/ksoap2/serialization/AttributeInfo;->getValue()Ljava/lang/Object;

    move-result-object v7

    if-eqz v7, :cond_0

    invoke-virtual {v4}, Lorg/ksoap2/serialization/AttributeInfo;->getValue()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_2

    :cond_0
    move-object v4, v1

    .line 74
    :goto_2
    invoke-interface {p1, v5, v6, v4}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 78
    :cond_2
    instance-of v0, p2, Lorg/ksoap2/serialization/HasAttributes;

    if-eqz v0, :cond_5

    .line 79
    move-object v0, p2

    check-cast v0, Lorg/ksoap2/serialization/HasAttributes;

    .line 80
    invoke-interface {v0}, Lorg/ksoap2/serialization/HasAttributes;->getAttributeCount()I

    move-result v3

    :goto_3
    if-ge v2, v3, :cond_5

    .line 82
    new-instance v4, Lorg/ksoap2/serialization/AttributeInfo;

    invoke-direct {v4}, Lorg/ksoap2/serialization/AttributeInfo;-><init>()V

    .line 83
    invoke-interface {v0, v2, v4}, Lorg/ksoap2/serialization/HasAttributes;->getAttributeInfo(ILorg/ksoap2/serialization/AttributeInfo;)V

    .line 85
    :try_start_1
    invoke-interface {v0, v2, v4}, Lorg/ksoap2/serialization/HasAttributes;->getAttribute(ILorg/ksoap2/serialization/AttributeInfo;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_4

    :catch_1
    move-exception v5

    .line 87
    invoke-virtual {v5}, Ljava/lang/Exception;->printStackTrace()V

    .line 89
    :goto_4
    invoke-virtual {v4}, Lorg/ksoap2/serialization/AttributeInfo;->getValue()Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_4

    .line 90
    invoke-virtual {v4}, Lorg/ksoap2/serialization/AttributeInfo;->getNamespace()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4}, Lorg/ksoap2/serialization/AttributeInfo;->getName()Ljava/lang/String;

    move-result-object v6

    .line 91
    invoke-virtual {v4}, Lorg/ksoap2/serialization/AttributeInfo;->getValue()Ljava/lang/Object;

    move-result-object v7

    if-eqz v7, :cond_3

    invoke-virtual {v4}, Lorg/ksoap2/serialization/AttributeInfo;->getValue()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_5

    :cond_3
    move-object v4, v1

    .line 90
    :goto_5
    invoke-interface {p1, v5, v6, v4}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    :cond_4
    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    .line 96
    :cond_5
    instance-of v0, p2, Lorg/ksoap2/serialization/ValueWriter;

    if-eqz v0, :cond_6

    .line 98
    check-cast p2, Lorg/ksoap2/serialization/ValueWriter;

    invoke-interface {p2, p1}, Lorg/ksoap2/serialization/ValueWriter;->write(Lorg/xmlpull/v1/XmlSerializer;)V

    goto :goto_6

    .line 102
    :cond_6
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-interface {p1, p2}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    :goto_6
    return-void
.end method
