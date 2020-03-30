.class public Lcom/gonzalezolmedo/credhub/MainActivity;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "MainActivity.java"


# instance fields
.field private final IMPORT_REQUEST_CODE:I

.field private final NEW_REQUEST_CODE:I

.field private TAG:Ljava/lang/String;

.field private credentialsDbHelper:Lcom/gonzalezolmedo/credhub/database/CredentialsDbHelper;

.field private credentialsList:[Lcom/gonzalezolmedo/credhub/model/Credential;

.field private layoutManager:Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

.field private mAdapter:Landroidx/recyclerview/widget/RecyclerView$Adapter;

.field private readableDatabase:Landroid/database/sqlite/SQLiteDatabase;

.field private recyclerView:Landroidx/recyclerview/widget/RecyclerView;

.field private writableDatabase:Landroid/database/sqlite/SQLiteDatabase;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 32
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    const/16 v0, 0x64

    .line 33
    iput v0, p0, Lcom/gonzalezolmedo/credhub/MainActivity;->NEW_REQUEST_CODE:I

    const/16 v0, 0x65

    .line 34
    iput v0, p0, Lcom/gonzalezolmedo/credhub/MainActivity;->IMPORT_REQUEST_CODE:I

    const-string v0, "MainActivity"

    .line 36
    iput-object v0, p0, Lcom/gonzalezolmedo/credhub/MainActivity;->TAG:Ljava/lang/String;

    return-void
.end method

.method private loadDataFromDatabase()V
    .locals 11

    .line 125
    iget-object v0, p0, Lcom/gonzalezolmedo/credhub/MainActivity;->TAG:Ljava/lang/String;

    const-string v1, "loadDataFromDatabase: getting credentials stored in the local DB"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 126
    iget-object v0, p0, Lcom/gonzalezolmedo/credhub/MainActivity;->credentialsDbHelper:Lcom/gonzalezolmedo/credhub/database/CredentialsDbHelper;

    invoke-virtual {v0}, Lcom/gonzalezolmedo/credhub/database/CredentialsDbHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    iput-object v1, p0, Lcom/gonzalezolmedo/credhub/MainActivity;->readableDatabase:Landroid/database/sqlite/SQLiteDatabase;

    const-string v0, "Password"

    const-string v9, "Username"

    const-string v10, "CredentialId"

    .line 128
    filled-new-array {v10, v9, v0}, [Ljava/lang/String;

    move-result-object v3

    const-string v2, "Credentials"

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    .line 134
    invoke-virtual/range {v1 .. v8}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    .line 144
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 146
    :goto_0
    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 147
    invoke-interface {v1, v10}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 148
    invoke-interface {v1, v9}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v1, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 149
    invoke-interface {v1, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v5

    invoke-interface {v1, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    .line 151
    new-instance v6, Lcom/gonzalezolmedo/credhub/model/Credential;

    const/4 v7, 0x0

    invoke-direct {v6, v3, v4, v5, v7}, Lcom/gonzalezolmedo/credhub/model/Credential;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/graphics/drawable/Drawable;)V

    invoke-interface {v2, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    new-array v0, v0, [Lcom/gonzalezolmedo/credhub/model/Credential;

    .line 154
    invoke-interface {v2, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/gonzalezolmedo/credhub/model/Credential;

    iput-object v0, p0, Lcom/gonzalezolmedo/credhub/MainActivity;->credentialsList:[Lcom/gonzalezolmedo/credhub/model/Credential;

    .line 155
    invoke-direct {p0}, Lcom/gonzalezolmedo/credhub/MainActivity;->loadIconsFromPhone()V

    .line 157
    iget-object v0, p0, Lcom/gonzalezolmedo/credhub/MainActivity;->mAdapter:Landroidx/recyclerview/widget/RecyclerView$Adapter;

    if-eqz v0, :cond_1

    .line 158
    iget-object v0, p0, Lcom/gonzalezolmedo/credhub/MainActivity;->credentialsList:[Lcom/gonzalezolmedo/credhub/model/Credential;

    invoke-static {v0}, Lcom/gonzalezolmedo/credhub/CredentialsAdapter;->updateList([Lcom/gonzalezolmedo/credhub/model/Credential;)V

    .line 159
    iget-object v0, p0, Lcom/gonzalezolmedo/credhub/MainActivity;->mAdapter:Landroidx/recyclerview/widget/RecyclerView$Adapter;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 162
    :cond_1
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    return-void
.end method

.method private loadIconsFromPhone()V
    .locals 6

    .line 179
    iget-object v0, p0, Lcom/gonzalezolmedo/credhub/MainActivity;->credentialsList:[Lcom/gonzalezolmedo/credhub/model/Credential;

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, v0, v2

    .line 181
    :try_start_0
    invoke-virtual {p0}, Lcom/gonzalezolmedo/credhub/MainActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v4

    invoke-virtual {v3}, Lcom/gonzalezolmedo/credhub/model/Credential;->getIdentifier()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/content/pm/PackageManager;->getApplicationIcon(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    .line 182
    invoke-virtual {v3, v4}, Lcom/gonzalezolmedo/credhub/model/Credential;->setIcon(Landroid/graphics/drawable/Drawable;)V
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v3

    .line 184
    invoke-virtual {v3}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method private storeDataInDatabase(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 166
    iget-object v0, p0, Lcom/gonzalezolmedo/credhub/MainActivity;->TAG:Ljava/lang/String;

    const-string v1, "storeDataInDatabase: saving imported credential in db"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 167
    iget-object v0, p0, Lcom/gonzalezolmedo/credhub/MainActivity;->credentialsDbHelper:Lcom/gonzalezolmedo/credhub/database/CredentialsDbHelper;

    invoke-virtual {v0}, Lcom/gonzalezolmedo/credhub/database/CredentialsDbHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    iput-object v0, p0, Lcom/gonzalezolmedo/credhub/MainActivity;->writableDatabase:Landroid/database/sqlite/SQLiteDatabase;

    .line 169
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    const-string v1, "CredentialId"

    .line 170
    invoke-virtual {v0, v1, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "Username"

    .line 171
    invoke-virtual {v0, p1, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "Password"

    .line 172
    invoke-virtual {v0, p1, p3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 175
    iget-object p1, p0, Lcom/gonzalezolmedo/credhub/MainActivity;->readableDatabase:Landroid/database/sqlite/SQLiteDatabase;

    const-string p2, "Credentials"

    const/4 p3, 0x0

    const/4 v1, 0x5

    invoke-virtual {p1, p2, p3, v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->insertWithOnConflict(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;I)J

    return-void
.end method


# virtual methods
.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 3

    .line 92
    invoke-super {p0, p1, p2, p3}, Landroidx/appcompat/app/AppCompatActivity;->onActivityResult(IILandroid/content/Intent;)V

    .line 93
    iget-object v0, p0, Lcom/gonzalezolmedo/credhub/MainActivity;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onActivityResult: returned from child with resultCode:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    const v0, 0x7f08005f

    const/4 v1, -0x1

    if-ne p2, v1, :cond_0

    const/16 v2, 0x64

    if-ne p1, v2, :cond_0

    .line 96
    iget-object p1, p0, Lcom/gonzalezolmedo/credhub/MainActivity;->TAG:Ljava/lang/String;

    const-string p2, "onActivityResult: the user has added a credential"

    invoke-static {p1, p2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 97
    invoke-virtual {p0, v0}, Lcom/gonzalezolmedo/credhub/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    const-string p2, "Success creating credential"

    invoke-static {p1, p2, v1}, Lcom/google/android/material/snackbar/Snackbar;->make(Landroid/view/View;Ljava/lang/CharSequence;I)Lcom/google/android/material/snackbar/Snackbar;

    move-result-object p1

    .line 98
    invoke-virtual {p1}, Lcom/google/android/material/snackbar/Snackbar;->show()V

    goto :goto_0

    :cond_0
    if-ne p2, v1, :cond_1

    const/16 p2, 0x65

    if-ne p1, p2, :cond_1

    .line 101
    iget-object p1, p0, Lcom/gonzalezolmedo/credhub/MainActivity;->TAG:Ljava/lang/String;

    const-string p2, "onActivityResult: credential correctly imported"

    invoke-static {p1, p2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 102
    invoke-virtual {p0, v0}, Lcom/gonzalezolmedo/credhub/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    const-string p2, "Success importing credential"

    invoke-static {p1, p2, v1}, Lcom/google/android/material/snackbar/Snackbar;->make(Landroid/view/View;Ljava/lang/CharSequence;I)Lcom/google/android/material/snackbar/Snackbar;

    move-result-object p1

    .line 103
    invoke-virtual {p1}, Lcom/google/android/material/snackbar/Snackbar;->show()V

    .line 105
    invoke-virtual {p3}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object p1

    if-eqz p1, :cond_1

    const-string p2, "identifier"

    .line 107
    invoke-virtual {p1, p2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    const-string p3, "username"

    .line 108
    invoke-virtual {p1, p3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    const-string v0, "password"

    .line 109
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 111
    invoke-direct {p0, p2, p3, p1}, Lcom/gonzalezolmedo/credhub/MainActivity;->storeDataInDatabase(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 115
    :cond_1
    :goto_0
    invoke-direct {p0}, Lcom/gonzalezolmedo/credhub/MainActivity;->loadDataFromDatabase()V

    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 61
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    const p1, 0x7f0b001f

    .line 62
    invoke-virtual {p0, p1}, Lcom/gonzalezolmedo/credhub/MainActivity;->setContentView(I)V

    const p1, 0x7f08012a

    .line 64
    invoke-virtual {p0, p1}, Lcom/gonzalezolmedo/credhub/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroidx/appcompat/widget/Toolbar;

    .line 65
    invoke-virtual {p0, p1}, Lcom/gonzalezolmedo/credhub/MainActivity;->setSupportActionBar(Landroidx/appcompat/widget/Toolbar;)V

    const p1, 0x7f08007a

    .line 67
    invoke-virtual {p0, p1}, Lcom/gonzalezolmedo/credhub/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    .line 68
    new-instance v0, Lcom/gonzalezolmedo/credhub/MainActivity$1;

    invoke-direct {v0, p0}, Lcom/gonzalezolmedo/credhub/MainActivity$1;-><init>(Lcom/gonzalezolmedo/credhub/MainActivity;)V

    invoke-virtual {p1, v0}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 76
    new-instance p1, Lcom/gonzalezolmedo/credhub/database/CredentialsDbHelper;

    invoke-direct {p1, p0}, Lcom/gonzalezolmedo/credhub/database/CredentialsDbHelper;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Lcom/gonzalezolmedo/credhub/MainActivity;->credentialsDbHelper:Lcom/gonzalezolmedo/credhub/database/CredentialsDbHelper;

    const p1, 0x7f0800d5

    .line 78
    invoke-virtual {p0, p1}, Lcom/gonzalezolmedo/credhub/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroidx/recyclerview/widget/RecyclerView;

    iput-object p1, p0, Lcom/gonzalezolmedo/credhub/MainActivity;->recyclerView:Landroidx/recyclerview/widget/RecyclerView;

    .line 80
    new-instance p1, Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-direct {p1, p0}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Lcom/gonzalezolmedo/credhub/MainActivity;->layoutManager:Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    .line 81
    iget-object v0, p0, Lcom/gonzalezolmedo/credhub/MainActivity;->recyclerView:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    .line 83
    invoke-direct {p0}, Lcom/gonzalezolmedo/credhub/MainActivity;->loadDataFromDatabase()V

    .line 85
    new-instance p1, Lcom/gonzalezolmedo/credhub/CredentialsAdapter;

    iget-object v0, p0, Lcom/gonzalezolmedo/credhub/MainActivity;->credentialsList:[Lcom/gonzalezolmedo/credhub/model/Credential;

    invoke-direct {p1, v0}, Lcom/gonzalezolmedo/credhub/CredentialsAdapter;-><init>([Lcom/gonzalezolmedo/credhub/model/Credential;)V

    iput-object p1, p0, Lcom/gonzalezolmedo/credhub/MainActivity;->mAdapter:Landroidx/recyclerview/widget/RecyclerView$Adapter;

    .line 86
    iget-object v0, p0, Lcom/gonzalezolmedo/credhub/MainActivity;->recyclerView:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 2

    .line 120
    invoke-virtual {p0}, Lcom/gonzalezolmedo/credhub/MainActivity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    const v1, 0x7f0c0001

    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 121
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreateOptionsMenu(Landroid/view/Menu;)Z

    move-result p1

    return p1
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 2

    .line 49
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f08009f

    if-ne v0, v1, :cond_0

    .line 50
    iget-object p1, p0, Lcom/gonzalezolmedo/credhub/MainActivity;->TAG:Ljava/lang/String;

    const-string v0, "onOptionsItemSelected: importing credentials"

    invoke-static {p1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 51
    new-instance p1, Landroid/content/Intent;

    const-class v0, Lcom/gonzalezolmedo/credhub/ImportActivity;

    invoke-direct {p1, p0, v0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/16 v0, 0x65

    .line 52
    invoke-virtual {p0, p1, v0}, Lcom/gonzalezolmedo/credhub/MainActivity;->startActivityForResult(Landroid/content/Intent;I)V

    const/4 p1, 0x1

    return p1

    .line 55
    :cond_0
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result p1

    return p1
.end method
