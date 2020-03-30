.class Lcom/gonzalezolmedo/credhub/CredentialsAdapter$CredentialViewHolder;
.super Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
.source "CredentialsAdapter.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/gonzalezolmedo/credhub/CredentialsAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "CredentialViewHolder"
.end annotation


# instance fields
.field private imageView:Landroid/widget/ImageView;

.field private mCredential:Lcom/gonzalezolmedo/credhub/model/Credential;

.field private textView:Landroid/widget/TextView;


# direct methods
.method constructor <init>(Landroid/view/View;)V
    .locals 1

    .line 55
    invoke-direct {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    const v0, 0x7f08011c

    .line 56
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/gonzalezolmedo/credhub/CredentialsAdapter$CredentialViewHolder;->textView:Landroid/widget/TextView;

    const v0, 0x7f080090

    .line 57
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/gonzalezolmedo/credhub/CredentialsAdapter$CredentialViewHolder;->imageView:Landroid/widget/ImageView;

    .line 59
    invoke-virtual {p1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method static synthetic access$000(Lcom/gonzalezolmedo/credhub/CredentialsAdapter$CredentialViewHolder;Lcom/gonzalezolmedo/credhub/model/Credential;)V
    .locals 0

    .line 49
    invoke-direct {p0, p1}, Lcom/gonzalezolmedo/credhub/CredentialsAdapter$CredentialViewHolder;->bind(Lcom/gonzalezolmedo/credhub/model/Credential;)V

    return-void
.end method

.method private bind(Lcom/gonzalezolmedo/credhub/model/Credential;)V
    .locals 2

    .line 63
    iput-object p1, p0, Lcom/gonzalezolmedo/credhub/CredentialsAdapter$CredentialViewHolder;->mCredential:Lcom/gonzalezolmedo/credhub/model/Credential;

    .line 64
    iget-object v0, p0, Lcom/gonzalezolmedo/credhub/CredentialsAdapter$CredentialViewHolder;->textView:Landroid/widget/TextView;

    invoke-virtual {p1}, Lcom/gonzalezolmedo/credhub/model/Credential;->getIdentifier()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 65
    iget-object v0, p0, Lcom/gonzalezolmedo/credhub/CredentialsAdapter$CredentialViewHolder;->imageView:Landroid/widget/ImageView;

    invoke-virtual {p1}, Lcom/gonzalezolmedo/credhub/model/Credential;->getIcon()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3

    .line 70
    invoke-static {}, Lcom/gonzalezolmedo/credhub/CredentialsAdapter;->access$100()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onClick: item "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/gonzalezolmedo/credhub/CredentialsAdapter$CredentialViewHolder;->mCredential:Lcom/gonzalezolmedo/credhub/model/Credential;

    invoke-virtual {v2}, Lcom/gonzalezolmedo/credhub/model/Credential;->getIdentifier()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 72
    new-instance v0, Landroid/content/Intent;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    const-class v2, Lcom/gonzalezolmedo/credhub/EditRecordActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 74
    iget-object v1, p0, Lcom/gonzalezolmedo/credhub/CredentialsAdapter$CredentialViewHolder;->mCredential:Lcom/gonzalezolmedo/credhub/model/Credential;

    invoke-virtual {v1}, Lcom/gonzalezolmedo/credhub/model/Credential;->getIdentifier()Ljava/lang/String;

    move-result-object v1

    const-string v2, "identifier"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 75
    iget-object v1, p0, Lcom/gonzalezolmedo/credhub/CredentialsAdapter$CredentialViewHolder;->mCredential:Lcom/gonzalezolmedo/credhub/model/Credential;

    invoke-virtual {v1}, Lcom/gonzalezolmedo/credhub/model/Credential;->getUsername()Ljava/lang/String;

    move-result-object v1

    const-string v2, "username"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 76
    iget-object v1, p0, Lcom/gonzalezolmedo/credhub/CredentialsAdapter$CredentialViewHolder;->mCredential:Lcom/gonzalezolmedo/credhub/model/Credential;

    invoke-virtual {v1}, Lcom/gonzalezolmedo/credhub/model/Credential;->getPassword()Ljava/lang/String;

    move-result-object v1

    const-string v2, "password"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 78
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void
.end method
