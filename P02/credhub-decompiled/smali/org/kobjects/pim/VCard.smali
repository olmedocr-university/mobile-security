.class public Lorg/kobjects/pim/VCard;
.super Lorg/kobjects/pim/PimItem;
.source "VCard.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 13
    invoke-direct {p0}, Lorg/kobjects/pim/PimItem;-><init>()V

    return-void
.end method

.method public constructor <init>(Lorg/kobjects/pim/VCard;)V
    .locals 0

    .line 18
    invoke-direct {p0, p1}, Lorg/kobjects/pim/PimItem;-><init>(Lorg/kobjects/pim/PimItem;)V

    return-void
.end method


# virtual methods
.method public getArraySize(Ljava/lang/String;)I
    .locals 1

    const-string v0, "n"

    .line 29
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p1, 0x5

    return p1

    :cond_0
    const-string v0, "adr"

    .line 30
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    const/4 p1, 0x6

    return p1

    :cond_1
    const/4 p1, -0x1

    return p1
.end method

.method public getType()Ljava/lang/String;
    .locals 1

    const-string v0, "vcard"

    return-object v0
.end method
