.class public Lorg/ksoap2/serialization/MarshalHashtable;
.super Ljava/lang/Object;
.source "MarshalHashtable.java"

# interfaces
.implements Lorg/ksoap2/serialization/Marshal;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/ksoap2/serialization/MarshalHashtable$ItemSoapObject;
    }
.end annotation


# static fields
.field public static final HASHTABLE_CLASS:Ljava/lang/Class;

.field public static final NAME:Ljava/lang/String; = "Map"

.field public static final NAMESPACE:Ljava/lang/String; = "http://xml.apache.org/xml-soap"


# instance fields
.field envelope:Lorg/ksoap2/serialization/SoapSerializationEnvelope;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 46
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/ksoap2/serialization/MarshalHashtable;->HASHTABLE_CLASS:Ljava/lang/Class;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public readInstance(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;Ljava/lang/String;Lorg/ksoap2/serialization/PropertyInfo;)Ljava/lang/Object;
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/xmlpull/v1/XmlPullParserException;
        }
    .end annotation

    .line 51
    new-instance p2, Ljava/util/Hashtable;

    invoke-direct {p2}, Ljava/util/Hashtable;-><init>()V

    .line 52
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object p3

    .line 53
    :goto_0
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextTag()I

    move-result p4

    const/4 v0, 0x0

    const/4 v1, 0x3

    if-eq p4, v1, :cond_2

    .line 54
    new-instance p4, Lorg/ksoap2/serialization/MarshalHashtable$ItemSoapObject;

    invoke-direct {p4, p0, p2}, Lorg/ksoap2/serialization/MarshalHashtable$ItemSoapObject;-><init>(Lorg/ksoap2/serialization/MarshalHashtable;Ljava/util/Hashtable;)V

    const/4 v2, 0x2

    const-string v9, "item"

    .line 55
    invoke-interface {p1, v2, v0, v9}, Lorg/xmlpull/v1/XmlPullParser;->require(ILjava/lang/String;Ljava/lang/String;)V

    .line 56
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextTag()I

    .line 57
    iget-object v2, p0, Lorg/ksoap2/serialization/MarshalHashtable;->envelope:Lorg/ksoap2/serialization/SoapSerializationEnvelope;

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    sget-object v8, Lorg/ksoap2/serialization/PropertyInfo;->OBJECT_TYPE:Lorg/ksoap2/serialization/PropertyInfo;

    move-object v3, p1

    move-object v4, p4

    invoke-virtual/range {v2 .. v8}, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->read(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/Object;ILjava/lang/String;Ljava/lang/String;Lorg/ksoap2/serialization/PropertyInfo;)Ljava/lang/Object;

    move-result-object v2

    .line 58
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextTag()I

    if-eqz v2, :cond_0

    const/4 v3, 0x0

    .line 60
    invoke-virtual {p4, v3, v2}, Lorg/ksoap2/serialization/SoapObject;->setProperty(ILjava/lang/Object;)V

    .line 62
    :cond_0
    iget-object v2, p0, Lorg/ksoap2/serialization/MarshalHashtable;->envelope:Lorg/ksoap2/serialization/SoapSerializationEnvelope;

    const/4 v5, 0x1

    const/4 v6, 0x0

    const/4 v7, 0x0

    sget-object v8, Lorg/ksoap2/serialization/PropertyInfo;->OBJECT_TYPE:Lorg/ksoap2/serialization/PropertyInfo;

    move-object v3, p1

    move-object v4, p4

    invoke-virtual/range {v2 .. v8}, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->read(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/Object;ILjava/lang/String;Ljava/lang/String;Lorg/ksoap2/serialization/PropertyInfo;)Ljava/lang/Object;

    move-result-object v2

    .line 63
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextTag()I

    if-eqz v2, :cond_1

    const/4 v3, 0x1

    .line 65
    invoke-virtual {p4, v3, v2}, Lorg/ksoap2/serialization/SoapObject;->setProperty(ILjava/lang/Object;)V

    .line 67
    :cond_1
    invoke-interface {p1, v1, v0, v9}, Lorg/xmlpull/v1/XmlPullParser;->require(ILjava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 69
    :cond_2
    invoke-interface {p1, v1, v0, p3}, Lorg/xmlpull/v1/XmlPullParser;->require(ILjava/lang/String;Ljava/lang/String;)V

    return-object p2
.end method

.method public register(Lorg/ksoap2/serialization/SoapSerializationEnvelope;)V
    .locals 3

    .line 116
    iput-object p1, p0, Lorg/ksoap2/serialization/MarshalHashtable;->envelope:Lorg/ksoap2/serialization/SoapSerializationEnvelope;

    .line 117
    sget-object v0, Lorg/ksoap2/serialization/MarshalHashtable;->HASHTABLE_CLASS:Ljava/lang/Class;

    const-string v1, "http://xml.apache.org/xml-soap"

    const-string v2, "Map"

    invoke-virtual {p1, v1, v2, v0, p0}, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->addMapping(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Class;Lorg/ksoap2/serialization/Marshal;)V

    return-void
.end method

.method public writeInstance(Lorg/xmlpull/v1/XmlSerializer;Ljava/lang/Object;)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 74
    check-cast p2, Ljava/util/Hashtable;

    .line 75
    new-instance v0, Lorg/ksoap2/serialization/SoapObject;

    const/4 v1, 0x0

    invoke-direct {v0, v1, v1}, Lorg/ksoap2/serialization/SoapObject;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "key"

    .line 76
    invoke-virtual {v0, v2, v1}, Lorg/ksoap2/serialization/SoapObject;->addProperty(Ljava/lang/String;Ljava/lang/Object;)Lorg/ksoap2/serialization/SoapObject;

    const-string v2, "value"

    .line 77
    invoke-virtual {v0, v2, v1}, Lorg/ksoap2/serialization/SoapObject;->addProperty(Ljava/lang/String;Ljava/lang/Object;)Lorg/ksoap2/serialization/SoapObject;

    .line 78
    invoke-virtual {p2}, Ljava/util/Hashtable;->keys()Ljava/util/Enumeration;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v2

    if-eqz v2, :cond_0

    const-string v2, "item"

    const-string v3, ""

    .line 79
    invoke-interface {p1, v3, v2}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 80
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v4

    const/4 v5, 0x0

    .line 81
    invoke-virtual {v0, v5, v4}, Lorg/ksoap2/serialization/SoapObject;->setProperty(ILjava/lang/Object;)V

    const/4 v5, 0x1

    .line 82
    invoke-virtual {p2, v4}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v0, v5, v4}, Lorg/ksoap2/serialization/SoapObject;->setProperty(ILjava/lang/Object;)V

    .line 83
    iget-object v4, p0, Lorg/ksoap2/serialization/MarshalHashtable;->envelope:Lorg/ksoap2/serialization/SoapSerializationEnvelope;

    invoke-virtual {v4, p1, v0}, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->writeObjectBodyWithAttributes(Lorg/xmlpull/v1/XmlSerializer;Lorg/ksoap2/serialization/KvmSerializable;)V

    .line 84
    invoke-interface {p1, v3, v2}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    goto :goto_0

    :cond_0
    return-void
.end method
