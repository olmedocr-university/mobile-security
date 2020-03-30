.class Lcom/gonzalezolmedo/credhub/LoginActivity$1;
.super Ljava/lang/Object;
.source "LoginActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/gonzalezolmedo/credhub/LoginActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/gonzalezolmedo/credhub/LoginActivity;


# direct methods
.method constructor <init>(Lcom/gonzalezolmedo/credhub/LoginActivity;)V
    .locals 0

    .line 65
    iput-object p1, p0, Lcom/gonzalezolmedo/credhub/LoginActivity$1;->this$0:Lcom/gonzalezolmedo/credhub/LoginActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 6

    .line 68
    iget-object v0, p0, Lcom/gonzalezolmedo/credhub/LoginActivity$1;->this$0:Lcom/gonzalezolmedo/credhub/LoginActivity;

    invoke-virtual {v0}, Lcom/gonzalezolmedo/credhub/LoginActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0f0027

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 70
    iget-object v1, p0, Lcom/gonzalezolmedo/credhub/LoginActivity$1;->this$0:Lcom/gonzalezolmedo/credhub/LoginActivity;

    invoke-static {v1}, Lcom/gonzalezolmedo/credhub/LoginActivity;->access$000(Lcom/gonzalezolmedo/credhub/LoginActivity;)Landroid/widget/EditText;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    .line 71
    iget-object v2, p0, Lcom/gonzalezolmedo/credhub/LoginActivity$1;->this$0:Lcom/gonzalezolmedo/credhub/LoginActivity;

    invoke-static {v2}, Lcom/gonzalezolmedo/credhub/LoginActivity;->access$100(Lcom/gonzalezolmedo/credhub/LoginActivity;)Landroid/widget/EditText;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    .line 73
    iget-object v3, p0, Lcom/gonzalezolmedo/credhub/LoginActivity$1;->this$0:Lcom/gonzalezolmedo/credhub/LoginActivity;

    invoke-virtual {v3}, Lcom/gonzalezolmedo/credhub/LoginActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0f0055 

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    .line 74
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/gonzalezolmedo/credhub/LoginActivity;->access$200(Ljava/lang/String;)[B

    move-result-object v0

    invoke-static {v0}, Lcom/gonzalezolmedo/credhub/LoginActivity;->access$300([B)Ljava/lang/String;

    move-result-object v0

    iget-object v4, p0, Lcom/gonzalezolmedo/credhub/LoginActivity$1;->this$0:Lcom/gonzalezolmedo/credhub/LoginActivity;

    invoke-virtual {v4}, Lcom/gonzalezolmedo/credhub/LoginActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f0f0028

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    # move-result-object v4
    const-string v4, "88970f9ec60e2a546da943c8e90892e7fd969ae6566c1d27058874297c1db243"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    if-eqz v3, :cond_0

    .line 77
    new-instance v0, Landroid/content/Intent;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    const-class v3, Lcom/gonzalezolmedo/credhub/MainActivity;

    invoke-direct {v0, p1, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 79
    invoke-static {}, Lcom/gonzalezolmedo/credhub/repository/SingletonCredential;->getInstance()Lcom/gonzalezolmedo/credhub/repository/SingletonCredential;

    move-result-object p1

    .line 80
    iput-object v1, p1, Lcom/gonzalezolmedo/credhub/repository/SingletonCredential;->username:Ljava/lang/String;

    .line 81
    iput-object v2, p1, Lcom/gonzalezolmedo/credhub/repository/SingletonCredential;->password:Ljava/lang/String;

    .line 83
    iget-object p1, p0, Lcom/gonzalezolmedo/credhub/LoginActivity$1;->this$0:Lcom/gonzalezolmedo/credhub/LoginActivity;

    invoke-virtual {p1, v0}, Lcom/gonzalezolmedo/credhub/LoginActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 85
    :cond_0
    iget-object p1, p0, Lcom/gonzalezolmedo/credhub/LoginActivity$1;->this$0:Lcom/gonzalezolmedo/credhub/LoginActivity;

    const v0, 0x7f08005f

    invoke-virtual {p1, v0}, Lcom/gonzalezolmedo/credhub/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    const/4 v0, -0x1

    const-string v1, "Error: Login incorrect"

    invoke-static {p1, v1, v0}, Lcom/google/android/material/snackbar/Snackbar;->make(Landroid/view/View;Ljava/lang/CharSequence;I)Lcom/google/android/material/snackbar/Snackbar;

    move-result-object p1

    .line 86
    invoke-virtual {p1}, Lcom/google/android/material/snackbar/Snackbar;->show()V

    :goto_0
    return-void
.end method
