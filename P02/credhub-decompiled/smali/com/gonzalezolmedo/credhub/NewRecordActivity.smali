.class public Lcom/gonzalezolmedo/credhub/NewRecordActivity;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "NewRecordActivity.java"


# instance fields
.field private TAG:Ljava/lang/String;

.field credentialsDbHelper:Lcom/gonzalezolmedo/credhub/database/CredentialsDbHelper;

.field private installedAppsNames:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 39
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    const-string v0, "NewRecordActivity"

    .line 40
    iput-object v0, p0, Lcom/gonzalezolmedo/credhub/NewRecordActivity;->TAG:Ljava/lang/String;

    .line 41
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/gonzalezolmedo/credhub/NewRecordActivity;->installedAppsNames:Ljava/util/List;

    return-void
.end method

.method static synthetic access$000(Lcom/gonzalezolmedo/credhub/NewRecordActivity;)Ljava/lang/String;
    .locals 0

    .line 39
    iget-object p0, p0, Lcom/gonzalezolmedo/credhub/NewRecordActivity;->TAG:Ljava/lang/String;

    return-object p0
.end method

.method private populateSpinner(Landroid/widget/Spinner;)V
    .locals 3

    .line 104
    invoke-virtual {p0}, Lcom/gonzalezolmedo/credhub/NewRecordActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    const/16 v1, 0x80

    invoke-virtual {v0, v1}, Landroid/content/pm/PackageManager;->getInstalledApplications(I)Ljava/util/List;

    move-result-object v0

    .line 107
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/pm/ApplicationInfo;

    .line 108
    iget-object v2, v1, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    if-eqz v2, :cond_0

    .line 109
    iget-object v2, p0, Lcom/gonzalezolmedo/credhub/NewRecordActivity;->installedAppsNames:Ljava/util/List;

    iget-object v1, v1, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 112
    :cond_1
    iget-object v0, p0, Lcom/gonzalezolmedo/credhub/NewRecordActivity;->TAG:Ljava/lang/String;

    const-string v1, "populateSpinner: finsihed popoulating spinner "

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 115
    new-instance v0, Landroid/widget/ArrayAdapter;

    const v1, 0x1090008

    iget-object v2, p0, Lcom/gonzalezolmedo/credhub/NewRecordActivity;->installedAppsNames:Ljava/util/List;

    invoke-direct {v0, p0, v1, v2}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;ILjava/util/List;)V

    const v1, 0x1090009

    .line 118
    invoke-virtual {v0, v1}, Landroid/widget/ArrayAdapter;->setDropDownViewResource(I)V

    .line 121
    invoke-virtual {p1, v0}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 7

    .line 56
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    const p1, 0x7f0b0020

    .line 57
    invoke-virtual {p0, p1}, Lcom/gonzalezolmedo/credhub/NewRecordActivity;->setContentView(I)V

    const p1, 0x7f08012a

    .line 59
    invoke-virtual {p0, p1}, Lcom/gonzalezolmedo/credhub/NewRecordActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroidx/appcompat/widget/Toolbar;

    .line 60
    invoke-virtual {p0, p1}, Lcom/gonzalezolmedo/credhub/NewRecordActivity;->setSupportActionBar(Landroidx/appcompat/widget/Toolbar;)V

    .line 61
    invoke-virtual {p0}, Lcom/gonzalezolmedo/credhub/NewRecordActivity;->getSupportActionBar()Landroidx/appcompat/app/ActionBar;

    move-result-object p1

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroidx/appcompat/app/ActionBar;->setDisplayHomeAsUpEnabled(Z)V

    .line 62
    invoke-virtual {p0}, Lcom/gonzalezolmedo/credhub/NewRecordActivity;->getSupportActionBar()Landroidx/appcompat/app/ActionBar;

    move-result-object p1

    const-string v0, "New Credential"

    invoke-virtual {p1, v0}, Landroidx/appcompat/app/ActionBar;->setTitle(Ljava/lang/CharSequence;)V

    const p1, 0x7f0800fb

    .line 64
    invoke-virtual {p0, p1}, Lcom/gonzalezolmedo/credhub/NewRecordActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    move-object v2, p1

    check-cast v2, Landroid/widget/Spinner;

    .line 65
    invoke-direct {p0, v2}, Lcom/gonzalezolmedo/credhub/NewRecordActivity;->populateSpinner(Landroid/widget/Spinner;)V

    const p1, 0x7f080072

    .line 67
    invoke-virtual {p0, p1}, Lcom/gonzalezolmedo/credhub/NewRecordActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    move-object v3, p1

    check-cast v3, Landroid/widget/EditText;

    const p1, 0x7f080071

    .line 68
    invoke-virtual {p0, p1}, Lcom/gonzalezolmedo/credhub/NewRecordActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    move-object v4, p1

    check-cast v4, Landroid/widget/EditText;

    .line 70
    sget-object p1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v4}, Landroid/widget/EditText;->getHighlightColor()I

    move-result v0

    invoke-virtual {p1, v0}, Ljava/io/PrintStream;->println(I)V

    .line 72
    new-instance p1, Lcom/gonzalezolmedo/credhub/database/CredentialsDbHelper;

    invoke-direct {p1, p0}, Lcom/gonzalezolmedo/credhub/database/CredentialsDbHelper;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Lcom/gonzalezolmedo/credhub/NewRecordActivity;->credentialsDbHelper:Lcom/gonzalezolmedo/credhub/database/CredentialsDbHelper;

    .line 73
    invoke-virtual {p1}, Lcom/gonzalezolmedo/credhub/database/CredentialsDbHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v5

    const p1, 0x7f08007a

    .line 75
    invoke-virtual {p0, p1}, Lcom/gonzalezolmedo/credhub/NewRecordActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    .line 76
    new-instance v6, Lcom/gonzalezolmedo/credhub/NewRecordActivity$1;

    move-object v0, v6

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/gonzalezolmedo/credhub/NewRecordActivity$1;-><init>(Lcom/gonzalezolmedo/credhub/NewRecordActivity;Landroid/widget/Spinner;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/database/sqlite/SQLiteDatabase;)V

    invoke-virtual {p1, v6}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 2

    .line 46
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x102002c

    if-ne v0, v1, :cond_0

    .line 47
    iget-object p1, p0, Lcom/gonzalezolmedo/credhub/NewRecordActivity;->TAG:Ljava/lang/String;

    const-string v0, "onOptionsItemSelected: going back"

    invoke-static {p1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 48
    invoke-virtual {p0}, Lcom/gonzalezolmedo/credhub/NewRecordActivity;->onBackPressed()V

    const/4 p1, 0x1

    return p1

    .line 51
    :cond_0
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result p1

    return p1
.end method
