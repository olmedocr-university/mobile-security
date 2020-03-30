.class public final Lcom/gonzalezolmedo/credhub/database/CredentialsContract;
.super Ljava/lang/Object;
.source "CredentialsContract.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/gonzalezolmedo/credhub/database/CredentialsContract$CredentialEntry;
    }
.end annotation


# static fields
.field public static final DATABASE_NAME:Ljava/lang/String; = "Credentials.db"

.field public static final DATABASE_VERSION:I = 0x6


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
