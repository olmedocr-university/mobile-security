.class Lcom/gonzalezolmedo/credhub/EditRecordActivity$1;
.super Ljava/lang/Object;
.source "EditRecordActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/gonzalezolmedo/credhub/EditRecordActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private isVisible:Z

.field final synthetic this$0:Lcom/gonzalezolmedo/credhub/EditRecordActivity;

.field final synthetic val$textViewPassword:Landroid/widget/TextView;


# direct methods
.method constructor <init>(Lcom/gonzalezolmedo/credhub/EditRecordActivity;Landroid/widget/TextView;)V
    .locals 0

    .line 96
    iput-object p1, p0, Lcom/gonzalezolmedo/credhub/EditRecordActivity$1;->this$0:Lcom/gonzalezolmedo/credhub/EditRecordActivity;

    iput-object p2, p0, Lcom/gonzalezolmedo/credhub/EditRecordActivity$1;->val$textViewPassword:Landroid/widget/TextView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$100(Lcom/gonzalezolmedo/credhub/EditRecordActivity$1;)Z
    .locals 0

    .line 96
    iget-boolean p0, p0, Lcom/gonzalezolmedo/credhub/EditRecordActivity$1;->isVisible:Z

    return p0
.end method

.method static synthetic access$102(Lcom/gonzalezolmedo/credhub/EditRecordActivity$1;Z)Z
    .locals 0

    .line 96
    iput-boolean p1, p0, Lcom/gonzalezolmedo/credhub/EditRecordActivity$1;->isVisible:Z

    return p1
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 101
    iget-boolean p1, p0, Lcom/gonzalezolmedo/credhub/EditRecordActivity$1;->isVisible:Z

    if-eqz p1, :cond_0

    .line 102
    iget-object v0, p0, Lcom/gonzalezolmedo/credhub/EditRecordActivity$1;->this$0:Lcom/gonzalezolmedo/credhub/EditRecordActivity;

    iget-object v1, p0, Lcom/gonzalezolmedo/credhub/EditRecordActivity$1;->val$textViewPassword:Landroid/widget/TextView;

    invoke-virtual {v0, v1, p1}, Lcom/gonzalezolmedo/credhub/EditRecordActivity;->hidePassword(Landroid/widget/TextView;Z)Z

    move-result p1

    iput-boolean p1, p0, Lcom/gonzalezolmedo/credhub/EditRecordActivity$1;->isVisible:Z

    goto :goto_0

    .line 104
    :cond_0
    iget-object p1, p0, Lcom/gonzalezolmedo/credhub/EditRecordActivity$1;->this$0:Lcom/gonzalezolmedo/credhub/EditRecordActivity;

    const v0, 0x7f08005f

    invoke-virtual {p1, v0}, Lcom/gonzalezolmedo/credhub/EditRecordActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    const/4 v0, -0x1

    const-string v1, "Showing password for 5 seconds"

    invoke-static {p1, v1, v0}, Lcom/google/android/material/snackbar/Snackbar;->make(Landroid/view/View;Ljava/lang/CharSequence;I)Lcom/google/android/material/snackbar/Snackbar;

    move-result-object p1

    .line 105
    invoke-virtual {p1}, Lcom/google/android/material/snackbar/Snackbar;->show()V

    .line 107
    iget-object p1, p0, Lcom/gonzalezolmedo/credhub/EditRecordActivity$1;->val$textViewPassword:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/gonzalezolmedo/credhub/EditRecordActivity$1;->this$0:Lcom/gonzalezolmedo/credhub/EditRecordActivity;

    invoke-static {v0}, Lcom/gonzalezolmedo/credhub/EditRecordActivity;->access$000(Lcom/gonzalezolmedo/credhub/EditRecordActivity;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 108
    iget-boolean p1, p0, Lcom/gonzalezolmedo/credhub/EditRecordActivity$1;->isVisible:Z

    xor-int/lit8 p1, p1, 0x1

    iput-boolean p1, p0, Lcom/gonzalezolmedo/credhub/EditRecordActivity$1;->isVisible:Z

    .line 110
    new-instance p1, Ljava/lang/Thread;

    new-instance v0, Lcom/gonzalezolmedo/credhub/EditRecordActivity$1$1;

    invoke-direct {v0, p0}, Lcom/gonzalezolmedo/credhub/EditRecordActivity$1$1;-><init>(Lcom/gonzalezolmedo/credhub/EditRecordActivity$1;)V

    invoke-direct {p1, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 123
    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    :goto_0
    return-void
.end method
