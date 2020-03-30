.class Lcom/gonzalezolmedo/credhub/ImportActivity$1;
.super Ljava/lang/Object;
.source "ImportActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/gonzalezolmedo/credhub/ImportActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/gonzalezolmedo/credhub/ImportActivity;

.field final synthetic val$spinner:Landroid/widget/Spinner;


# direct methods
.method constructor <init>(Lcom/gonzalezolmedo/credhub/ImportActivity;Landroid/widget/Spinner;)V
    .locals 0

    .line 43
    iput-object p1, p0, Lcom/gonzalezolmedo/credhub/ImportActivity$1;->this$0:Lcom/gonzalezolmedo/credhub/ImportActivity;

    iput-object p2, p0, Lcom/gonzalezolmedo/credhub/ImportActivity$1;->val$spinner:Landroid/widget/Spinner;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 5

    const/4 p1, 0x0

    .line 47
    :try_start_0
    iget-object v0, p0, Lcom/gonzalezolmedo/credhub/ImportActivity$1;->this$0:Lcom/gonzalezolmedo/credhub/ImportActivity;

    new-instance v1, Lcom/gonzalezolmedo/credhub/repository/ImportCredentialTask;

    invoke-direct {v1}, Lcom/gonzalezolmedo/credhub/repository/ImportCredentialTask;-><init>()V

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    iget-object v3, p0, Lcom/gonzalezolmedo/credhub/ImportActivity$1;->val$spinner:Landroid/widget/Spinner;

    invoke-virtual {v3}, Landroid/widget/Spinner;->getSelectedItem()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, p1

    invoke-virtual {v1, v2}, Lcom/gonzalezolmedo/credhub/repository/ImportCredentialTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    move-result-object v1

    const-wide/16 v2, 0x5

    sget-object v4, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v1, v2, v3, v4}, Landroid/os/AsyncTask;->get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/gonzalezolmedo/credhub/model/Credential;

    invoke-static {v0, v1}, Lcom/gonzalezolmedo/credhub/ImportActivity;->access$002(Lcom/gonzalezolmedo/credhub/ImportActivity;Lcom/gonzalezolmedo/credhub/model/Credential;)Lcom/gonzalezolmedo/credhub/model/Credential;
    :try_end_0
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/util/concurrent/TimeoutException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 53
    iget-object v1, p0, Lcom/gonzalezolmedo/credhub/ImportActivity$1;->this$0:Lcom/gonzalezolmedo/credhub/ImportActivity;

    invoke-static {v1}, Lcom/gonzalezolmedo/credhub/ImportActivity;->access$100(Lcom/gonzalezolmedo/credhub/ImportActivity;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "onClick: timeout while importing credential"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    :catch_1
    move-exception v0

    .line 51
    iget-object v1, p0, Lcom/gonzalezolmedo/credhub/ImportActivity$1;->this$0:Lcom/gonzalezolmedo/credhub/ImportActivity;

    invoke-static {v1}, Lcom/gonzalezolmedo/credhub/ImportActivity;->access$100(Lcom/gonzalezolmedo/credhub/ImportActivity;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "onClick: interrupted task while importing credential"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    :catch_2
    move-exception v0

    .line 49
    iget-object v1, p0, Lcom/gonzalezolmedo/credhub/ImportActivity$1;->this$0:Lcom/gonzalezolmedo/credhub/ImportActivity;

    invoke-static {v1}, Lcom/gonzalezolmedo/credhub/ImportActivity;->access$100(Lcom/gonzalezolmedo/credhub/ImportActivity;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "onClick: error while importing credential"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 56
    :goto_0
    iget-object v0, p0, Lcom/gonzalezolmedo/credhub/ImportActivity$1;->this$0:Lcom/gonzalezolmedo/credhub/ImportActivity;

    invoke-static {v0}, Lcom/gonzalezolmedo/credhub/ImportActivity;->access$000(Lcom/gonzalezolmedo/credhub/ImportActivity;)Lcom/gonzalezolmedo/credhub/model/Credential;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 57
    iget-object p1, p0, Lcom/gonzalezolmedo/credhub/ImportActivity$1;->this$0:Lcom/gonzalezolmedo/credhub/ImportActivity;

    invoke-static {p1}, Lcom/gonzalezolmedo/credhub/ImportActivity;->access$100(Lcom/gonzalezolmedo/credhub/ImportActivity;)Ljava/lang/String;

    move-result-object p1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onClick: imported credential "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/gonzalezolmedo/credhub/ImportActivity$1;->this$0:Lcom/gonzalezolmedo/credhub/ImportActivity;

    invoke-static {v1}, Lcom/gonzalezolmedo/credhub/ImportActivity;->access$000(Lcom/gonzalezolmedo/credhub/ImportActivity;)Lcom/gonzalezolmedo/credhub/model/Credential;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 59
    new-instance p1, Landroid/content/Intent;

    invoke-direct {p1}, Landroid/content/Intent;-><init>()V

    .line 60
    iget-object v0, p0, Lcom/gonzalezolmedo/credhub/ImportActivity$1;->this$0:Lcom/gonzalezolmedo/credhub/ImportActivity;

    invoke-static {v0}, Lcom/gonzalezolmedo/credhub/ImportActivity;->access$000(Lcom/gonzalezolmedo/credhub/ImportActivity;)Lcom/gonzalezolmedo/credhub/model/Credential;

    move-result-object v0

    invoke-virtual {v0}, Lcom/gonzalezolmedo/credhub/model/Credential;->getIdentifier()Ljava/lang/String;

    move-result-object v0

    const-string v1, "identifier"

    invoke-virtual {p1, v1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 61
    iget-object v0, p0, Lcom/gonzalezolmedo/credhub/ImportActivity$1;->this$0:Lcom/gonzalezolmedo/credhub/ImportActivity;

    invoke-static {v0}, Lcom/gonzalezolmedo/credhub/ImportActivity;->access$000(Lcom/gonzalezolmedo/credhub/ImportActivity;)Lcom/gonzalezolmedo/credhub/model/Credential;

    move-result-object v0

    invoke-virtual {v0}, Lcom/gonzalezolmedo/credhub/model/Credential;->getUsername()Ljava/lang/String;

    move-result-object v0

    const-string v1, "username"

    invoke-virtual {p1, v1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 62
    iget-object v0, p0, Lcom/gonzalezolmedo/credhub/ImportActivity$1;->this$0:Lcom/gonzalezolmedo/credhub/ImportActivity;

    invoke-static {v0}, Lcom/gonzalezolmedo/credhub/ImportActivity;->access$000(Lcom/gonzalezolmedo/credhub/ImportActivity;)Lcom/gonzalezolmedo/credhub/model/Credential;

    move-result-object v0

    invoke-virtual {v0}, Lcom/gonzalezolmedo/credhub/model/Credential;->getPassword()Ljava/lang/String;

    move-result-object v0

    const-string v1, "password"

    invoke-virtual {p1, v1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 63
    iget-object v0, p0, Lcom/gonzalezolmedo/credhub/ImportActivity$1;->this$0:Lcom/gonzalezolmedo/credhub/ImportActivity;

    const/4 v1, -0x1

    invoke-virtual {v0, v1, p1}, Lcom/gonzalezolmedo/credhub/ImportActivity;->setResult(ILandroid/content/Intent;)V

    .line 65
    iget-object p1, p0, Lcom/gonzalezolmedo/credhub/ImportActivity$1;->this$0:Lcom/gonzalezolmedo/credhub/ImportActivity;

    invoke-virtual {p1}, Lcom/gonzalezolmedo/credhub/ImportActivity;->finish()V

    goto :goto_1

    .line 68
    :cond_0
    iget-object v0, p0, Lcom/gonzalezolmedo/credhub/ImportActivity$1;->this$0:Lcom/gonzalezolmedo/credhub/ImportActivity;

    const v1, 0x7f08005f

    invoke-virtual {v0, v1}, Lcom/gonzalezolmedo/credhub/ImportActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const-string v1, "Error importing credential"

    invoke-static {v0, v1, p1}, Lcom/google/android/material/snackbar/Snackbar;->make(Landroid/view/View;Ljava/lang/CharSequence;I)Lcom/google/android/material/snackbar/Snackbar;

    move-result-object p1

    .line 69
    invoke-virtual {p1}, Lcom/google/android/material/snackbar/Snackbar;->show()V

    :goto_1
    return-void
.end method
