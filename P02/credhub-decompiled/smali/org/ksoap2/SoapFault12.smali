.class public Lorg/ksoap2/SoapFault12;
.super Lorg/ksoap2/SoapFault;
.source "SoapFault12.java"


# static fields
.field private static final serialVersionUID:J = 0xf7121L


# instance fields
.field public Code:Lorg/kxml2/kdom/Node;

.field public Detail:Lorg/kxml2/kdom/Node;

.field public Node:Lorg/kxml2/kdom/Node;

.field public Reason:Lorg/kxml2/kdom/Node;

.field public Role:Lorg/kxml2/kdom/Node;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 50
    invoke-direct {p0}, Lorg/ksoap2/SoapFault;-><init>()V

    const/16 v0, 0x78

    .line 51
    iput v0, p0, Lorg/ksoap2/SoapFault12;->version:I

    return-void
.end method

.method public constructor <init>(I)V
    .locals 0

    .line 55
    invoke-direct {p0}, Lorg/ksoap2/SoapFault;-><init>()V

    .line 56
    iput p1, p0, Lorg/ksoap2/SoapFault12;->version:I

    return-void
.end method

.method private parseSelf(Lorg/xmlpull/v1/XmlPullParser;)V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/xmlpull/v1/XmlPullParserException;
        }
    .end annotation

    const-string v0, "Fault"

    const-string v1, "http://www.w3.org/2003/05/soap-envelope"

    const/4 v2, 0x2

    .line 73
    invoke-interface {p1, v2, v1, v0}, Lorg/xmlpull/v1/XmlPullParser;->require(ILjava/lang/String;Ljava/lang/String;)V

    .line 75
    :goto_0
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextTag()I

    move-result v3

    const/4 v4, 0x3

    if-ne v3, v2, :cond_5

    .line 76
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v3

    .line 77
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getNamespace()Ljava/lang/String;

    move-result-object v5

    .line 78
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextTag()I

    .line 79
    invoke-virtual {v3}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v6

    const-string v7, "Code"

    invoke-virtual {v7}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 80
    new-instance v6, Lorg/kxml2/kdom/Node;

    invoke-direct {v6}, Lorg/kxml2/kdom/Node;-><init>()V

    iput-object v6, p0, Lorg/ksoap2/SoapFault12;->Code:Lorg/kxml2/kdom/Node;

    .line 81
    invoke-virtual {v6, p1}, Lorg/kxml2/kdom/Node;->parse(Lorg/xmlpull/v1/XmlPullParser;)V

    goto :goto_1

    .line 82
    :cond_0
    invoke-virtual {v3}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v6

    const-string v7, "Reason"

    invoke-virtual {v7}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 83
    new-instance v6, Lorg/kxml2/kdom/Node;

    invoke-direct {v6}, Lorg/kxml2/kdom/Node;-><init>()V

    iput-object v6, p0, Lorg/ksoap2/SoapFault12;->Reason:Lorg/kxml2/kdom/Node;

    .line 84
    invoke-virtual {v6, p1}, Lorg/kxml2/kdom/Node;->parse(Lorg/xmlpull/v1/XmlPullParser;)V

    goto :goto_1

    .line 85
    :cond_1
    invoke-virtual {v3}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v6

    const-string v7, "Node"

    invoke-virtual {v7}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 86
    new-instance v6, Lorg/kxml2/kdom/Node;

    invoke-direct {v6}, Lorg/kxml2/kdom/Node;-><init>()V

    iput-object v6, p0, Lorg/ksoap2/SoapFault12;->Node:Lorg/kxml2/kdom/Node;

    .line 87
    invoke-virtual {v6, p1}, Lorg/kxml2/kdom/Node;->parse(Lorg/xmlpull/v1/XmlPullParser;)V

    goto :goto_1

    .line 88
    :cond_2
    invoke-virtual {v3}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v6

    const-string v7, "Role"

    invoke-virtual {v7}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 89
    new-instance v6, Lorg/kxml2/kdom/Node;

    invoke-direct {v6}, Lorg/kxml2/kdom/Node;-><init>()V

    iput-object v6, p0, Lorg/ksoap2/SoapFault12;->Role:Lorg/kxml2/kdom/Node;

    .line 90
    invoke-virtual {v6, p1}, Lorg/kxml2/kdom/Node;->parse(Lorg/xmlpull/v1/XmlPullParser;)V

    goto :goto_1

    .line 91
    :cond_3
    invoke-virtual {v3}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v6

    const-string v7, "Detail"

    invoke-virtual {v7}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_4

    .line 92
    new-instance v6, Lorg/kxml2/kdom/Node;

    invoke-direct {v6}, Lorg/kxml2/kdom/Node;-><init>()V

    iput-object v6, p0, Lorg/ksoap2/SoapFault12;->Detail:Lorg/kxml2/kdom/Node;

    .line 93
    invoke-virtual {v6, p1}, Lorg/kxml2/kdom/Node;->parse(Lorg/xmlpull/v1/XmlPullParser;)V

    .line 98
    :goto_1
    invoke-interface {p1, v4, v5, v3}, Lorg/xmlpull/v1/XmlPullParser;->require(ILjava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 95
    :cond_4
    new-instance p1, Ljava/lang/RuntimeException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "unexpected tag:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 100
    :cond_5
    invoke-interface {p1, v4, v1, v0}, Lorg/xmlpull/v1/XmlPullParser;->require(ILjava/lang/String;Ljava/lang/String;)V

    .line 101
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextTag()I

    return-void
.end method


# virtual methods
.method public getMessage()Ljava/lang/String;
    .locals 3

    .line 141
    iget-object v0, p0, Lorg/ksoap2/SoapFault12;->Reason:Lorg/kxml2/kdom/Node;

    const-string v1, "http://www.w3.org/2003/05/soap-envelope"

    const-string v2, "Text"

    invoke-virtual {v0, v1, v2}, Lorg/kxml2/kdom/Node;->getElement(Ljava/lang/String;Ljava/lang/String;)Lorg/kxml2/kdom/Element;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lorg/kxml2/kdom/Element;->getText(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public parse(Lorg/xmlpull/v1/XmlPullParser;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/xmlpull/v1/XmlPullParserException;
        }
    .end annotation

    .line 63
    invoke-direct {p0, p1}, Lorg/ksoap2/SoapFault12;->parseSelf(Lorg/xmlpull/v1/XmlPullParser;)V

    .line 65
    iget-object p1, p0, Lorg/ksoap2/SoapFault12;->Code:Lorg/kxml2/kdom/Node;

    const-string v0, "http://www.w3.org/2003/05/soap-envelope"

    const-string v1, "Value"

    invoke-virtual {p1, v0, v1}, Lorg/kxml2/kdom/Node;->getElement(Ljava/lang/String;Ljava/lang/String;)Lorg/kxml2/kdom/Element;

    move-result-object p1

    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Lorg/kxml2/kdom/Element;->getText(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lorg/ksoap2/SoapFault12;->faultcode:Ljava/lang/String;

    .line 66
    iget-object p1, p0, Lorg/ksoap2/SoapFault12;->Reason:Lorg/kxml2/kdom/Node;

    const-string v2, "Text"

    invoke-virtual {p1, v0, v2}, Lorg/kxml2/kdom/Node;->getElement(Ljava/lang/String;Ljava/lang/String;)Lorg/kxml2/kdom/Element;

    move-result-object p1

    invoke-virtual {p1, v1}, Lorg/kxml2/kdom/Element;->getText(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lorg/ksoap2/SoapFault12;->faultstring:Ljava/lang/String;

    .line 67
    iget-object p1, p0, Lorg/ksoap2/SoapFault12;->Detail:Lorg/kxml2/kdom/Node;

    iput-object p1, p0, Lorg/ksoap2/SoapFault12;->detail:Lorg/kxml2/kdom/Node;

    const/4 p1, 0x0

    .line 68
    iput-object p1, p0, Lorg/ksoap2/SoapFault12;->faultactor:Ljava/lang/String;

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    .line 146
    iget-object v0, p0, Lorg/ksoap2/SoapFault12;->Reason:Lorg/kxml2/kdom/Node;

    const-string v1, "http://www.w3.org/2003/05/soap-envelope"

    const-string v2, "Text"

    invoke-virtual {v0, v1, v2}, Lorg/kxml2/kdom/Node;->getElement(Ljava/lang/String;Ljava/lang/String;)Lorg/kxml2/kdom/Element;

    move-result-object v0

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Lorg/kxml2/kdom/Element;->getText(I)Ljava/lang/String;

    move-result-object v0

    .line 147
    iget-object v3, p0, Lorg/ksoap2/SoapFault12;->Code:Lorg/kxml2/kdom/Node;

    const-string v4, "Value"

    invoke-virtual {v3, v1, v4}, Lorg/kxml2/kdom/Node;->getElement(Ljava/lang/String;Ljava/lang/String;)Lorg/kxml2/kdom/Element;

    move-result-object v1

    invoke-virtual {v1, v2}, Lorg/kxml2/kdom/Element;->getText(I)Ljava/lang/String;

    move-result-object v1

    .line 148
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Code: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", Reason: "

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public write(Lorg/xmlpull/v1/XmlSerializer;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-string v0, "Fault"

    const-string v1, "http://www.w3.org/2003/05/soap-envelope"

    .line 108
    invoke-interface {p1, v1, v0}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    const-string v2, "Code"

    .line 111
    invoke-interface {p1, v1, v2}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 112
    iget-object v3, p0, Lorg/ksoap2/SoapFault12;->Code:Lorg/kxml2/kdom/Node;

    invoke-virtual {v3, p1}, Lorg/kxml2/kdom/Node;->write(Lorg/xmlpull/v1/XmlSerializer;)V

    .line 113
    invoke-interface {p1, v1, v2}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    const-string v2, "Reason"

    .line 114
    invoke-interface {p1, v1, v2}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 115
    iget-object v3, p0, Lorg/ksoap2/SoapFault12;->Reason:Lorg/kxml2/kdom/Node;

    invoke-virtual {v3, p1}, Lorg/kxml2/kdom/Node;->write(Lorg/xmlpull/v1/XmlSerializer;)V

    .line 116
    invoke-interface {p1, v1, v2}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 118
    iget-object v2, p0, Lorg/ksoap2/SoapFault12;->Node:Lorg/kxml2/kdom/Node;

    if-eqz v2, :cond_0

    const-string v2, "Node"

    .line 119
    invoke-interface {p1, v1, v2}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 120
    iget-object v3, p0, Lorg/ksoap2/SoapFault12;->Node:Lorg/kxml2/kdom/Node;

    invoke-virtual {v3, p1}, Lorg/kxml2/kdom/Node;->write(Lorg/xmlpull/v1/XmlSerializer;)V

    .line 121
    invoke-interface {p1, v1, v2}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 123
    :cond_0
    iget-object v2, p0, Lorg/ksoap2/SoapFault12;->Role:Lorg/kxml2/kdom/Node;

    if-eqz v2, :cond_1

    const-string v2, "Role"

    .line 124
    invoke-interface {p1, v1, v2}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 125
    iget-object v3, p0, Lorg/ksoap2/SoapFault12;->Role:Lorg/kxml2/kdom/Node;

    invoke-virtual {v3, p1}, Lorg/kxml2/kdom/Node;->write(Lorg/xmlpull/v1/XmlSerializer;)V

    .line 126
    invoke-interface {p1, v1, v2}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 129
    :cond_1
    iget-object v2, p0, Lorg/ksoap2/SoapFault12;->Detail:Lorg/kxml2/kdom/Node;

    if-eqz v2, :cond_2

    const-string v2, "Detail"

    .line 130
    invoke-interface {p1, v1, v2}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 131
    iget-object v3, p0, Lorg/ksoap2/SoapFault12;->Detail:Lorg/kxml2/kdom/Node;

    invoke-virtual {v3, p1}, Lorg/kxml2/kdom/Node;->write(Lorg/xmlpull/v1/XmlSerializer;)V

    .line 132
    invoke-interface {p1, v1, v2}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 134
    :cond_2
    invoke-interface {p1, v1, v0}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    return-void
.end method
