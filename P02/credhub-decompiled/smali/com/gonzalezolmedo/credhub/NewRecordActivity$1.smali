.class Lcom/gonzalezolmedo/credhub/NewRecordActivity$1;
.super Ljava/lang/Object;
.source "NewRecordActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/gonzalezolmedo/credhub/NewRecordActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/gonzalezolmedo/credhub/NewRecordActivity;

.field final synthetic val$database:Landroid/database/sqlite/SQLiteDatabase;

.field final synthetic val$editTextPassword:Landroid/widget/EditText;

.field final synthetic val$editTextUsername:Landroid/widget/EditText;

.field final synthetic val$spinner:Landroid/widget/Spinner;


# direct methods
.method constructor <init>(Lcom/gonzalezolmedo/credhub/NewRecordActivity;Landroid/widget/Spinner;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 0

    .line 76
    iput-object p1, p0, Lcom/gonzalezolmedo/credhub/NewRecordActivity$1;->this$0:Lcom/gonzalezolmedo/credhub/NewRecordActivity;

    iput-object p2, p0, Lcom/gonzalezolmedo/credhub/NewRecordActivity$1;->val$spinner:Landroid/widget/Spinner;

    iput-object p3, p0, Lcom/gonzalezolmedo/credhub/NewRecordActivity$1;->val$editTextUsername:Landroid/widget/EditText;

    iput-object p4, p0, Lcom/gonzalezolmedo/credhub/NewRecordActivity$1;->val$editTextPassword:Landroid/widget/EditText;

    iput-object p5, p0, Lcom/gonzalezolmedo/credhub/NewRecordActivity$1;->val$database:Landroid/database/sqlite/SQLiteDatabase;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3

    .line 79
    new-instance p1, Landroid/content/ContentValues;

    invoke-direct {p1}, Landroid/content/ContentValues;-><init>()V

    .line 80
    iget-object v0, p0, Lcom/gonzalezolmedo/credhub/NewRecordActivity$1;->val$spinner:Landroid/widget/Spinner;

    invoke-virtual {v0}, Landroid/widget/Spinner;->getSelectedItem()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "CredentialId"

    invoke-virtual {p1, v1, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 81
    iget-object v0, p0, Lcom/gonzalezolmedo/credhub/NewRecordActivity$1;->val$editTextUsername:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Username"

    invoke-virtual {p1, v1, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 82
    iget-object v0, p0, Lcom/gonzalezolmedo/credhub/NewRecordActivity$1;->val$editTextPassword:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Password"

    invoke-virtual {p1, v1, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 85
    :try_start_0
    iget-object v0, p0, Lcom/gonzalezolmedo/credhub/NewRecordActivity$1;->val$database:Landroid/database/sqlite/SQLiteDatabase;

    const-string v1, "Credentials"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2, p1}, Landroid/database/sqlite/SQLiteDatabase;->insertOrThrow(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    .line 87
    new-instance p1, Landroid/content/Intent;

    invoke-direct {p1}, Landroid/content/Intent;-><init>()V

    .line 88
    iget-object v0, p0, Lcom/gonzalezolmedo/credhub/NewRecordActivity$1;->this$0:Lcom/gonzalezolmedo/credhub/NewRecordActivity;

    const/4 v1, -0x1

    invoke-virtual {v0, v1, p1}, Lcom/gonzalezolmedo/credhub/NewRecordActivity;->setResult(ILandroid/content/Intent;)V

    .line 89
    iget-object p1, p0, Lcom/gonzalezolmedo/credhub/NewRecordActivity$1;->this$0:Lcom/gonzalezolmedo/credhub/NewRecordActivity;

    invoke-virtual {p1}, Lcom/gonzalezolmedo/credhub/NewRecordActivity;->finish()V
    :try_end_0
    .catch Landroid/database/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 92
    iget-object v0, p0, Lcom/gonzalezolmedo/credhub/NewRecordActivity$1;->this$0:Lcom/gonzalezolmedo/credhub/NewRecordActivity;

    invoke-static {v0}, Lcom/gonzalezolmedo/credhub/NewRecordActivity;->access$000(Lcom/gonzalezolmedo/credhub/NewRecordActivity;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "onClick: a constraint failed (probably a PK)"

    invoke-static {v0, v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 93
    iget-object p1, p0, Lcom/gonzalezolmedo/credhub/NewRecordActivity$1;->this$0:Lcom/gonzalezolmedo/credhub/NewRecordActivity;

    const v0, 0x7f08005f

    invoke-virtual {p1, v0}, Lcom/gonzalezolmedo/credhub/NewRecordActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    const/4 v0, 0x0

    const-string v1, "Error while saving credential into the DB, try again"

    invoke-static {p1, v1, v0}, Lcom/google/android/material/snackbar/Snackbar;->make(Landroid/view/View;Ljava/lang/CharSequence;I)Lcom/google/android/material/snackbar/Snackbar;

    move-result-object p1

    .line 94
    invoke-virtual {p1}, Lcom/google/android/material/snackbar/Snackbar;->show()V

    :goto_0
    return-void
.end method
