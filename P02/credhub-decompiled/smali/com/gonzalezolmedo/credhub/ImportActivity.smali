.class public Lcom/gonzalezolmedo/credhub/ImportActivity;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "ImportActivity.java"


# instance fields
.field private TAG:Ljava/lang/String;

.field private mRemoteCredential:Lcom/gonzalezolmedo/credhub/model/Credential;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 26
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    const-string v0, "ImportActivity"

    .line 27
    iput-object v0, p0, Lcom/gonzalezolmedo/credhub/ImportActivity;->TAG:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$000(Lcom/gonzalezolmedo/credhub/ImportActivity;)Lcom/gonzalezolmedo/credhub/model/Credential;
    .locals 0

    .line 26
    iget-object p0, p0, Lcom/gonzalezolmedo/credhub/ImportActivity;->mRemoteCredential:Lcom/gonzalezolmedo/credhub/model/Credential;

    return-object p0
.end method

.method static synthetic access$002(Lcom/gonzalezolmedo/credhub/ImportActivity;Lcom/gonzalezolmedo/credhub/model/Credential;)Lcom/gonzalezolmedo/credhub/model/Credential;
    .locals 0

    .line 26
    iput-object p1, p0, Lcom/gonzalezolmedo/credhub/ImportActivity;->mRemoteCredential:Lcom/gonzalezolmedo/credhub/model/Credential;

    return-object p1
.end method

.method static synthetic access$100(Lcom/gonzalezolmedo/credhub/ImportActivity;)Ljava/lang/String;
    .locals 0

    .line 26
    iget-object p0, p0, Lcom/gonzalezolmedo/credhub/ImportActivity;->TAG:Ljava/lang/String;

    return-object p0
.end method

.method private populateSpinner(Landroid/widget/Spinner;)V
    .locals 4

    .line 80
    :try_start_0
    new-instance v0, Lcom/gonzalezolmedo/credhub/repository/RetrieveCredentialListTask;

    invoke-direct {v0}, Lcom/gonzalezolmedo/credhub/repository/RetrieveCredentialListTask;-><init>()V

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/gonzalezolmedo/credhub/repository/RetrieveCredentialListTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    move-result-object v0

    const-wide/16 v1, 0x5

    sget-object v3, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/AsyncTask;->get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 83
    new-instance v1, Landroid/widget/ArrayAdapter;

    const v2, 0x1090008

    invoke-direct {v1, p0, v2, v0}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;ILjava/util/List;)V

    const v0, 0x1090009

    .line 86
    invoke-virtual {v1, v0}, Landroid/widget/ArrayAdapter;->setDropDownViewResource(I)V

    .line 89
    invoke-virtual {p1, v1}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V
    :try_end_0
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/util/concurrent/TimeoutException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 95
    iget-object v0, p0, Lcom/gonzalezolmedo/credhub/ImportActivity;->TAG:Ljava/lang/String;

    const-string v1, "populateSpinner: connection timeout while retrieving credentials"

    invoke-static {v0, v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    :catch_1
    move-exception p1

    .line 93
    iget-object v0, p0, Lcom/gonzalezolmedo/credhub/ImportActivity;->TAG:Ljava/lang/String;

    const-string v1, "populateSpinner: interrupted connection with repo"

    invoke-static {v0, v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    :catch_2
    move-exception p1

    .line 91
    iget-object v0, p0, Lcom/gonzalezolmedo/credhub/ImportActivity;->TAG:Ljava/lang/String;

    const-string v1, "populateSpinner: error while retrieving credentials from repo"

    invoke-static {v0, v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_0
    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2

    .line 32
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    const p1, 0x7f0b001d

    .line 33
    invoke-virtual {p0, p1}, Lcom/gonzalezolmedo/credhub/ImportActivity;->setContentView(I)V

    const p1, 0x7f08012a

    .line 35
    invoke-virtual {p0, p1}, Lcom/gonzalezolmedo/credhub/ImportActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroidx/appcompat/widget/Toolbar;

    .line 36
    invoke-virtual {p0, p1}, Lcom/gonzalezolmedo/credhub/ImportActivity;->setSupportActionBar(Landroidx/appcompat/widget/Toolbar;)V

    .line 37
    invoke-virtual {p0}, Lcom/gonzalezolmedo/credhub/ImportActivity;->getSupportActionBar()Landroidx/appcompat/app/ActionBar;

    move-result-object p1

    const-string v0, "Import Credentials"

    invoke-virtual {p1, v0}, Landroidx/appcompat/app/ActionBar;->setTitle(Ljava/lang/CharSequence;)V

    const p1, 0x7f0800fc

    .line 39
    invoke-virtual {p0, p1}, Lcom/gonzalezolmedo/credhub/ImportActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/Spinner;

    .line 40
    invoke-direct {p0, p1}, Lcom/gonzalezolmedo/credhub/ImportActivity;->populateSpinner(Landroid/widget/Spinner;)V

    const v0, 0x7f08007a

    .line 42
    invoke-virtual {p0, v0}, Lcom/gonzalezolmedo/credhub/ImportActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    .line 43
    new-instance v1, Lcom/gonzalezolmedo/credhub/ImportActivity$1;

    invoke-direct {v1, p0, p1}, Lcom/gonzalezolmedo/credhub/ImportActivity$1;-><init>(Lcom/gonzalezolmedo/credhub/ImportActivity;Landroid/widget/Spinner;)V

    invoke-virtual {v0, v1}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method
