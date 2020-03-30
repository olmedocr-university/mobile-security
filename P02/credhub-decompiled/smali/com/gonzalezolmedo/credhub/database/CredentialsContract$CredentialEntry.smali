.class public abstract Lcom/gonzalezolmedo/credhub/database/CredentialsContract$CredentialEntry;
.super Ljava/lang/Object;
.source "CredentialsContract.java"

# interfaces
.implements Landroid/provider/BaseColumns;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/gonzalezolmedo/credhub/database/CredentialsContract;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "CredentialEntry"
.end annotation


# static fields
.field public static final COLUMN_NAME_ID:Ljava/lang/String; = "CredentialId"

.field public static final COLUMN_NAME_PASSWORD:Ljava/lang/String; = "Password"

.field public static final COLUMN_NAME_USERNAME:Ljava/lang/String; = "Username"

.field public static final SQL_CREATE_ENTRIES:Ljava/lang/String; = "CREATE TABLE Credentials (CredentialId TEXT PRIMARY KEY,Username TEXT,Password TEXT)"

.field public static final SQL_DELETE_ENTRIES:Ljava/lang/String; = "DROP TABLE IF EXISTS Credentials"

.field public static final TABLE_NAME:Ljava/lang/String; = "Credentials"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
