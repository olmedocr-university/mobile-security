.class Lorg/ksoap2/serialization/MarshalHashtable$ItemSoapObject;
.super Lorg/ksoap2/serialization/SoapObject;
.source "MarshalHashtable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/ksoap2/serialization/MarshalHashtable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "ItemSoapObject"
.end annotation


# instance fields
.field h:Ljava/util/Hashtable;

.field resolvedIndex:I

.field final synthetic this$0:Lorg/ksoap2/serialization/MarshalHashtable;


# direct methods
.method constructor <init>(Lorg/ksoap2/serialization/MarshalHashtable;Ljava/util/Hashtable;)V
    .locals 1

    .line 91
    iput-object p1, p0, Lorg/ksoap2/serialization/MarshalHashtable$ItemSoapObject;->this$0:Lorg/ksoap2/serialization/MarshalHashtable;

    const/4 p1, 0x0

    .line 92
    invoke-direct {p0, p1, p1}, Lorg/ksoap2/serialization/SoapObject;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, -0x1

    .line 90
    iput v0, p0, Lorg/ksoap2/serialization/MarshalHashtable$ItemSoapObject;->resolvedIndex:I

    .line 93
    iput-object p2, p0, Lorg/ksoap2/serialization/MarshalHashtable$ItemSoapObject;->h:Ljava/util/Hashtable;

    const-string p2, "key"

    .line 94
    invoke-virtual {p0, p2, p1}, Lorg/ksoap2/serialization/MarshalHashtable$ItemSoapObject;->addProperty(Ljava/lang/String;Ljava/lang/Object;)Lorg/ksoap2/serialization/SoapObject;

    const-string p2, "value"

    .line 95
    invoke-virtual {p0, p2, p1}, Lorg/ksoap2/serialization/MarshalHashtable$ItemSoapObject;->addProperty(Ljava/lang/String;Ljava/lang/Object;)Lorg/ksoap2/serialization/SoapObject;

    return-void
.end method


# virtual methods
.method public setProperty(ILjava/lang/Object;)V
    .locals 2

    .line 100
    iget v0, p0, Lorg/ksoap2/serialization/MarshalHashtable$ItemSoapObject;->resolvedIndex:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 101
    invoke-super {p0, p1, p2}, Lorg/ksoap2/serialization/SoapObject;->setProperty(ILjava/lang/Object;)V

    .line 102
    iput p1, p0, Lorg/ksoap2/serialization/MarshalHashtable$ItemSoapObject;->resolvedIndex:I

    goto :goto_1

    :cond_0
    if-nez v0, :cond_1

    const/4 v0, 0x0

    goto :goto_0

    :cond_1
    const/4 v0, 0x1

    .line 105
    :goto_0
    invoke-virtual {p0, v0}, Lorg/ksoap2/serialization/MarshalHashtable$ItemSoapObject;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    if-nez p1, :cond_2

    .line 107
    iget-object p1, p0, Lorg/ksoap2/serialization/MarshalHashtable$ItemSoapObject;->h:Ljava/util/Hashtable;

    invoke-virtual {p1, p2, v0}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 109
    :cond_2
    iget-object p1, p0, Lorg/ksoap2/serialization/MarshalHashtable$ItemSoapObject;->h:Ljava/util/Hashtable;

    invoke-virtual {p1, v0, p2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_1
    return-void
.end method
