.class public Lcom/gonzalezolmedo/credhub/EditRecordActivity;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "EditRecordActivity.java"


# instance fields
.field private TAG:Ljava/lang/String;

.field private mIdentifier:Ljava/lang/String;

.field private mPassword:Ljava/lang/String;

.field private mUsername:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 26
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    const-string v0, "EditRecordActivity"

    .line 30
    iput-object v0, p0, Lcom/gonzalezolmedo/credhub/EditRecordActivity;->TAG:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$000(Lcom/gonzalezolmedo/credhub/EditRecordActivity;)Ljava/lang/String;
    .locals 0

    .line 26
    iget-object p0, p0, Lcom/gonzalezolmedo/credhub/EditRecordActivity;->mPassword:Ljava/lang/String;

    return-object p0
.end method


# virtual methods
.method public hidePassword(Landroid/widget/TextView;Z)Z
    .locals 1

    .line 133
    new-instance v0, Lcom/gonzalezolmedo/credhub/EditRecordActivity$2;

    invoke-direct {v0, p0, p1}, Lcom/gonzalezolmedo/credhub/EditRecordActivity$2;-><init>(Lcom/gonzalezolmedo/credhub/EditRecordActivity;Landroid/widget/TextView;)V

    invoke-virtual {p0, v0}, Lcom/gonzalezolmedo/credhub/EditRecordActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    xor-int/lit8 p1, p2, 0x1

    return p1
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 4

    .line 70
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    const p1, 0x7f0b001c

    .line 71
    invoke-virtual {p0, p1}, Lcom/gonzalezolmedo/credhub/EditRecordActivity;->setContentView(I)V

    const p1, 0x7f08012a

    .line 73
    invoke-virtual {p0, p1}, Lcom/gonzalezolmedo/credhub/EditRecordActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroidx/appcompat/widget/Toolbar;

    .line 74
    invoke-virtual {p0, p1}, Lcom/gonzalezolmedo/credhub/EditRecordActivity;->setSupportActionBar(Landroidx/appcompat/widget/Toolbar;)V

    .line 75
    invoke-virtual {p0}, Lcom/gonzalezolmedo/credhub/EditRecordActivity;->getSupportActionBar()Landroidx/appcompat/app/ActionBar;

    move-result-object p1

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroidx/appcompat/app/ActionBar;->setDisplayHomeAsUpEnabled(Z)V

    const p1, 0x7f08011d

    .line 77
    invoke-virtual {p0, p1}, Lcom/gonzalezolmedo/credhub/EditRecordActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    const v0, 0x7f080121

    .line 78
    invoke-virtual {p0, v0}, Lcom/gonzalezolmedo/credhub/EditRecordActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const v1, 0x7f08011f

    .line 79
    invoke-virtual {p0, v1}, Lcom/gonzalezolmedo/credhub/EditRecordActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    const-string v2, "Hidden"

    .line 80
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 82
    invoke-virtual {p0}, Lcom/gonzalezolmedo/credhub/EditRecordActivity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v2

    if-eqz v2, :cond_0

    const-string v3, "identifier"

    .line 84
    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/gonzalezolmedo/credhub/EditRecordActivity;->mIdentifier:Ljava/lang/String;

    const-string v3, "username"

    .line 85
    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/gonzalezolmedo/credhub/EditRecordActivity;->mUsername:Ljava/lang/String;

    const-string v3, "password"

    .line 86
    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/gonzalezolmedo/credhub/EditRecordActivity;->mPassword:Ljava/lang/String;

    .line 88
    iget-object v2, p0, Lcom/gonzalezolmedo/credhub/EditRecordActivity;->mIdentifier:Ljava/lang/String;

    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 89
    iget-object p1, p0, Lcom/gonzalezolmedo/credhub/EditRecordActivity;->mUsername:Ljava/lang/String;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const-string p1, "********"

    .line 90
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 92
    invoke-virtual {p0}, Lcom/gonzalezolmedo/credhub/EditRecordActivity;->getSupportActionBar()Landroidx/appcompat/app/ActionBar;

    move-result-object p1

    iget-object v0, p0, Lcom/gonzalezolmedo/credhub/EditRecordActivity;->mIdentifier:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroidx/appcompat/app/ActionBar;->setTitle(Ljava/lang/CharSequence;)V

    :cond_0
    const p1, 0x7f08007a

    .line 95
    invoke-virtual {p0, p1}, Lcom/gonzalezolmedo/credhub/EditRecordActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    .line 96
    new-instance v0, Lcom/gonzalezolmedo/credhub/EditRecordActivity$1;

    invoke-direct {v0, p0, v1}, Lcom/gonzalezolmedo/credhub/EditRecordActivity$1;-><init>(Lcom/gonzalezolmedo/credhub/EditRecordActivity;Landroid/widget/TextView;)V

    invoke-virtual {p1, v0}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 2

    .line 143
    invoke-virtual {p0}, Lcom/gonzalezolmedo/credhub/EditRecordActivity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    const/high16 v1, 0x7f0c0000

    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 144
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreateOptionsMenu(Landroid/view/Menu;)Z

    move-result p1

    return p1
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 5

    .line 34
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x102002c

    const/4 v2, 0x1

    if-eq v0, v1, :cond_2

    const v1, 0x7f08009e

    if-eq v0, v1, :cond_0

    .line 63
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result p1

    return p1

    .line 36
    :cond_0
    iget-object p1, p0, Lcom/gonzalezolmedo/credhub/EditRecordActivity;->TAG:Ljava/lang/String;

    const-string v0, "onOptionsItemSelected: exporting current credential"

    invoke-static {p1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    const/4 p1, 0x0

    .line 39
    :try_start_0
    new-instance v0, Lcom/gonzalezolmedo/credhub/repository/ExportCredentialTask;

    invoke-direct {v0}, Lcom/gonzalezolmedo/credhub/repository/ExportCredentialTask;-><init>()V

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/String;

    iget-object v3, p0, Lcom/gonzalezolmedo/credhub/EditRecordActivity;->mIdentifier:Ljava/lang/String;

    aput-object v3, v1, p1

    iget-object v3, p0, Lcom/gonzalezolmedo/credhub/EditRecordActivity;->mUsername:Ljava/lang/String;

    aput-object v3, v1, v2

    const/4 v3, 0x2

    iget-object v4, p0, Lcom/gonzalezolmedo/credhub/EditRecordActivity;->mPassword:Ljava/lang/String;

    aput-object v4, v1, v3

    invoke-virtual {v0, v1}, Lcom/gonzalezolmedo/credhub/repository/ExportCredentialTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    move-result-object v0

    const-wide/16 v3, 0x5

    sget-object v1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v3, v4, v1}, Landroid/os/AsyncTask;->get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0
    :try_end_0
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/util/concurrent/TimeoutException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    .line 45
    iget-object v1, p0, Lcom/gonzalezolmedo/credhub/EditRecordActivity;->TAG:Ljava/lang/String;

    const-string v3, "onOptionsItemSelected: timeout while exporting"

    invoke-static {v1, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    :catch_1
    move-exception v0

    .line 43
    iget-object v1, p0, Lcom/gonzalezolmedo/credhub/EditRecordActivity;->TAG:Ljava/lang/String;

    const-string v3, "onOptionsItemSelected: connection interrupted"

    invoke-static {v1, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    :catch_2
    move-exception v0

    .line 41
    iget-object v1, p0, Lcom/gonzalezolmedo/credhub/EditRecordActivity;->TAG:Ljava/lang/String;

    const-string v3, "onOptionsItemSelected: execution exception while exporting record"

    invoke-static {v1, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_0
    move v0, p1

    :goto_1
    const v1, 0x7f08005f

    if-eqz v0, :cond_1

    .line 49
    invoke-virtual {p0, v1}, Lcom/gonzalezolmedo/credhub/EditRecordActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    const/4 v0, -0x1

    const-string v1, "Success!"

    invoke-static {p1, v1, v0}, Lcom/google/android/material/snackbar/Snackbar;->make(Landroid/view/View;Ljava/lang/CharSequence;I)Lcom/google/android/material/snackbar/Snackbar;

    move-result-object p1

    .line 50
    invoke-virtual {p1}, Lcom/google/android/material/snackbar/Snackbar;->show()V

    goto :goto_2

    .line 52
    :cond_1
    invoke-virtual {p0, v1}, Lcom/gonzalezolmedo/credhub/EditRecordActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const-string v1, "Error while exporting credential"

    invoke-static {v0, v1, p1}, Lcom/google/android/material/snackbar/Snackbar;->make(Landroid/view/View;Ljava/lang/CharSequence;I)Lcom/google/android/material/snackbar/Snackbar;

    move-result-object p1

    .line 53
    invoke-virtual {p1}, Lcom/google/android/material/snackbar/Snackbar;->show()V

    :goto_2
    return v2

    .line 58
    :cond_2
    iget-object p1, p0, Lcom/gonzalezolmedo/credhub/EditRecordActivity;->TAG:Ljava/lang/String;

    const-string v0, "onOptionsItemSelected: going back"

    invoke-static {p1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 59
    invoke-virtual {p0}, Lcom/gonzalezolmedo/credhub/EditRecordActivity;->onBackPressed()V

    return v2
.end method
