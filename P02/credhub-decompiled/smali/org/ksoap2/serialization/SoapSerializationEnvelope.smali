.class public Lorg/ksoap2/serialization/SoapSerializationEnvelope;
.super Lorg/ksoap2/SoapEnvelope;
.source "SoapSerializationEnvelope.java"


# static fields
.field private static final ANY_TYPE_LABEL:Ljava/lang/String; = "anyType"

.field private static final ARRAY_MAPPING_NAME:Ljava/lang/String; = "Array"

.field private static final ARRAY_TYPE_LABEL:Ljava/lang/String; = "arrayType"

.field static final DEFAULT_MARSHAL:Lorg/ksoap2/serialization/Marshal;

.field private static final HREF_LABEL:Ljava/lang/String; = "href"

.field private static final ID_LABEL:Ljava/lang/String; = "id"

.field private static final ITEM_LABEL:Ljava/lang/String; = "item"

.field protected static final NIL_LABEL:Ljava/lang/String; = "nil"

.field protected static final NULL_LABEL:Ljava/lang/String; = "null"

.field protected static final QNAME_MARSHAL:I = 0x3

.field protected static final QNAME_NAMESPACE:I = 0x0

.field protected static final QNAME_TYPE:I = 0x1

.field private static final ROOT_LABEL:Ljava/lang/String; = "root"

.field private static final TYPE_LABEL:Ljava/lang/String; = "type"


# instance fields
.field protected addAdornments:Z

.field public avoidExceptionForUnknownProperty:Z

.field protected classToQName:Ljava/util/Hashtable;

.field public dotNet:Z

.field idMap:Ljava/util/Hashtable;

.field public implicitTypes:Z

.field multiRef:Ljava/util/Vector;

.field public properties:Ljava/util/Hashtable;

.field protected qNameToClass:Ljava/util/Hashtable;

.field public skipNullProperties:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 46
    new-instance v0, Lorg/ksoap2/serialization/DM;

    invoke-direct {v0}, Lorg/ksoap2/serialization/DM;-><init>()V

    sput-object v0, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->DEFAULT_MARSHAL:Lorg/ksoap2/serialization/Marshal;

    return-void
.end method

.method public constructor <init>(I)V
    .locals 2

    .line 97
    invoke-direct {p0, p1}, Lorg/ksoap2/SoapEnvelope;-><init>(I)V

    .line 55
    new-instance p1, Ljava/util/Hashtable;

    invoke-direct {p1}, Ljava/util/Hashtable;-><init>()V

    iput-object p1, p0, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->properties:Ljava/util/Hashtable;

    .line 83
    new-instance p1, Ljava/util/Hashtable;

    invoke-direct {p1}, Ljava/util/Hashtable;-><init>()V

    iput-object p1, p0, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->qNameToClass:Ljava/util/Hashtable;

    .line 88
    new-instance p1, Ljava/util/Hashtable;

    invoke-direct {p1}, Ljava/util/Hashtable;-><init>()V

    iput-object p1, p0, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->classToQName:Ljava/util/Hashtable;

    const/4 p1, 0x1

    .line 92
    iput-boolean p1, p0, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->addAdornments:Z

    .line 93
    new-instance p1, Ljava/util/Hashtable;

    invoke-direct {p1}, Ljava/util/Hashtable;-><init>()V

    iput-object p1, p0, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->idMap:Ljava/util/Hashtable;

    .line 98
    iget-object p1, p0, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->enc:Ljava/lang/String;

    sget-object v0, Lorg/ksoap2/serialization/PropertyInfo;->VECTOR_CLASS:Ljava/lang/Class;

    const-string v1, "Array"

    invoke-virtual {p0, p1, v1, v0}, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->addMapping(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Class;)V

    .line 99
    sget-object p1, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->DEFAULT_MARSHAL:Lorg/ksoap2/serialization/Marshal;

    invoke-interface {p1, p0}, Lorg/ksoap2/serialization/Marshal;->register(Lorg/ksoap2/serialization/SoapSerializationEnvelope;)V

    return-void
.end method

.method private getIndex(Ljava/lang/String;II)I
    .locals 2

    if-nez p1, :cond_0

    return p3

    .line 319
    :cond_0
    :try_start_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    sub-int/2addr v0, p2

    const/4 v1, 0x3

    if-ge v0, v1, :cond_1

    goto :goto_0

    :cond_1
    add-int/lit8 p2, p2, 0x1

    .line 320
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    .line 319
    invoke-virtual {p1, p2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :goto_0
    return p3
.end method

.method private writeAttributes(Lorg/xmlpull/v1/XmlSerializer;Lorg/ksoap2/serialization/HasAttributes;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 641
    invoke-interface {p2}, Lorg/ksoap2/serialization/HasAttributes;->getAttributeCount()I

    move-result v0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    .line 643
    new-instance v2, Lorg/ksoap2/serialization/AttributeInfo;

    invoke-direct {v2}, Lorg/ksoap2/serialization/AttributeInfo;-><init>()V

    .line 644
    invoke-interface {p2, v1, v2}, Lorg/ksoap2/serialization/HasAttributes;->getAttributeInfo(ILorg/ksoap2/serialization/AttributeInfo;)V

    .line 645
    invoke-interface {p2, v1, v2}, Lorg/ksoap2/serialization/HasAttributes;->getAttribute(ILorg/ksoap2/serialization/AttributeInfo;)V

    .line 646
    invoke-virtual {v2}, Lorg/ksoap2/serialization/AttributeInfo;->getValue()Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 647
    invoke-virtual {v2}, Lorg/ksoap2/serialization/AttributeInfo;->getNamespace()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2}, Lorg/ksoap2/serialization/AttributeInfo;->getName()Ljava/lang/String;

    move-result-object v4

    .line 648
    invoke-virtual {v2}, Lorg/ksoap2/serialization/AttributeInfo;->getValue()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    .line 647
    invoke-interface {p1, v3, v4, v2}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method private writeInnerText(Lorg/xmlpull/v1/XmlSerializer;Lorg/ksoap2/serialization/KvmSerializable;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 729
    instance-of v0, p2, Lorg/ksoap2/serialization/HasInnerText;

    if-eqz v0, :cond_1

    .line 731
    check-cast p2, Lorg/ksoap2/serialization/HasInnerText;

    invoke-interface {p2}, Lorg/ksoap2/serialization/HasInnerText;->getInnerText()Ljava/lang/Object;

    move-result-object p2

    if-eqz p2, :cond_1

    .line 733
    instance-of v0, p2, Lorg/ksoap2/serialization/ValueWriter;

    if-eqz v0, :cond_0

    .line 735
    check-cast p2, Lorg/ksoap2/serialization/ValueWriter;

    invoke-interface {p2, p1}, Lorg/ksoap2/serialization/ValueWriter;->write(Lorg/xmlpull/v1/XmlSerializer;)V

    goto :goto_0

    .line 739
    :cond_0
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-interface {p1, p2}, Lorg/xmlpull/v1/XmlSerializer;->cdsect(Ljava/lang/String;)V

    :cond_1
    :goto_0
    return-void
.end method


# virtual methods
.method public addMapping(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Class;)V
    .locals 1

    const/4 v0, 0x0

    .line 571
    invoke-virtual {p0, p1, p2, p3, v0}, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->addMapping(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Class;Lorg/ksoap2/serialization/Marshal;)V

    return-void
.end method

.method public addMapping(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Class;Lorg/ksoap2/serialization/Marshal;)V
    .locals 4

    .line 562
    iget-object v0, p0, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->qNameToClass:Ljava/util/Hashtable;

    new-instance v1, Lorg/ksoap2/serialization/SoapPrimitive;

    const/4 v2, 0x0

    invoke-direct {v1, p1, p2, v2}, Lorg/ksoap2/serialization/SoapPrimitive;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    if-nez p4, :cond_0

    move-object v3, p3

    goto :goto_0

    :cond_0
    move-object v3, p4

    .line 563
    :goto_0
    invoke-virtual {v0, v1, v3}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 564
    iget-object v0, p0, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->classToQName:Ljava/util/Hashtable;

    invoke-virtual {p3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p3

    const/4 v1, 0x4

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v1, v3

    const/4 p1, 0x1

    aput-object p2, v1, p1

    const/4 p1, 0x2

    aput-object v2, v1, p1

    const/4 p1, 0x3

    aput-object p4, v1, p1

    invoke-virtual {v0, p3, v1}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public addTemplate(Lorg/ksoap2/serialization/SoapObject;)V
    .locals 5

    .line 579
    iget-object v0, p0, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->qNameToClass:Ljava/util/Hashtable;

    new-instance v1, Lorg/ksoap2/serialization/SoapPrimitive;

    iget-object v2, p1, Lorg/ksoap2/serialization/SoapObject;->namespace:Ljava/lang/String;

    iget-object v3, p1, Lorg/ksoap2/serialization/SoapObject;->name:Ljava/lang/String;

    const/4 v4, 0x0

    invoke-direct {v1, v2, v3, v4}, Lorg/ksoap2/serialization/SoapPrimitive;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {v0, v1, p1}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method protected getIdFromHref(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    const/4 v0, 0x1

    .line 371
    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getInfo(Ljava/lang/Object;Ljava/lang/Object;)[Ljava/lang/Object;
    .locals 6

    if-nez p1, :cond_2

    .line 534
    instance-of p1, p2, Lorg/ksoap2/serialization/SoapObject;

    if-nez p1, :cond_1

    instance-of p1, p2, Lorg/ksoap2/serialization/SoapPrimitive;

    if-eqz p1, :cond_0

    goto :goto_0

    .line 537
    :cond_0
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    goto :goto_1

    :cond_1
    :goto_0
    move-object p1, p2

    .line 540
    :cond_2
    :goto_1
    nop

    instance-of p2, p1, Lorg/ksoap2/serialization/SoapObject;

    const/4 v0, 0x3

    const/4 v1, 0x2

    const/4 v2, 0x1

    const/4 v3, 0x0

    const/4 v4, 0x4

    const/4 v5, 0x0

    if-eqz p2, :cond_3

    .line 541
    check-cast p1, Lorg/ksoap2/serialization/SoapObject;

    new-array p2, v4, [Ljava/lang/Object;

    .line 542
    invoke-virtual {p1}, Lorg/ksoap2/serialization/SoapObject;->getNamespace()Ljava/lang/String;

    move-result-object v4

    aput-object v4, p2, v3

    invoke-virtual {p1}, Lorg/ksoap2/serialization/SoapObject;->getName()Ljava/lang/String;

    move-result-object p1

    aput-object p1, p2, v2

    aput-object v5, p2, v1

    aput-object v5, p2, v0

    return-object p2

    .line 544
    :cond_3
    instance-of p2, p1, Lorg/ksoap2/serialization/SoapPrimitive;

    if-eqz p2, :cond_4

    .line 545
    check-cast p1, Lorg/ksoap2/serialization/SoapPrimitive;

    new-array p2, v4, [Ljava/lang/Object;

    .line 546
    invoke-virtual {p1}, Lorg/ksoap2/serialization/SoapPrimitive;->getNamespace()Ljava/lang/String;

    move-result-object v4

    aput-object v4, p2, v3

    invoke-virtual {p1}, Lorg/ksoap2/serialization/SoapPrimitive;->getName()Ljava/lang/String;

    move-result-object p1

    aput-object p1, p2, v2

    aput-object v5, p2, v1

    sget-object p1, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->DEFAULT_MARSHAL:Lorg/ksoap2/serialization/Marshal;

    aput-object p1, p2, v0

    return-object p2

    .line 548
    :cond_4
    instance-of p2, p1, Ljava/lang/Class;

    if-eqz p2, :cond_5

    sget-object p2, Lorg/ksoap2/serialization/PropertyInfo;->OBJECT_CLASS:Ljava/lang/Class;

    if-eq p1, p2, :cond_5

    .line 549
    iget-object p2, p0, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->classToQName:Ljava/util/Hashtable;

    check-cast p1, Ljava/lang/Class;

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Ljava/lang/Object;

    check-cast p1, [Ljava/lang/Object;

    if-eqz p1, :cond_5

    return-object p1

    :cond_5
    new-array p1, v4, [Ljava/lang/Object;

    .line 554
    iget-object p2, p0, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->xsd:Ljava/lang/String;

    aput-object p2, p1, v3

    const-string p2, "anyType"

    aput-object p2, p1, v2

    aput-object v5, p1, v1

    aput-object v5, p1, v0

    return-object p1
.end method

.method public getResponse()Ljava/lang/Object;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/ksoap2/SoapFault;
        }
    .end annotation

    .line 590
    iget-object v0, p0, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->bodyIn:Ljava/lang/Object;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return-object v1

    .line 593
    :cond_0
    iget-object v0, p0, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->bodyIn:Ljava/lang/Object;

    instance-of v0, v0, Lorg/ksoap2/SoapFault;

    if-nez v0, :cond_4

    .line 596
    iget-object v0, p0, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->bodyIn:Ljava/lang/Object;

    check-cast v0, Lorg/ksoap2/serialization/KvmSerializable;

    .line 598
    invoke-interface {v0}, Lorg/ksoap2/serialization/KvmSerializable;->getPropertyCount()I

    move-result v2

    if-nez v2, :cond_1

    return-object v1

    .line 600
    :cond_1
    invoke-interface {v0}, Lorg/ksoap2/serialization/KvmSerializable;->getPropertyCount()I

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-ne v1, v3, :cond_2

    .line 601
    invoke-interface {v0, v2}, Lorg/ksoap2/serialization/KvmSerializable;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 603
    :cond_2
    new-instance v1, Ljava/util/Vector;

    invoke-direct {v1}, Ljava/util/Vector;-><init>()V

    .line 604
    :goto_0
    invoke-interface {v0}, Lorg/ksoap2/serialization/KvmSerializable;->getPropertyCount()I

    move-result v3

    if-ge v2, v3, :cond_3

    .line 605
    invoke-interface {v0, v2}, Lorg/ksoap2/serialization/KvmSerializable;->getProperty(I)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_3
    return-object v1

    .line 594
    :cond_4
    iget-object v0, p0, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->bodyIn:Ljava/lang/Object;

    check-cast v0, Lorg/ksoap2/SoapFault;

    throw v0
.end method

.method public isAddAdornments()Z
    .locals 1

    .line 106
    iget-boolean v0, p0, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->addAdornments:Z

    return v0
.end method

.method public parseBody(Lorg/xmlpull/v1/XmlPullParser;)V
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/xmlpull/v1/XmlPullParserException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 130
    iput-object v0, p0, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->bodyIn:Ljava/lang/Object;

    .line 131
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextTag()I

    .line 132
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_1

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getNamespace()Ljava/lang/String;

    move-result-object v0

    iget-object v2, p0, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->env:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 133
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v2, "Fault"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 135
    iget v0, p0, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->version:I

    const/16 v1, 0x78

    if-ge v0, v1, :cond_0

    .line 136
    new-instance v0, Lorg/ksoap2/SoapFault;

    iget v1, p0, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->version:I

    invoke-direct {v0, v1}, Lorg/ksoap2/SoapFault;-><init>(I)V

    goto :goto_0

    .line 138
    :cond_0
    new-instance v0, Lorg/ksoap2/SoapFault12;

    iget v1, p0, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->version:I

    invoke-direct {v0, v1}, Lorg/ksoap2/SoapFault12;-><init>(I)V

    .line 140
    :goto_0
    invoke-virtual {v0, p1}, Lorg/ksoap2/SoapFault;->parse(Lorg/xmlpull/v1/XmlPullParser;)V

    .line 141
    iput-object v0, p0, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->bodyIn:Ljava/lang/Object;

    goto :goto_2

    .line 143
    :cond_1
    :goto_1
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v0

    if-ne v0, v1, :cond_4

    .line 144
    iget-object v0, p0, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->enc:Ljava/lang/String;

    const-string v2, "root"

    invoke-interface {p1, v0, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/4 v4, 0x0

    const/4 v5, -0x1

    .line 146
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getNamespace()Ljava/lang/String;

    move-result-object v6

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v7

    sget-object v8, Lorg/ksoap2/serialization/PropertyInfo;->OBJECT_TYPE:Lorg/ksoap2/serialization/PropertyInfo;

    move-object v2, p0

    move-object v3, p1

    invoke-virtual/range {v2 .. v8}, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->read(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/Object;ILjava/lang/String;Ljava/lang/String;Lorg/ksoap2/serialization/PropertyInfo;)Ljava/lang/Object;

    move-result-object v2

    const-string v3, "1"

    .line 148
    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->bodyIn:Ljava/lang/Object;

    if-nez v0, :cond_3

    .line 149
    :cond_2
    iput-object v2, p0, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->bodyIn:Ljava/lang/Object;

    .line 151
    :cond_3
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextTag()I

    goto :goto_1

    :cond_4
    :goto_2
    return-void
.end method

.method public read(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/Object;ILjava/lang/String;Ljava/lang/String;Lorg/ksoap2/serialization/PropertyInfo;)Ljava/lang/Object;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/xmlpull/v1/XmlPullParserException;
        }
    .end annotation

    .line 382
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    const-string v2, "href"

    .line 383
    invoke-interface {p1, v1, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x3

    if-eqz v2, :cond_3

    if-eqz p2, :cond_2

    .line 389
    invoke-virtual {p0, v2}, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->getIdFromHref(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p4

    .line 390
    iget-object p5, p0, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->idMap:Ljava/util/Hashtable;

    invoke-virtual {p5, p4}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p5

    if-eqz p5, :cond_0

    .line 391
    instance-of p6, p5, Lorg/ksoap2/serialization/FwdRef;

    if-eqz p6, :cond_1

    .line 392
    :cond_0
    new-instance p6, Lorg/ksoap2/serialization/FwdRef;

    invoke-direct {p6}, Lorg/ksoap2/serialization/FwdRef;-><init>()V

    .line 393
    check-cast p5, Lorg/ksoap2/serialization/FwdRef;

    iput-object p5, p6, Lorg/ksoap2/serialization/FwdRef;->next:Lorg/ksoap2/serialization/FwdRef;

    .line 394
    iput-object p2, p6, Lorg/ksoap2/serialization/FwdRef;->obj:Ljava/lang/Object;

    .line 395
    iput p3, p6, Lorg/ksoap2/serialization/FwdRef;->index:I

    .line 396
    iget-object p2, p0, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->idMap:Ljava/util/Hashtable;

    invoke-virtual {p2, p4, p6}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object p5, v1

    .line 399
    :cond_1
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextTag()I

    .line 400
    invoke-interface {p1, v3, v1, v0}, Lorg/xmlpull/v1/XmlPullParser;->require(ILjava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_3

    .line 387
    :cond_2
    new-instance p1, Ljava/lang/RuntimeException;

    const-string p2, "href at root level?!?"

    invoke-direct {p1, p2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 402
    :cond_3
    iget-object p2, p0, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->xsi:Ljava/lang/String;

    const-string p3, "nil"

    invoke-interface {p1, p2, p3}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    const-string p3, "id"

    .line 403
    invoke-interface {p1, v1, p3}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    if-nez p2, :cond_4

    .line 405
    iget-object p2, p0, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->xsi:Ljava/lang/String;

    const-string v2, "null"

    invoke-interface {p1, p2, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    :cond_4
    if-eqz p2, :cond_5

    .line 407
    invoke-static {p2}, Lorg/ksoap2/SoapEnvelope;->stringToBoolean(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_5

    .line 409
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextTag()I

    .line 410
    invoke-interface {p1, v3, v1, v0}, Lorg/xmlpull/v1/XmlPullParser;->require(ILjava/lang/String;Ljava/lang/String;)V

    move-object p5, v1

    goto :goto_2

    .line 412
    :cond_5
    iget-object p2, p0, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->xsi:Ljava/lang/String;

    const-string v2, "type"

    invoke-interface {p1, p2, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    const/4 v2, 0x0

    const/4 v4, 0x1

    if-eqz p2, :cond_7

    const/16 p4, 0x3a

    .line 414
    invoke-virtual {p2, p4}, Ljava/lang/String;->indexOf(I)I

    move-result p4

    add-int/lit8 p5, p4, 0x1

    .line 415
    invoke-virtual {p2, p5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p5

    const/4 v5, -0x1

    if-ne p4, v5, :cond_6

    const-string p4, ""

    goto :goto_0

    .line 416
    :cond_6
    invoke-virtual {p2, v2, p4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p4

    .line 417
    :goto_0
    invoke-interface {p1, p4}, Lorg/xmlpull/v1/XmlPullParser;->getNamespace(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p4

    goto :goto_1

    :cond_7
    if-nez p5, :cond_9

    if-nez p4, :cond_9

    .line 419
    iget-object p4, p0, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->enc:Ljava/lang/String;

    const-string p5, "arrayType"

    invoke-interface {p1, p4, p5}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p4

    if-eqz p4, :cond_8

    .line 420
    iget-object p4, p0, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->enc:Ljava/lang/String;

    const-string p5, "Array"

    goto :goto_1

    .line 423
    :cond_8
    iget-object p4, p6, Lorg/ksoap2/serialization/PropertyInfo;->type:Ljava/lang/Object;

    invoke-virtual {p0, p4, v1}, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->getInfo(Ljava/lang/Object;Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p4

    .line 424
    aget-object p5, p4, v2

    check-cast p5, Ljava/lang/String;

    .line 425
    aget-object p4, p4, v4

    check-cast p4, Ljava/lang/String;

    move-object v6, p5

    move-object p5, p4

    move-object p4, v6

    :cond_9
    :goto_1
    if-nez p2, :cond_a

    .line 430
    iput-boolean v4, p0, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->implicitTypes:Z

    .line 432
    :cond_a
    invoke-virtual {p0, p1, p4, p5, p6}, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->readInstance(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;Ljava/lang/String;Lorg/ksoap2/serialization/PropertyInfo;)Ljava/lang/Object;

    move-result-object p2

    if-nez p2, :cond_b

    .line 434
    invoke-virtual {p0, p1, p4, p5}, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->readUnknown(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p2

    :cond_b
    move-object p5, p2

    :goto_2
    if-eqz p3, :cond_c

    .line 439
    invoke-virtual {p0, p3, p5}, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->resolveReference(Ljava/lang/String;Ljava/lang/Object;)V

    .line 444
    :cond_c
    :goto_3
    invoke-interface {p1, v3, v1, v0}, Lorg/xmlpull/v1/XmlPullParser;->require(ILjava/lang/String;Ljava/lang/String;)V

    return-object p5
.end method

.method public readInstance(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;Ljava/lang/String;Lorg/ksoap2/serialization/PropertyInfo;)Ljava/lang/Object;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/xmlpull/v1/XmlPullParserException;
        }
    .end annotation

    .line 473
    iget-object v0, p0, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->qNameToClass:Ljava/util/Hashtable;

    new-instance v1, Lorg/ksoap2/serialization/SoapPrimitive;

    const/4 v2, 0x0

    invoke-direct {v1, p2, p3, v2}, Lorg/ksoap2/serialization/SoapPrimitive;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_0

    return-object v2

    .line 477
    :cond_0
    instance-of v1, v0, Lorg/ksoap2/serialization/Marshal;

    if-eqz v1, :cond_1

    .line 478
    check-cast v0, Lorg/ksoap2/serialization/Marshal;

    invoke-interface {v0, p1, p2, p3, p4}, Lorg/ksoap2/serialization/Marshal;->readInstance(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;Ljava/lang/String;Lorg/ksoap2/serialization/PropertyInfo;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    .line 479
    :cond_1
    instance-of v1, v0, Lorg/ksoap2/serialization/SoapObject;

    if-eqz v1, :cond_2

    .line 480
    check-cast v0, Lorg/ksoap2/serialization/SoapObject;

    invoke-virtual {v0}, Lorg/ksoap2/serialization/SoapObject;->newInstance()Lorg/ksoap2/serialization/SoapObject;

    move-result-object p2

    goto :goto_0

    .line 481
    :cond_2
    const-class v1, Lorg/ksoap2/serialization/SoapObject;

    if-ne v0, v1, :cond_3

    .line 482
    new-instance v0, Lorg/ksoap2/serialization/SoapObject;

    invoke-direct {v0, p2, p3}, Lorg/ksoap2/serialization/SoapObject;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object p2, v0

    goto :goto_0

    .line 485
    :cond_3
    :try_start_0
    check-cast v0, Ljava/lang/Class;

    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object p2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 490
    :goto_0
    instance-of p3, p2, Lorg/ksoap2/serialization/HasAttributes;

    if-eqz p3, :cond_4

    .line 491
    move-object p3, p2

    check-cast p3, Lorg/ksoap2/serialization/HasAttributes;

    .line 492
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeCount()I

    move-result v0

    const/4 v1, 0x0

    :goto_1
    if-ge v1, v0, :cond_4

    .line 495
    new-instance v2, Lorg/ksoap2/serialization/AttributeInfo;

    invoke-direct {v2}, Lorg/ksoap2/serialization/AttributeInfo;-><init>()V

    .line 496
    invoke-interface {p1, v1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeName(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/ksoap2/serialization/AttributeInfo;->setName(Ljava/lang/String;)V

    .line 497
    invoke-interface {p1, v1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/ksoap2/serialization/AttributeInfo;->setValue(Ljava/lang/Object;)V

    .line 498
    invoke-interface {p1, v1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeNamespace(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/ksoap2/serialization/AttributeInfo;->setNamespace(Ljava/lang/String;)V

    .line 499
    invoke-interface {p1, v1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeType(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/ksoap2/serialization/AttributeInfo;->setType(Ljava/lang/Object;)V

    .line 501
    invoke-interface {p3, v2}, Lorg/ksoap2/serialization/HasAttributes;->setAttribute(Lorg/ksoap2/serialization/AttributeInfo;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 507
    :cond_4
    instance-of p3, p2, Lorg/ksoap2/serialization/SoapObject;

    if-eqz p3, :cond_5

    .line 508
    move-object p3, p2

    check-cast p3, Lorg/ksoap2/serialization/SoapObject;

    invoke-virtual {p0, p1, p3}, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->readSerializable(Lorg/xmlpull/v1/XmlPullParser;Lorg/ksoap2/serialization/SoapObject;)V

    goto :goto_3

    .line 510
    :cond_5
    instance-of p3, p2, Lorg/ksoap2/serialization/KvmSerializable;

    if-eqz p3, :cond_8

    .line 512
    instance-of p3, p2, Lorg/ksoap2/serialization/HasInnerText;

    if-eqz p3, :cond_7

    .line 513
    move-object p3, p2

    check-cast p3, Lorg/ksoap2/serialization/HasInnerText;

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getText()Ljava/lang/String;

    move-result-object p4

    if-eqz p4, :cond_6

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getText()Ljava/lang/String;

    move-result-object p4

    goto :goto_2

    :cond_6
    const-string p4, ""

    :goto_2
    invoke-interface {p3, p4}, Lorg/ksoap2/serialization/HasInnerText;->setInnerText(Ljava/lang/Object;)V

    .line 515
    :cond_7
    move-object p3, p2

    check-cast p3, Lorg/ksoap2/serialization/KvmSerializable;

    invoke-virtual {p0, p1, p3}, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->readSerializable(Lorg/xmlpull/v1/XmlPullParser;Lorg/ksoap2/serialization/KvmSerializable;)V

    goto :goto_3

    .line 517
    :cond_8
    instance-of p3, p2, Ljava/util/Vector;

    if-eqz p3, :cond_9

    .line 518
    move-object p3, p2

    check-cast p3, Ljava/util/Vector;

    iget-object p4, p4, Lorg/ksoap2/serialization/PropertyInfo;->elementType:Lorg/ksoap2/serialization/PropertyInfo;

    invoke-virtual {p0, p1, p3, p4}, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->readVector(Lorg/xmlpull/v1/XmlPullParser;Ljava/util/Vector;Lorg/ksoap2/serialization/PropertyInfo;)V

    :goto_3
    return-object p2

    .line 521
    :cond_9
    new-instance p1, Ljava/lang/RuntimeException;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string p4, "no deserializer for "

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p2

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1

    :catch_0
    move-exception p1

    .line 487
    new-instance p2, Ljava/lang/RuntimeException;

    invoke-virtual {p1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method protected readSerializable(Lorg/xmlpull/v1/XmlPullParser;Lorg/ksoap2/serialization/KvmSerializable;)V
    .locals 16
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/xmlpull/v1/XmlPullParserException;
        }
    .end annotation

    move-object/from16 v7, p0

    move-object/from16 v8, p1

    move-object/from16 v9, p2

    const-string v10, ""

    .line 176
    :try_start_0
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->nextTag()I

    move-result v0
    :try_end_0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 178
    :catch_0
    instance-of v0, v9, Lorg/ksoap2/serialization/HasInnerText;

    if-eqz v0, :cond_1

    .line 179
    move-object v0, v9

    check-cast v0, Lorg/ksoap2/serialization/HasInnerText;

    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->getText()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->getText()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_0
    move-object v1, v10

    :goto_0
    invoke-interface {v0, v1}, Lorg/ksoap2/serialization/HasInnerText;->setInnerText(Ljava/lang/Object;)V

    .line 181
    :cond_1
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->nextTag()I

    move-result v0

    :goto_1
    const/4 v11, 0x3

    if-eq v0, v11, :cond_e

    .line 184
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v12

    .line 185
    iget-boolean v0, v7, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->implicitTypes:Z

    if-eqz v0, :cond_3

    instance-of v0, v9, Lorg/ksoap2/serialization/SoapObject;

    if-nez v0, :cond_2

    goto :goto_2

    .line 228
    :cond_2
    move-object v11, v9

    check-cast v11, Lorg/ksoap2/serialization/SoapObject;

    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v13

    invoke-interface/range {p2 .. p2}, Lorg/ksoap2/serialization/KvmSerializable;->getPropertyCount()I

    move-result v3

    .line 229
    invoke-virtual {v11}, Lorg/ksoap2/serialization/SoapObject;->getNamespace()Ljava/lang/String;

    move-result-object v4

    sget-object v6, Lorg/ksoap2/serialization/PropertyInfo;->OBJECT_TYPE:Lorg/ksoap2/serialization/PropertyInfo;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object v5, v12

    .line 228
    invoke-virtual/range {v0 .. v6}, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->read(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/Object;ILjava/lang/String;Ljava/lang/String;Lorg/ksoap2/serialization/PropertyInfo;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v11, v13, v0}, Lorg/ksoap2/serialization/SoapObject;->addProperty(Ljava/lang/String;Ljava/lang/Object;)Lorg/ksoap2/serialization/SoapObject;

    goto/16 :goto_7

    .line 186
    :cond_3
    :goto_2
    new-instance v13, Lorg/ksoap2/serialization/PropertyInfo;

    invoke-direct {v13}, Lorg/ksoap2/serialization/PropertyInfo;-><init>()V

    .line 187
    invoke-interface/range {p2 .. p2}, Lorg/ksoap2/serialization/KvmSerializable;->getPropertyCount()I

    move-result v14

    const/4 v0, 0x0

    const/4 v6, 0x0

    :goto_3
    if-ge v6, v14, :cond_7

    if-nez v0, :cond_7

    .line 191
    invoke-virtual {v13}, Lorg/ksoap2/serialization/PropertyInfo;->clear()V

    .line 192
    iget-object v1, v7, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->properties:Ljava/util/Hashtable;

    invoke-interface {v9, v6, v1, v13}, Lorg/ksoap2/serialization/KvmSerializable;->getPropertyInfo(ILjava/util/Hashtable;Lorg/ksoap2/serialization/PropertyInfo;)V

    .line 194
    iget-object v1, v13, Lorg/ksoap2/serialization/PropertyInfo;->name:Ljava/lang/String;

    invoke-virtual {v12, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    iget-object v1, v13, Lorg/ksoap2/serialization/PropertyInfo;->namespace:Ljava/lang/String;

    if-eqz v1, :cond_5

    :cond_4
    iget-object v1, v13, Lorg/ksoap2/serialization/PropertyInfo;->name:Ljava/lang/String;

    .line 195
    invoke-virtual {v12, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_6

    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->getNamespace()Ljava/lang/String;

    move-result-object v1

    iget-object v2, v13, Lorg/ksoap2/serialization/PropertyInfo;->namespace:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_6

    :cond_5
    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move v3, v6

    move v15, v6

    move-object v6, v13

    .line 197
    invoke-virtual/range {v0 .. v6}, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->read(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/Object;ILjava/lang/String;Ljava/lang/String;Lorg/ksoap2/serialization/PropertyInfo;)Ljava/lang/Object;

    move-result-object v0

    invoke-interface {v9, v15, v0}, Lorg/ksoap2/serialization/KvmSerializable;->setProperty(ILjava/lang/Object;)V

    const/4 v0, 0x1

    goto :goto_4

    :cond_6
    move v15, v6

    :goto_4
    add-int/lit8 v6, v15, 0x1

    goto :goto_3

    :cond_7
    if-nez v0, :cond_a

    .line 202
    iget-boolean v0, v7, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->avoidExceptionForUnknownProperty:Z

    if-eqz v0, :cond_9

    .line 204
    :cond_8
    :goto_5
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v0

    if-ne v0, v11, :cond_8

    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v12, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_b

    goto :goto_5

    .line 208
    :cond_9
    new-instance v0, Ljava/lang/RuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown Property: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 211
    :cond_a
    instance-of v0, v9, Lorg/ksoap2/serialization/HasAttributes;

    if-eqz v0, :cond_b

    .line 212
    move-object v0, v9

    check-cast v0, Lorg/ksoap2/serialization/HasAttributes;

    .line 213
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeCount()I

    move-result v1

    const/4 v15, 0x0

    :goto_6
    if-ge v15, v1, :cond_b

    .line 215
    new-instance v2, Lorg/ksoap2/serialization/AttributeInfo;

    invoke-direct {v2}, Lorg/ksoap2/serialization/AttributeInfo;-><init>()V

    .line 216
    invoke-interface {v8, v15}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeName(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/ksoap2/serialization/AttributeInfo;->setName(Ljava/lang/String;)V

    .line 217
    invoke-interface {v8, v15}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/ksoap2/serialization/AttributeInfo;->setValue(Ljava/lang/Object;)V

    .line 218
    invoke-interface {v8, v15}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeNamespace(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/ksoap2/serialization/AttributeInfo;->setNamespace(Ljava/lang/String;)V

    .line 219
    invoke-interface {v8, v15}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeType(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/ksoap2/serialization/AttributeInfo;->setType(Ljava/lang/Object;)V

    .line 220
    invoke-interface {v0, v2}, Lorg/ksoap2/serialization/HasAttributes;->setAttribute(Lorg/ksoap2/serialization/AttributeInfo;)V

    add-int/lit8 v15, v15, 0x1

    goto :goto_6

    .line 232
    :cond_b
    :goto_7
    :try_start_1
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->nextTag()I

    move-result v0
    :try_end_1
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_1 .. :try_end_1} :catch_1

    goto/16 :goto_1

    .line 234
    :catch_1
    instance-of v0, v9, Lorg/ksoap2/serialization/HasInnerText;

    if-eqz v0, :cond_d

    .line 235
    move-object v0, v9

    check-cast v0, Lorg/ksoap2/serialization/HasInnerText;

    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->getText()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_c

    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->getText()Ljava/lang/String;

    move-result-object v1

    goto :goto_8

    :cond_c
    move-object v1, v10

    :goto_8
    invoke-interface {v0, v1}, Lorg/ksoap2/serialization/HasInnerText;->setInnerText(Ljava/lang/Object;)V

    .line 237
    :cond_d
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->nextTag()I

    move-result v0

    goto/16 :goto_1

    :cond_e
    const/4 v0, 0x0

    .line 241
    invoke-interface {v8, v11, v0, v0}, Lorg/xmlpull/v1/XmlPullParser;->require(ILjava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method protected readSerializable(Lorg/xmlpull/v1/XmlPullParser;Lorg/ksoap2/serialization/SoapObject;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/xmlpull/v1/XmlPullParserException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 161
    :goto_0
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeCount()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 162
    invoke-interface {p1, v0}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeName(I)Ljava/lang/String;

    move-result-object v1

    .line 163
    invoke-interface {p1, v0}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(I)Ljava/lang/String;

    move-result-object v2

    .line 164
    invoke-virtual {p2, v1, v2}, Lorg/ksoap2/serialization/SoapObject;->addAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 166
    :cond_0
    invoke-virtual {p0, p1, p2}, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->readSerializable(Lorg/xmlpull/v1/XmlPullParser;Lorg/ksoap2/serialization/KvmSerializable;)V

    return-void
.end method

.method protected readUnknown(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;
    .locals 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/xmlpull/v1/XmlPullParserException;
        }
    .end annotation

    move-object v7, p1

    move-object/from16 v0, p2

    move-object/from16 v1, p3

    .line 258
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v8

    .line 259
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getNamespace()Ljava/lang/String;

    move-result-object v9

    .line 262
    new-instance v2, Ljava/util/Vector;

    invoke-direct {v2}, Ljava/util/Vector;-><init>()V

    const/4 v3, 0x0

    move v4, v3

    .line 263
    :goto_0
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeCount()I

    move-result v5

    if-ge v4, v5, :cond_0

    .line 264
    new-instance v5, Lorg/ksoap2/serialization/AttributeInfo;

    invoke-direct {v5}, Lorg/ksoap2/serialization/AttributeInfo;-><init>()V

    .line 265
    invoke-interface {p1, v4}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeName(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Lorg/ksoap2/serialization/AttributeInfo;->setName(Ljava/lang/String;)V

    .line 266
    invoke-interface {p1, v4}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Lorg/ksoap2/serialization/AttributeInfo;->setValue(Ljava/lang/Object;)V

    .line 267
    invoke-interface {p1, v4}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeNamespace(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Lorg/ksoap2/serialization/AttributeInfo;->setNamespace(Ljava/lang/String;)V

    .line 268
    invoke-interface {p1, v4}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeType(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Lorg/ksoap2/serialization/AttributeInfo;->setType(Ljava/lang/Object;)V

    .line 269
    invoke-virtual {v2, v5}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 272
    :cond_0
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 275
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v4

    const/4 v5, 0x4

    const/4 v6, 0x0

    const/4 v10, 0x3

    if-ne v4, v5, :cond_2

    .line 276
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getText()Ljava/lang/String;

    move-result-object v6

    .line 277
    new-instance v4, Lorg/ksoap2/serialization/SoapPrimitive;

    invoke-direct {v4, v0, v1, v6}, Lorg/ksoap2/serialization/SoapPrimitive;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    move v5, v3

    .line 280
    :goto_1
    invoke-virtual {v2}, Ljava/util/Vector;->size()I

    move-result v11

    if-ge v5, v11, :cond_1

    .line 281
    invoke-virtual {v2, v5}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lorg/ksoap2/serialization/AttributeInfo;

    invoke-virtual {v4, v11}, Lorg/ksoap2/serialization/SoapPrimitive;->addAttribute(Lorg/ksoap2/serialization/AttributeInfo;)V

    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 283
    :cond_1
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    goto :goto_3

    .line 284
    :cond_2
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v4

    if-ne v4, v10, :cond_3

    .line 285
    new-instance v4, Lorg/ksoap2/serialization/SoapObject;

    invoke-direct {v4, v0, v1}, Lorg/ksoap2/serialization/SoapObject;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move v5, v3

    .line 287
    :goto_2
    invoke-virtual {v2}, Ljava/util/Vector;->size()I

    move-result v11

    if-ge v5, v11, :cond_4

    .line 288
    invoke-virtual {v2, v5}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lorg/ksoap2/serialization/AttributeInfo;

    invoke-virtual {v4, v11}, Lorg/ksoap2/serialization/SoapObject;->addAttribute(Lorg/ksoap2/serialization/AttributeInfo;)V

    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    :cond_3
    move-object v4, v6

    .line 293
    :cond_4
    :goto_3
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v5

    const/4 v11, 0x2

    if-ne v5, v11, :cond_9

    if-eqz v6, :cond_6

    .line 294
    invoke-virtual {v6}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    if-nez v4, :cond_5

    goto :goto_4

    .line 295
    :cond_5
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Malformed input: Mixed content"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 297
    :cond_6
    :goto_4
    new-instance v11, Lorg/ksoap2/serialization/SoapObject;

    invoke-direct {v11, v0, v1}, Lorg/ksoap2/serialization/SoapObject;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 299
    :goto_5
    invoke-virtual {v2}, Ljava/util/Vector;->size()I

    move-result v0

    if-ge v3, v0, :cond_7

    .line 300
    invoke-virtual {v2, v3}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/ksoap2/serialization/AttributeInfo;

    invoke-virtual {v11, v0}, Lorg/ksoap2/serialization/SoapObject;->addAttribute(Lorg/ksoap2/serialization/AttributeInfo;)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_5

    .line 303
    :cond_7
    :goto_6
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v0

    if-eq v0, v10, :cond_8

    .line 304
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getNamespace()Ljava/lang/String;

    move-result-object v12

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v11}, Lorg/ksoap2/serialization/SoapObject;->getPropertyCount()I

    move-result v3

    const/4 v4, 0x0

    const/4 v5, 0x0

    sget-object v6, Lorg/ksoap2/serialization/PropertyInfo;->OBJECT_TYPE:Lorg/ksoap2/serialization/PropertyInfo;

    move-object v0, p0

    move-object v1, p1

    move-object v2, v11

    invoke-virtual/range {v0 .. v6}, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->read(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/Object;ILjava/lang/String;Ljava/lang/String;Lorg/ksoap2/serialization/PropertyInfo;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v11, v12, v13, v0}, Lorg/ksoap2/serialization/SoapObject;->addProperty(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)Lorg/ksoap2/serialization/SoapObject;

    .line 306
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextTag()I

    goto :goto_6

    :cond_8
    move-object v4, v11

    .line 310
    :cond_9
    invoke-interface {p1, v10, v9, v8}, Lorg/xmlpull/v1/XmlPullParser;->require(ILjava/lang/String;Ljava/lang/String;)V

    return-object v4
.end method

.method protected readVector(Lorg/xmlpull/v1/XmlPullParser;Ljava/util/Vector;Lorg/ksoap2/serialization/PropertyInfo;)V
    .locals 17
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/xmlpull/v1/XmlPullParserException;
        }
    .end annotation

    move-object/from16 v7, p0

    move-object/from16 v8, p1

    move-object/from16 v9, p2

    .line 330
    invoke-virtual/range {p2 .. p2}, Ljava/util/Vector;->size()I

    move-result v0

    .line 332
    iget-object v1, v7, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->enc:Ljava/lang/String;

    const-string v2, "arrayType"

    invoke-interface {v8, v1, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    const/4 v10, 0x0

    const/4 v11, 0x0

    if-eqz v1, :cond_2

    const/16 v0, 0x3a

    .line 334
    invoke-virtual {v1, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    const-string v3, "["

    .line 335
    invoke-virtual {v1, v3, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v3

    add-int/lit8 v4, v0, 0x1

    .line 336
    invoke-virtual {v1, v4, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    const/4 v5, -0x1

    if-ne v0, v5, :cond_0

    const-string v0, ""

    goto :goto_0

    .line 337
    :cond_0
    invoke-virtual {v1, v11, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 338
    :goto_0
    invoke-interface {v8, v0}, Lorg/xmlpull/v1/XmlPullParser;->getNamespace(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 339
    invoke-direct {v7, v1, v3, v5}, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->getIndex(Ljava/lang/String;II)I

    move-result v1

    if-eq v1, v5, :cond_1

    .line 341
    invoke-virtual {v9, v1}, Ljava/util/Vector;->setSize(I)V

    move-object v12, v0

    move v0, v1

    move-object v14, v4

    move v13, v11

    goto :goto_1

    :cond_1
    move-object v12, v0

    move v0, v1

    move v13, v2

    move-object v14, v4

    goto :goto_1

    :cond_2
    move v13, v2

    move-object v12, v10

    move-object v14, v12

    :goto_1
    if-nez p3, :cond_3

    .line 346
    sget-object v1, Lorg/ksoap2/serialization/PropertyInfo;->OBJECT_TYPE:Lorg/ksoap2/serialization/PropertyInfo;

    move-object v15, v1

    goto :goto_2

    :cond_3
    move-object/from16 v15, p3

    .line 348
    :goto_2
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->nextTag()I

    .line 349
    iget-object v1, v7, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->enc:Ljava/lang/String;

    const-string v2, "offset"

    invoke-interface {v8, v1, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v7, v1, v11, v11}, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->getIndex(Ljava/lang/String;II)I

    move-result v1

    .line 350
    :goto_3
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v2

    const/4 v3, 0x3

    if-eq v2, v3, :cond_5

    .line 352
    iget-object v2, v7, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->enc:Ljava/lang/String;

    const-string v3, "position"

    invoke-interface {v8, v2, v3}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v7, v2, v11, v1}, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->getIndex(Ljava/lang/String;II)I

    move-result v6

    if-eqz v13, :cond_4

    if-lt v6, v0, :cond_4

    add-int/lit8 v0, v6, 0x1

    .line 355
    invoke-virtual {v9, v0}, Ljava/util/Vector;->setSize(I)V

    :cond_4
    move/from16 v16, v0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move v3, v6

    move-object v4, v12

    move-object v5, v14

    move v11, v6

    move-object v6, v15

    .line 358
    invoke-virtual/range {v0 .. v6}, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->read(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/Object;ILjava/lang/String;Ljava/lang/String;Lorg/ksoap2/serialization/PropertyInfo;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v9, v0, v11}, Ljava/util/Vector;->setElementAt(Ljava/lang/Object;I)V

    add-int/lit8 v1, v11, 0x1

    .line 360
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->nextTag()I

    move/from16 v0, v16

    const/4 v11, 0x0

    goto :goto_3

    .line 362
    :cond_5
    invoke-interface {v8, v3, v10, v10}, Lorg/xmlpull/v1/XmlPullParser;->require(ILjava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method protected resolveReference(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 3

    .line 449
    iget-object v0, p0, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->idMap:Ljava/util/Hashtable;

    invoke-virtual {v0, p1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 450
    instance-of v1, v0, Lorg/ksoap2/serialization/FwdRef;

    if-eqz v1, :cond_2

    .line 451
    check-cast v0, Lorg/ksoap2/serialization/FwdRef;

    .line 453
    :cond_0
    iget-object v1, v0, Lorg/ksoap2/serialization/FwdRef;->obj:Ljava/lang/Object;

    instance-of v1, v1, Lorg/ksoap2/serialization/KvmSerializable;

    if-eqz v1, :cond_1

    .line 454
    iget-object v1, v0, Lorg/ksoap2/serialization/FwdRef;->obj:Ljava/lang/Object;

    check-cast v1, Lorg/ksoap2/serialization/KvmSerializable;

    iget v2, v0, Lorg/ksoap2/serialization/FwdRef;->index:I

    invoke-interface {v1, v2, p2}, Lorg/ksoap2/serialization/KvmSerializable;->setProperty(ILjava/lang/Object;)V

    goto :goto_0

    .line 456
    :cond_1
    iget-object v1, v0, Lorg/ksoap2/serialization/FwdRef;->obj:Ljava/lang/Object;

    check-cast v1, Ljava/util/Vector;

    iget v2, v0, Lorg/ksoap2/serialization/FwdRef;->index:I

    invoke-virtual {v1, p2, v2}, Ljava/util/Vector;->setElementAt(Ljava/lang/Object;I)V

    .line 458
    :goto_0
    iget-object v0, v0, Lorg/ksoap2/serialization/FwdRef;->next:Lorg/ksoap2/serialization/FwdRef;

    if-nez v0, :cond_0

    goto :goto_1

    :cond_2
    if-nez v0, :cond_3

    .line 464
    :goto_1
    iget-object v0, p0, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->idMap:Ljava/util/Hashtable;

    invoke-virtual {v0, p1, p2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    .line 462
    :cond_3
    new-instance p1, Ljava/lang/RuntimeException;

    const-string p2, "double ID"

    invoke-direct {p1, p2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setAddAdornments(Z)V
    .locals 0

    .line 113
    iput-boolean p1, p0, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->addAdornments:Z

    return-void
.end method

.method public setBodyOutEmpty(Z)V
    .locals 0

    if-eqz p1, :cond_0

    const/4 p1, 0x0

    .line 125
    iput-object p1, p0, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->bodyOut:Ljava/lang/Object;

    :cond_0
    return-void
.end method

.method protected writeArrayListBody(Lorg/xmlpull/v1/XmlSerializer;Ljava/util/ArrayList;)V
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 790
    move-object v0, p2

    check-cast v0, Lorg/ksoap2/serialization/KvmSerializable;

    .line 791
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result p2

    .line 792
    new-instance v1, Lorg/ksoap2/serialization/PropertyInfo;

    invoke-direct {v1}, Lorg/ksoap2/serialization/PropertyInfo;-><init>()V

    const/4 v2, 0x0

    move v3, v2

    :goto_0
    if-ge v3, p2, :cond_6

    .line 798
    invoke-interface {v0, v3}, Lorg/ksoap2/serialization/KvmSerializable;->getProperty(I)Ljava/lang/Object;

    move-result-object v4

    .line 800
    iget-object v5, p0, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->properties:Ljava/util/Hashtable;

    invoke-interface {v0, v3, v5, v1}, Lorg/ksoap2/serialization/KvmSerializable;->getPropertyInfo(ILjava/util/Hashtable;Lorg/ksoap2/serialization/PropertyInfo;)V

    .line 802
    instance-of v5, v4, Lorg/ksoap2/serialization/SoapObject;

    const/4 v6, 0x1

    if-nez v5, :cond_1

    .line 804
    iget v5, v1, Lorg/ksoap2/serialization/PropertyInfo;->flags:I

    and-int/2addr v5, v6

    if-nez v5, :cond_5

    .line 805
    invoke-interface {v0, v3}, Lorg/ksoap2/serialization/KvmSerializable;->getProperty(I)Ljava/lang/Object;

    move-result-object v5

    if-nez v4, :cond_0

    .line 806
    iget-boolean v4, p0, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->skipNullProperties:Z

    if-nez v4, :cond_5

    :cond_0
    sget-object v4, Lorg/ksoap2/serialization/SoapPrimitive;->NullSkip:Ljava/lang/Object;

    if-eq v5, v4, :cond_5

    .line 807
    iget-object v4, v1, Lorg/ksoap2/serialization/PropertyInfo;->namespace:Ljava/lang/String;

    iget-object v6, v1, Lorg/ksoap2/serialization/PropertyInfo;->name:Ljava/lang/String;

    invoke-interface {p1, v4, v6}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 808
    invoke-virtual {p0, p1, v5, v1}, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->writeProperty(Lorg/xmlpull/v1/XmlSerializer;Ljava/lang/Object;Lorg/ksoap2/serialization/PropertyInfo;)V

    .line 809
    iget-object v4, v1, Lorg/ksoap2/serialization/PropertyInfo;->namespace:Ljava/lang/String;

    iget-object v5, v1, Lorg/ksoap2/serialization/PropertyInfo;->name:Ljava/lang/String;

    invoke-interface {p1, v4, v5}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    goto :goto_3

    .line 815
    :cond_1
    check-cast v4, Lorg/ksoap2/serialization/SoapObject;

    const/4 v5, 0x0

    .line 817
    invoke-virtual {p0, v5, v4}, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->getInfo(Ljava/lang/Object;Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v5

    .line 818
    aget-object v7, v5, v2

    check-cast v7, Ljava/lang/String;

    .line 819
    aget-object v7, v5, v6

    check-cast v7, Ljava/lang/String;

    .line 822
    iget-object v8, v1, Lorg/ksoap2/serialization/PropertyInfo;->name:Ljava/lang/String;

    if-eqz v8, :cond_2

    iget-object v8, v1, Lorg/ksoap2/serialization/PropertyInfo;->name:Ljava/lang/String;

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v8

    if-lez v8, :cond_2

    .line 823
    iget-object v8, v1, Lorg/ksoap2/serialization/PropertyInfo;->name:Ljava/lang/String;

    goto :goto_1

    .line 825
    :cond_2
    aget-object v8, v5, v6

    check-cast v8, Ljava/lang/String;

    .line 829
    :goto_1
    iget-object v9, v1, Lorg/ksoap2/serialization/PropertyInfo;->namespace:Ljava/lang/String;

    if-eqz v9, :cond_3

    iget-object v9, v1, Lorg/ksoap2/serialization/PropertyInfo;->namespace:Ljava/lang/String;

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v9

    if-lez v9, :cond_3

    .line 830
    iget-object v5, v1, Lorg/ksoap2/serialization/PropertyInfo;->namespace:Ljava/lang/String;

    goto :goto_2

    .line 832
    :cond_3
    aget-object v5, v5, v2

    check-cast v5, Ljava/lang/String;

    .line 835
    :goto_2
    invoke-interface {p1, v5, v8}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 836
    iget-boolean v9, p0, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->implicitTypes:Z

    if-nez v9, :cond_4

    .line 837
    invoke-interface {p1, v5, v6}, Lorg/xmlpull/v1/XmlSerializer;->getPrefix(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v6

    .line 838
    iget-object v9, p0, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->xsi:Ljava/lang/String;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, ":"

    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    const-string v7, "type"

    invoke-interface {p1, v9, v7, v6}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 840
    :cond_4
    invoke-virtual {p0, p1, v4}, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->writeObjectBodyWithAttributes(Lorg/xmlpull/v1/XmlSerializer;Lorg/ksoap2/serialization/KvmSerializable;)V

    .line 841
    invoke-interface {p1, v5, v8}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    :cond_5
    :goto_3
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_0

    .line 844
    :cond_6
    invoke-direct {p0, p1, v0}, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->writeInnerText(Lorg/xmlpull/v1/XmlSerializer;Lorg/ksoap2/serialization/KvmSerializable;)V

    return-void
.end method

.method public writeArrayListBodyWithAttributes(Lorg/xmlpull/v1/XmlSerializer;Lorg/ksoap2/serialization/KvmSerializable;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 654
    instance-of v0, p2, Lorg/ksoap2/serialization/HasAttributes;

    if-eqz v0, :cond_0

    .line 655
    move-object v0, p2

    check-cast v0, Lorg/ksoap2/serialization/HasAttributes;

    invoke-direct {p0, p1, v0}, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->writeAttributes(Lorg/xmlpull/v1/XmlSerializer;Lorg/ksoap2/serialization/HasAttributes;)V

    .line 657
    :cond_0
    check-cast p2, Ljava/util/ArrayList;

    invoke-virtual {p0, p1, p2}, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->writeArrayListBody(Lorg/xmlpull/v1/XmlSerializer;Ljava/util/ArrayList;)V

    return-void
.end method

.method public writeBody(Lorg/xmlpull/v1/XmlSerializer;)V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 619
    iget-object v0, p0, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->bodyOut:Ljava/lang/Object;

    if-eqz v0, :cond_5

    .line 620
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->multiRef:Ljava/util/Vector;

    .line 621
    iget-object v1, p0, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->bodyOut:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 622
    iget-object v0, p0, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->bodyOut:Ljava/lang/Object;

    const/4 v1, 0x0

    invoke-virtual {p0, v1, v0}, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->getInfo(Ljava/lang/Object;Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    .line 624
    iget-boolean v2, p0, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->dotNet:Z

    const-string v3, ""

    const/4 v4, 0x0

    if-eqz v2, :cond_0

    move-object v2, v3

    goto :goto_0

    :cond_0
    aget-object v2, v0, v4

    check-cast v2, Ljava/lang/String;

    :goto_0
    const/4 v5, 0x1

    aget-object v6, v0, v5

    check-cast v6, Ljava/lang/String;

    invoke-interface {p1, v2, v6}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 626
    iget-boolean v2, p0, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->dotNet:Z

    if-eqz v2, :cond_1

    .line 627
    aget-object v2, v0, v4

    check-cast v2, Ljava/lang/String;

    const-string v6, "xmlns"

    invoke-interface {p1, v1, v6, v2}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 630
    :cond_1
    iget-boolean v2, p0, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->addAdornments:Z

    if-eqz v2, :cond_3

    const/4 v2, 0x2

    .line 631
    aget-object v6, v0, v2

    if-nez v6, :cond_2

    const-string v2, "o0"

    goto :goto_1

    :cond_2
    aget-object v2, v0, v2

    check-cast v2, Ljava/lang/String;

    :goto_1
    const-string v6, "id"

    invoke-interface {p1, v1, v6, v2}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 632
    iget-object v2, p0, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->enc:Ljava/lang/String;

    const-string v6, "root"

    const-string v7, "1"

    invoke-interface {p1, v2, v6, v7}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 634
    :cond_3
    iget-object v2, p0, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->bodyOut:Ljava/lang/Object;

    const/4 v6, 0x3

    aget-object v6, v0, v6

    invoke-virtual {p0, p1, v2, v1, v6}, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->writeElement(Lorg/xmlpull/v1/XmlSerializer;Ljava/lang/Object;Lorg/ksoap2/serialization/PropertyInfo;Ljava/lang/Object;)V

    .line 635
    iget-boolean v1, p0, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->dotNet:Z

    if-eqz v1, :cond_4

    goto :goto_2

    :cond_4
    aget-object v1, v0, v4

    move-object v3, v1

    check-cast v3, Ljava/lang/String;

    :goto_2
    aget-object v0, v0, v5

    check-cast v0, Ljava/lang/String;

    invoke-interface {p1, v3, v0}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    :cond_5
    return-void
.end method

.method protected writeElement(Lorg/xmlpull/v1/XmlSerializer;Ljava/lang/Object;Lorg/ksoap2/serialization/PropertyInfo;Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    if-eqz p4, :cond_0

    .line 771
    check-cast p4, Lorg/ksoap2/serialization/Marshal;

    invoke-interface {p4, p1, p2}, Lorg/ksoap2/serialization/Marshal;->writeInstance(Lorg/xmlpull/v1/XmlSerializer;Ljava/lang/Object;)V

    goto :goto_1

    .line 772
    :cond_0
    instance-of p4, p2, Lorg/ksoap2/serialization/KvmSerializable;

    if-nez p4, :cond_4

    sget-object p4, Lorg/ksoap2/serialization/SoapPrimitive;->NullNilElement:Ljava/lang/Object;

    if-eq p2, p4, :cond_4

    sget-object p4, Lorg/ksoap2/serialization/SoapPrimitive;->NullSkip:Ljava/lang/Object;

    if-ne p2, p4, :cond_1

    goto :goto_0

    .line 779
    :cond_1
    instance-of p4, p2, Lorg/ksoap2/serialization/HasAttributes;

    if-eqz p4, :cond_2

    .line 780
    check-cast p2, Lorg/ksoap2/serialization/HasAttributes;

    invoke-direct {p0, p1, p2}, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->writeAttributes(Lorg/xmlpull/v1/XmlSerializer;Lorg/ksoap2/serialization/HasAttributes;)V

    goto :goto_1

    .line 781
    :cond_2
    instance-of p4, p2, Ljava/util/Vector;

    if-eqz p4, :cond_3

    .line 782
    check-cast p2, Ljava/util/Vector;

    iget-object p3, p3, Lorg/ksoap2/serialization/PropertyInfo;->elementType:Lorg/ksoap2/serialization/PropertyInfo;

    invoke-virtual {p0, p1, p2, p3}, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->writeVectorBody(Lorg/xmlpull/v1/XmlSerializer;Ljava/util/Vector;Lorg/ksoap2/serialization/PropertyInfo;)V

    goto :goto_1

    .line 784
    :cond_3
    new-instance p1, Ljava/lang/RuntimeException;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string p4, "Cannot serialize: "

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 774
    :cond_4
    :goto_0
    instance-of p3, p2, Ljava/util/ArrayList;

    if-eqz p3, :cond_5

    .line 775
    check-cast p2, Lorg/ksoap2/serialization/KvmSerializable;

    invoke-virtual {p0, p1, p2}, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->writeArrayListBodyWithAttributes(Lorg/xmlpull/v1/XmlSerializer;Lorg/ksoap2/serialization/KvmSerializable;)V

    goto :goto_1

    .line 777
    :cond_5
    check-cast p2, Lorg/ksoap2/serialization/KvmSerializable;

    invoke-virtual {p0, p1, p2}, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->writeObjectBodyWithAttributes(Lorg/xmlpull/v1/XmlSerializer;Lorg/ksoap2/serialization/KvmSerializable;)V

    :goto_1
    return-void
.end method

.method public writeObjectBody(Lorg/xmlpull/v1/XmlSerializer;Lorg/ksoap2/serialization/KvmSerializable;)V
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 671
    invoke-interface {p2}, Lorg/ksoap2/serialization/KvmSerializable;->getPropertyCount()I

    move-result v0

    .line 672
    new-instance v1, Lorg/ksoap2/serialization/PropertyInfo;

    invoke-direct {v1}, Lorg/ksoap2/serialization/PropertyInfo;-><init>()V

    const/4 v2, 0x0

    move v3, v2

    :goto_0
    if-ge v3, v0, :cond_6

    .line 678
    invoke-interface {p2, v3}, Lorg/ksoap2/serialization/KvmSerializable;->getProperty(I)Ljava/lang/Object;

    move-result-object v4

    .line 680
    iget-object v5, p0, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->properties:Ljava/util/Hashtable;

    invoke-interface {p2, v3, v5, v1}, Lorg/ksoap2/serialization/KvmSerializable;->getPropertyInfo(ILjava/util/Hashtable;Lorg/ksoap2/serialization/PropertyInfo;)V

    .line 682
    instance-of v5, v4, Lorg/ksoap2/serialization/SoapObject;

    const/4 v6, 0x1

    if-nez v5, :cond_1

    .line 684
    iget v5, v1, Lorg/ksoap2/serialization/PropertyInfo;->flags:I

    and-int/2addr v5, v6

    if-nez v5, :cond_5

    .line 685
    invoke-interface {p2, v3}, Lorg/ksoap2/serialization/KvmSerializable;->getProperty(I)Ljava/lang/Object;

    move-result-object v5

    if-nez v4, :cond_0

    .line 686
    iget-boolean v4, p0, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->skipNullProperties:Z

    if-nez v4, :cond_5

    :cond_0
    sget-object v4, Lorg/ksoap2/serialization/SoapPrimitive;->NullSkip:Ljava/lang/Object;

    if-eq v5, v4, :cond_5

    .line 687
    iget-object v4, v1, Lorg/ksoap2/serialization/PropertyInfo;->namespace:Ljava/lang/String;

    iget-object v6, v1, Lorg/ksoap2/serialization/PropertyInfo;->name:Ljava/lang/String;

    invoke-interface {p1, v4, v6}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 688
    invoke-virtual {p0, p1, v5, v1}, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->writeProperty(Lorg/xmlpull/v1/XmlSerializer;Ljava/lang/Object;Lorg/ksoap2/serialization/PropertyInfo;)V

    .line 689
    iget-object v4, v1, Lorg/ksoap2/serialization/PropertyInfo;->namespace:Ljava/lang/String;

    iget-object v5, v1, Lorg/ksoap2/serialization/PropertyInfo;->name:Ljava/lang/String;

    invoke-interface {p1, v4, v5}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    goto :goto_3

    .line 695
    :cond_1
    check-cast v4, Lorg/ksoap2/serialization/SoapObject;

    const/4 v5, 0x0

    .line 697
    invoke-virtual {p0, v5, v4}, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->getInfo(Ljava/lang/Object;Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v5

    .line 698
    aget-object v7, v5, v2

    check-cast v7, Ljava/lang/String;

    .line 699
    aget-object v7, v5, v6

    check-cast v7, Ljava/lang/String;

    .line 702
    iget-object v8, v1, Lorg/ksoap2/serialization/PropertyInfo;->name:Ljava/lang/String;

    if-eqz v8, :cond_2

    iget-object v8, v1, Lorg/ksoap2/serialization/PropertyInfo;->name:Ljava/lang/String;

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v8

    if-lez v8, :cond_2

    .line 703
    iget-object v8, v1, Lorg/ksoap2/serialization/PropertyInfo;->name:Ljava/lang/String;

    goto :goto_1

    .line 705
    :cond_2
    aget-object v8, v5, v6

    check-cast v8, Ljava/lang/String;

    .line 709
    :goto_1
    iget-object v9, v1, Lorg/ksoap2/serialization/PropertyInfo;->namespace:Ljava/lang/String;

    if-eqz v9, :cond_3

    iget-object v9, v1, Lorg/ksoap2/serialization/PropertyInfo;->namespace:Ljava/lang/String;

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v9

    if-lez v9, :cond_3

    .line 710
    iget-object v5, v1, Lorg/ksoap2/serialization/PropertyInfo;->namespace:Ljava/lang/String;

    goto :goto_2

    .line 712
    :cond_3
    aget-object v5, v5, v2

    check-cast v5, Ljava/lang/String;

    .line 715
    :goto_2
    invoke-interface {p1, v5, v8}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 716
    iget-boolean v9, p0, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->implicitTypes:Z

    if-nez v9, :cond_4

    .line 717
    invoke-interface {p1, v5, v6}, Lorg/xmlpull/v1/XmlSerializer;->getPrefix(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v6

    .line 718
    iget-object v9, p0, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->xsi:Ljava/lang/String;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, ":"

    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    const-string v7, "type"

    invoke-interface {p1, v9, v7, v6}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 720
    :cond_4
    invoke-virtual {p0, p1, v4}, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->writeObjectBodyWithAttributes(Lorg/xmlpull/v1/XmlSerializer;Lorg/ksoap2/serialization/KvmSerializable;)V

    .line 721
    invoke-interface {p1, v5, v8}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    :cond_5
    :goto_3
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_0

    .line 724
    :cond_6
    invoke-direct {p0, p1, p2}, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->writeInnerText(Lorg/xmlpull/v1/XmlSerializer;Lorg/ksoap2/serialization/KvmSerializable;)V

    return-void
.end method

.method public writeObjectBodyWithAttributes(Lorg/xmlpull/v1/XmlSerializer;Lorg/ksoap2/serialization/KvmSerializable;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 661
    instance-of v0, p2, Lorg/ksoap2/serialization/HasAttributes;

    if-eqz v0, :cond_0

    .line 662
    move-object v0, p2

    check-cast v0, Lorg/ksoap2/serialization/HasAttributes;

    invoke-direct {p0, p1, v0}, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->writeAttributes(Lorg/xmlpull/v1/XmlSerializer;Lorg/ksoap2/serialization/HasAttributes;)V

    .line 664
    :cond_0
    invoke-virtual {p0, p1, p2}, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->writeObjectBody(Lorg/xmlpull/v1/XmlSerializer;Lorg/ksoap2/serialization/KvmSerializable;)V

    return-void
.end method

.method protected writeProperty(Lorg/xmlpull/v1/XmlSerializer;Ljava/lang/Object;Lorg/ksoap2/serialization/PropertyInfo;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    if-eqz p2, :cond_7

    .line 747
    sget-object v0, Lorg/ksoap2/serialization/SoapPrimitive;->NullNilElement:Ljava/lang/Object;

    if-ne p2, v0, :cond_0

    goto/16 :goto_3

    :cond_0
    const/4 v0, 0x0

    .line 751
    invoke-virtual {p0, v0, p2}, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->getInfo(Ljava/lang/Object;Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    .line 752
    iget-boolean v2, p3, Lorg/ksoap2/serialization/PropertyInfo;->multiRef:Z

    const/4 v3, 0x2

    if-nez v2, :cond_4

    aget-object v2, v1, v3

    if-eqz v2, :cond_1

    goto :goto_0

    .line 760
    :cond_1
    iget-boolean v0, p0, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->implicitTypes:Z

    if-eqz v0, :cond_2

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    iget-object v2, p3, Lorg/ksoap2/serialization/PropertyInfo;->type:Ljava/lang/Object;

    if-eq v0, v2, :cond_3

    :cond_2
    const/4 v0, 0x0

    .line 761
    aget-object v0, v1, v0

    check-cast v0, Ljava/lang/String;

    const/4 v2, 0x1

    invoke-interface {p1, v0, v2}, Lorg/xmlpull/v1/XmlSerializer;->getPrefix(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    .line 762
    iget-object v3, p0, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->xsi:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ":"

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget-object v0, v1, v2

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v2, "type"

    invoke-interface {p1, v3, v2, v0}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    :cond_3
    const/4 v0, 0x3

    .line 764
    aget-object v0, v1, v0

    invoke-virtual {p0, p1, p2, p3, v0}, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->writeElement(Lorg/xmlpull/v1/XmlSerializer;Ljava/lang/Object;Lorg/ksoap2/serialization/PropertyInfo;Ljava/lang/Object;)V

    goto :goto_2

    .line 753
    :cond_4
    :goto_0
    iget-object p3, p0, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->multiRef:Ljava/util/Vector;

    invoke-virtual {p3, p2}, Ljava/util/Vector;->indexOf(Ljava/lang/Object;)I

    move-result p3

    const/4 v2, -0x1

    if-ne p3, v2, :cond_5

    .line 755
    iget-object p3, p0, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->multiRef:Ljava/util/Vector;

    invoke-virtual {p3}, Ljava/util/Vector;->size()I

    move-result p3

    .line 756
    iget-object v2, p0, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->multiRef:Ljava/util/Vector;

    invoke-virtual {v2, p2}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 758
    :cond_5
    aget-object p2, v1, v3

    if-nez p2, :cond_6

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "#o"

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    goto :goto_1

    :cond_6
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "#"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget-object p3, v1, v3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    :goto_1
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    const-string p3, "href"

    invoke-interface {p1, v0, p3, p2}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    :goto_2
    return-void

    .line 748
    :cond_7
    :goto_3
    iget-object p2, p0, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->xsi:Ljava/lang/String;

    iget p3, p0, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->version:I

    const/16 v0, 0x78

    if-lt p3, v0, :cond_8

    const-string p3, "nil"

    goto :goto_4

    :cond_8
    const-string p3, "null"

    :goto_4
    const-string v0, "true"

    invoke-interface {p1, p2, p3, v0}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    return-void
.end method

.method protected writeVectorBody(Lorg/xmlpull/v1/XmlSerializer;Ljava/util/Vector;Lorg/ksoap2/serialization/PropertyInfo;)V
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    const-string v1, "item"

    if-nez p3, :cond_0

    .line 853
    sget-object p3, Lorg/ksoap2/serialization/PropertyInfo;->OBJECT_TYPE:Lorg/ksoap2/serialization/PropertyInfo;

    goto :goto_0

    .line 854
    :cond_0
    instance-of v2, p3, Lorg/ksoap2/serialization/PropertyInfo;

    if-eqz v2, :cond_1

    .line 855
    iget-object v2, p3, Lorg/ksoap2/serialization/PropertyInfo;->name:Ljava/lang/String;

    if-eqz v2, :cond_1

    .line 856
    iget-object v1, p3, Lorg/ksoap2/serialization/PropertyInfo;->name:Ljava/lang/String;

    .line 857
    iget-object v2, p3, Lorg/ksoap2/serialization/PropertyInfo;->namespace:Ljava/lang/String;

    goto :goto_1

    :cond_1
    :goto_0
    move-object v2, v0

    .line 861
    :goto_1
    invoke-virtual {p2}, Ljava/util/Vector;->size()I

    move-result v3

    .line 862
    iget-object v4, p3, Lorg/ksoap2/serialization/PropertyInfo;->type:Ljava/lang/Object;

    invoke-virtual {p0, v4, v0}, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->getInfo(Ljava/lang/Object;Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    .line 865
    iget-boolean v4, p0, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->implicitTypes:Z

    const-string v5, "]"

    const-string v6, "["

    const/4 v7, 0x1

    const/4 v8, 0x0

    if-nez v4, :cond_2

    .line 866
    iget-object v4, p0, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->enc:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    aget-object v10, v0, v8

    check-cast v10, Ljava/lang/String;

    invoke-interface {p1, v10, v8}, Lorg/xmlpull/v1/XmlSerializer;->getPrefix(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v10, ":"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget-object v0, v0, v7

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v9, "arrayType"

    invoke-interface {p1, v4, v9, v0}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    goto :goto_2

    :cond_2
    if-nez v2, :cond_3

    .line 871
    aget-object v0, v0, v8

    move-object v2, v0

    check-cast v2, Ljava/lang/String;

    :cond_3
    :goto_2
    move v0, v8

    move v4, v0

    :goto_3
    if-ge v0, v3, :cond_6

    .line 877
    invoke-virtual {p2, v0}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v9

    if-nez v9, :cond_4

    move v4, v7

    goto :goto_4

    .line 880
    :cond_4
    invoke-interface {p1, v2, v1}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    if-eqz v4, :cond_5

    .line 882
    iget-object v4, p0, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->enc:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    const-string v10, "position"

    invoke-interface {p1, v4, v10, v9}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    move v4, v8

    .line 885
    :cond_5
    invoke-virtual {p2, v0}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v9

    invoke-virtual {p0, p1, v9, p3}, Lorg/ksoap2/serialization/SoapSerializationEnvelope;->writeProperty(Lorg/xmlpull/v1/XmlSerializer;Ljava/lang/Object;Lorg/ksoap2/serialization/PropertyInfo;)V

    .line 886
    invoke-interface {p1, v2, v1}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    :goto_4
    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    :cond_6
    return-void
.end method
