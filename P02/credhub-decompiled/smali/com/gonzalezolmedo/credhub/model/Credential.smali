.class public Lcom/gonzalezolmedo/credhub/model/Credential;
.super Ljava/lang/Object;
.source "Credential.java"


# instance fields
.field private icon:Landroid/graphics/drawable/Drawable;

.field private identifier:Ljava/lang/String;

.field private password:Ljava/lang/String;

.field private username:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/graphics/drawable/Drawable;)V
    .locals 0

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    iput-object p1, p0, Lcom/gonzalezolmedo/credhub/model/Credential;->identifier:Ljava/lang/String;

    .line 13
    iput-object p2, p0, Lcom/gonzalezolmedo/credhub/model/Credential;->username:Ljava/lang/String;

    .line 14
    iput-object p3, p0, Lcom/gonzalezolmedo/credhub/model/Credential;->password:Ljava/lang/String;

    .line 15
    iput-object p4, p0, Lcom/gonzalezolmedo/credhub/model/Credential;->icon:Landroid/graphics/drawable/Drawable;

    return-void
.end method


# virtual methods
.method public getIcon()Landroid/graphics/drawable/Drawable;
    .locals 1

    .line 31
    iget-object v0, p0, Lcom/gonzalezolmedo/credhub/model/Credential;->icon:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method public getIdentifier()Ljava/lang/String;
    .locals 1

    .line 19
    iget-object v0, p0, Lcom/gonzalezolmedo/credhub/model/Credential;->identifier:Ljava/lang/String;

    return-object v0
.end method

.method public getPassword()Ljava/lang/String;
    .locals 1

    .line 27
    iget-object v0, p0, Lcom/gonzalezolmedo/credhub/model/Credential;->password:Ljava/lang/String;

    return-object v0
.end method

.method public getUsername()Ljava/lang/String;
    .locals 1

    .line 23
    iget-object v0, p0, Lcom/gonzalezolmedo/credhub/model/Credential;->username:Ljava/lang/String;

    return-object v0
.end method

.method public setIcon(Landroid/graphics/drawable/Drawable;)V
    .locals 0

    .line 43
    iput-object p1, p0, Lcom/gonzalezolmedo/credhub/model/Credential;->icon:Landroid/graphics/drawable/Drawable;

    return-void
.end method

.method public setPassword(Ljava/lang/String;)V
    .locals 0

    .line 39
    iput-object p1, p0, Lcom/gonzalezolmedo/credhub/model/Credential;->password:Ljava/lang/String;

    return-void
.end method

.method public setUsername(Ljava/lang/String;)V
    .locals 0

    .line 35
    iput-object p1, p0, Lcom/gonzalezolmedo/credhub/model/Credential;->username:Ljava/lang/String;

    return-void
.end method
