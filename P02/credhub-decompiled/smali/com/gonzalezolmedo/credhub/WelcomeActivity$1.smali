.class Lcom/gonzalezolmedo/credhub/WelcomeActivity$1;
.super Ljava/lang/Object;
.source "WelcomeActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/gonzalezolmedo/credhub/WelcomeActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/gonzalezolmedo/credhub/WelcomeActivity;


# direct methods
.method constructor <init>(Lcom/gonzalezolmedo/credhub/WelcomeActivity;)V
    .locals 0

    .line 15
    iput-object p1, p0, Lcom/gonzalezolmedo/credhub/WelcomeActivity$1;->this$0:Lcom/gonzalezolmedo/credhub/WelcomeActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    const-wide/16 v0, 0xbb8

    .line 19
    :try_start_0
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/gonzalezolmedo/credhub/WelcomeActivity$1;->this$0:Lcom/gonzalezolmedo/credhub/WelcomeActivity;

    const-class v2, Lcom/gonzalezolmedo/credhub/LoginActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 24
    :goto_0
    iget-object v1, p0, Lcom/gonzalezolmedo/credhub/WelcomeActivity$1;->this$0:Lcom/gonzalezolmedo/credhub/WelcomeActivity;

    invoke-virtual {v1, v0}, Lcom/gonzalezolmedo/credhub/WelcomeActivity;->startActivity(Landroid/content/Intent;)V

    .line 25
    iget-object v0, p0, Lcom/gonzalezolmedo/credhub/WelcomeActivity$1;->this$0:Lcom/gonzalezolmedo/credhub/WelcomeActivity;

    invoke-virtual {v0}, Lcom/gonzalezolmedo/credhub/WelcomeActivity;->finish()V

    goto :goto_1

    :catchall_0
    move-exception v0

    goto :goto_2

    :catch_0
    move-exception v0

    .line 21
    :try_start_1
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 23
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/gonzalezolmedo/credhub/WelcomeActivity$1;->this$0:Lcom/gonzalezolmedo/credhub/WelcomeActivity;

    const-class v2, Lcom/gonzalezolmedo/credhub/LoginActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    goto :goto_0

    :goto_1
    return-void

    :goto_2
    new-instance v1, Landroid/content/Intent;

    iget-object v2, p0, Lcom/gonzalezolmedo/credhub/WelcomeActivity$1;->this$0:Lcom/gonzalezolmedo/credhub/WelcomeActivity;

    const-class v3, Lcom/gonzalezolmedo/credhub/LoginActivity;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 24
    iget-object v2, p0, Lcom/gonzalezolmedo/credhub/WelcomeActivity$1;->this$0:Lcom/gonzalezolmedo/credhub/WelcomeActivity;

    invoke-virtual {v2, v1}, Lcom/gonzalezolmedo/credhub/WelcomeActivity;->startActivity(Landroid/content/Intent;)V

    .line 25
    iget-object v1, p0, Lcom/gonzalezolmedo/credhub/WelcomeActivity$1;->this$0:Lcom/gonzalezolmedo/credhub/WelcomeActivity;

    invoke-virtual {v1}, Lcom/gonzalezolmedo/credhub/WelcomeActivity;->finish()V

    .line 26
    throw v0
.end method
