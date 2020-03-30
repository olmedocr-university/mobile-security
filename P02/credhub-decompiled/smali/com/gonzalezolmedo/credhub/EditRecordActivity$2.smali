.class Lcom/gonzalezolmedo/credhub/EditRecordActivity$2;
.super Ljava/lang/Object;
.source "EditRecordActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/gonzalezolmedo/credhub/EditRecordActivity;->hidePassword(Landroid/widget/TextView;Z)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/gonzalezolmedo/credhub/EditRecordActivity;

.field final synthetic val$textViewPassword:Landroid/widget/TextView;


# direct methods
.method constructor <init>(Lcom/gonzalezolmedo/credhub/EditRecordActivity;Landroid/widget/TextView;)V
    .locals 0

    .line 133
    iput-object p1, p0, Lcom/gonzalezolmedo/credhub/EditRecordActivity$2;->this$0:Lcom/gonzalezolmedo/credhub/EditRecordActivity;

    iput-object p2, p0, Lcom/gonzalezolmedo/credhub/EditRecordActivity$2;->val$textViewPassword:Landroid/widget/TextView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 135
    iget-object v0, p0, Lcom/gonzalezolmedo/credhub/EditRecordActivity$2;->val$textViewPassword:Landroid/widget/TextView;

    const-string v1, "********"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method
