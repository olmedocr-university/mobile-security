.class public Lcom/gonzalezolmedo/credhub/CredentialsAdapter;
.super Landroidx/recyclerview/widget/RecyclerView$Adapter;
.source "CredentialsAdapter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/gonzalezolmedo/credhub/CredentialsAdapter$CredentialViewHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/recyclerview/widget/RecyclerView$Adapter<",
        "Lcom/gonzalezolmedo/credhub/CredentialsAdapter$CredentialViewHolder;",
        ">;"
    }
.end annotation


# static fields
.field private static TAG:Ljava/lang/String; = "CredentialsAdapter"

.field private static mCredentials:[Lcom/gonzalezolmedo/credhub/model/Credential;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method constructor <init>([Lcom/gonzalezolmedo/credhub/model/Credential;)V
    .locals 0

    .line 23
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;-><init>()V

    .line 24
    sput-object p1, Lcom/gonzalezolmedo/credhub/CredentialsAdapter;->mCredentials:[Lcom/gonzalezolmedo/credhub/model/Credential;

    return-void
.end method

.method static synthetic access$100()Ljava/lang/String;
    .locals 1

    .line 17
    sget-object v0, Lcom/gonzalezolmedo/credhub/CredentialsAdapter;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static updateList([Lcom/gonzalezolmedo/credhub/model/Credential;)V
    .locals 0

    .line 28
    sput-object p0, Lcom/gonzalezolmedo/credhub/CredentialsAdapter;->mCredentials:[Lcom/gonzalezolmedo/credhub/model/Credential;

    return-void
.end method


# virtual methods
.method public getItemCount()I
    .locals 1

    .line 46
    sget-object v0, Lcom/gonzalezolmedo/credhub/CredentialsAdapter;->mCredentials:[Lcom/gonzalezolmedo/credhub/model/Credential;

    array-length v0, v0

    return v0
.end method

.method public bridge synthetic onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    .line 17
    check-cast p1, Lcom/gonzalezolmedo/credhub/CredentialsAdapter$CredentialViewHolder;

    invoke-virtual {p0, p1, p2}, Lcom/gonzalezolmedo/credhub/CredentialsAdapter;->onBindViewHolder(Lcom/gonzalezolmedo/credhub/CredentialsAdapter$CredentialViewHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/gonzalezolmedo/credhub/CredentialsAdapter$CredentialViewHolder;I)V
    .locals 1

    .line 41
    sget-object v0, Lcom/gonzalezolmedo/credhub/CredentialsAdapter;->mCredentials:[Lcom/gonzalezolmedo/credhub/model/Credential;

    aget-object p2, v0, p2

    invoke-static {p1, p2}, Lcom/gonzalezolmedo/credhub/CredentialsAdapter$CredentialViewHolder;->access$000(Lcom/gonzalezolmedo/credhub/CredentialsAdapter$CredentialViewHolder;Lcom/gonzalezolmedo/credhub/model/Credential;)V

    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .locals 0

    .line 17
    invoke-virtual {p0, p1, p2}, Lcom/gonzalezolmedo/credhub/CredentialsAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/gonzalezolmedo/credhub/CredentialsAdapter$CredentialViewHolder;

    move-result-object p1

    return-object p1
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/gonzalezolmedo/credhub/CredentialsAdapter$CredentialViewHolder;
    .locals 2

    .line 34
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    const v0, 0x7f0b005d

    const/4 v1, 0x0

    invoke-virtual {p2, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    .line 35
    new-instance p2, Lcom/gonzalezolmedo/credhub/CredentialsAdapter$CredentialViewHolder;

    invoke-direct {p2, p1}, Lcom/gonzalezolmedo/credhub/CredentialsAdapter$CredentialViewHolder;-><init>(Landroid/view/View;)V

    return-object p2
.end method
