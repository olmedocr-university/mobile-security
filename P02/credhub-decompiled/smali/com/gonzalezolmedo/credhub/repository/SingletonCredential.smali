.class public Lcom/gonzalezolmedo/credhub/repository/SingletonCredential;
.super Ljava/lang/Object;
.source "SingletonCredential.java"


# static fields
.field private static instance:Lcom/gonzalezolmedo/credhub/repository/SingletonCredential;


# instance fields
.field public password:Ljava/lang/String;

.field public username:Ljava/lang/String;


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 4
    iput-object v0, p0, Lcom/gonzalezolmedo/credhub/repository/SingletonCredential;->username:Ljava/lang/String;

    .line 5
    iput-object v0, p0, Lcom/gonzalezolmedo/credhub/repository/SingletonCredential;->password:Ljava/lang/String;

    return-void
.end method

.method public static getInstance()Lcom/gonzalezolmedo/credhub/repository/SingletonCredential;
    .locals 1

    .line 12
    sget-object v0, Lcom/gonzalezolmedo/credhub/repository/SingletonCredential;->instance:Lcom/gonzalezolmedo/credhub/repository/SingletonCredential;

    if-nez v0, :cond_0

    .line 13
    new-instance v0, Lcom/gonzalezolmedo/credhub/repository/SingletonCredential;

    invoke-direct {v0}, Lcom/gonzalezolmedo/credhub/repository/SingletonCredential;-><init>()V

    sput-object v0, Lcom/gonzalezolmedo/credhub/repository/SingletonCredential;->instance:Lcom/gonzalezolmedo/credhub/repository/SingletonCredential;

    .line 14
    :cond_0
    sget-object v0, Lcom/gonzalezolmedo/credhub/repository/SingletonCredential;->instance:Lcom/gonzalezolmedo/credhub/repository/SingletonCredential;

    return-object v0
.end method
