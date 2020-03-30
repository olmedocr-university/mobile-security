.class Lcom/gonzalezolmedo/credhub/EditRecordActivity$1$1;
.super Ljava/lang/Object;
.source "EditRecordActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/gonzalezolmedo/credhub/EditRecordActivity$1;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/gonzalezolmedo/credhub/EditRecordActivity$1;


# direct methods
.method constructor <init>(Lcom/gonzalezolmedo/credhub/EditRecordActivity$1;)V
    .locals 0

    .line 110
    iput-object p1, p0, Lcom/gonzalezolmedo/credhub/EditRecordActivity$1$1;->this$1:Lcom/gonzalezolmedo/credhub/EditRecordActivity$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    const-wide/16 v0, 0x1388

    .line 114
    :try_start_0
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 118
    :goto_0
    iget-object v0, p0, Lcom/gonzalezolmedo/credhub/EditRecordActivity$1$1;->this$1:Lcom/gonzalezolmedo/credhub/EditRecordActivity$1;

    iget-object v1, v0, Lcom/gonzalezolmedo/credhub/EditRecordActivity$1;->this$0:Lcom/gonzalezolmedo/credhub/EditRecordActivity;

    iget-object v2, p0, Lcom/gonzalezolmedo/credhub/EditRecordActivity$1$1;->this$1:Lcom/gonzalezolmedo/credhub/EditRecordActivity$1;

    iget-object v2, v2, Lcom/gonzalezolmedo/credhub/EditRecordActivity$1;->val$textViewPassword:Landroid/widget/TextView;

    iget-object v3, p0, Lcom/gonzalezolmedo/credhub/EditRecordActivity$1$1;->this$1:Lcom/gonzalezolmedo/credhub/EditRecordActivity$1;

    invoke-static {v3}, Lcom/gonzalezolmedo/credhub/EditRecordActivity$1;->access$100(Lcom/gonzalezolmedo/credhub/EditRecordActivity$1;)Z

    move-result v3

    invoke-virtual {v1, v2, v3}, Lcom/gonzalezolmedo/credhub/EditRecordActivity;->hidePassword(Landroid/widget/TextView;Z)Z

    move-result v1

    invoke-static {v0, v1}, Lcom/gonzalezolmedo/credhub/EditRecordActivity$1;->access$102(Lcom/gonzalezolmedo/credhub/EditRecordActivity$1;Z)Z

    goto :goto_1

    :catchall_0
    move-exception v0

    goto :goto_2

    :catch_0
    move-exception v0

    .line 116
    :try_start_1
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :goto_1
    return-void

    .line 118
    :goto_2
    iget-object v1, p0, Lcom/gonzalezolmedo/credhub/EditRecordActivity$1$1;->this$1:Lcom/gonzalezolmedo/credhub/EditRecordActivity$1;

    iget-object v2, v1, Lcom/gonzalezolmedo/credhub/EditRecordActivity$1;->this$0:Lcom/gonzalezolmedo/credhub/EditRecordActivity;

    iget-object v3, p0, Lcom/gonzalezolmedo/credhub/EditRecordActivity$1$1;->this$1:Lcom/gonzalezolmedo/credhub/EditRecordActivity$1;

    iget-object v3, v3, Lcom/gonzalezolmedo/credhub/EditRecordActivity$1;->val$textViewPassword:Landroid/widget/TextView;

    iget-object v4, p0, Lcom/gonzalezolmedo/credhub/EditRecordActivity$1$1;->this$1:Lcom/gonzalezolmedo/credhub/EditRecordActivity$1;

    invoke-static {v4}, Lcom/gonzalezolmedo/credhub/EditRecordActivity$1;->access$100(Lcom/gonzalezolmedo/credhub/EditRecordActivity$1;)Z

    move-result v4

    invoke-virtual {v2, v3, v4}, Lcom/gonzalezolmedo/credhub/EditRecordActivity;->hidePassword(Landroid/widget/TextView;Z)Z

    move-result v2

    invoke-static {v1, v2}, Lcom/gonzalezolmedo/credhub/EditRecordActivity$1;->access$102(Lcom/gonzalezolmedo/credhub/EditRecordActivity$1;Z)Z

    .line 119
    throw v0
.end method
