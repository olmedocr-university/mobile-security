.class public Lcom/gonzalezolmedo/credhub/LoginActivity;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "LoginActivity.java"


# static fields
.field public static final credHubPrefs:Ljava/lang/String; = "CredHubPrefs"

.field public static final passwordKey:Ljava/lang/String; = "password"

.field public static final usernameKey:Ljava/lang/String; = "username"


# instance fields
.field private TAG:Ljava/lang/String;

.field private editTextPassword:Landroid/widget/EditText;

.field private editTextUsername:Landroid/widget/EditText;

.field private sharedPreferences:Landroid/content/SharedPreferences;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 21
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    const-string v0, "LoginActivity"

    .line 25
    iput-object v0, p0, Lcom/gonzalezolmedo/credhub/LoginActivity;->TAG:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$000(Lcom/gonzalezolmedo/credhub/LoginActivity;)Landroid/widget/EditText;
    .locals 0

    .line 21
    iget-object p0, p0, Lcom/gonzalezolmedo/credhub/LoginActivity;->editTextUsername:Landroid/widget/EditText;

    return-object p0
.end method

.method static synthetic access$100(Lcom/gonzalezolmedo/credhub/LoginActivity;)Landroid/widget/EditText;
    .locals 0

    .line 21
    iget-object p0, p0, Lcom/gonzalezolmedo/credhub/LoginActivity;->editTextPassword:Landroid/widget/EditText;

    return-object p0
.end method

.method static synthetic access$200(Ljava/lang/String;)[B
    .locals 0

    .line 21
    invoke-static {p0}, Lcom/gonzalezolmedo/credhub/LoginActivity;->encodeString(Ljava/lang/String;)[B

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$300([B)Ljava/lang/String;
    .locals 0

    .line 21
    invoke-static {p0}, Lcom/gonzalezolmedo/credhub/LoginActivity;->bytesToHex([B)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static bytesToHex([B)Ljava/lang/String;
    .locals 5

    .line 31
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const/4 v1, 0x0

    .line 32
    :goto_0
    array-length v2, p0

    if-ge v1, v2, :cond_1

    .line 33
    aget-byte v2, p0, v1

    and-int/lit16 v2, v2, 0xff

    invoke-static {v2}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v2

    .line 34
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    const/4 v4, 0x1

    if-ne v3, v4, :cond_0

    const/16 v3, 0x30

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 35
    :cond_0
    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 37
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static encodeString(Ljava/lang/String;)[B
    .locals 2

    :try_start_0
    const-string v0, "SHA-256"

    .line 45
    invoke-static {v0}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v0

    .line 46
    sget-object v1, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {p0, v1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object p0
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    .line 48
    invoke-virtual {p0}, Ljava/security/NoSuchAlgorithmException;->printStackTrace()V

    const/4 p0, 0x0

    :goto_0
    return-object p0
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 56
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    const p1, 0x7f0b001e

    .line 57
    invoke-virtual {p0, p1}, Lcom/gonzalezolmedo/credhub/LoginActivity;->setContentView(I)V

    const p1, 0x7f080071

    .line 59
    invoke-virtual {p0, p1}, Lcom/gonzalezolmedo/credhub/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/EditText;

    iput-object p1, p0, Lcom/gonzalezolmedo/credhub/LoginActivity;->editTextPassword:Landroid/widget/EditText;

    const p1, 0x7f080072

    .line 60
    invoke-virtual {p0, p1}, Lcom/gonzalezolmedo/credhub/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/EditText;

    iput-object p1, p0, Lcom/gonzalezolmedo/credhub/LoginActivity;->editTextUsername:Landroid/widget/EditText;

    const-string p1, "CredHubPrefs"

    const/4 v0, 0x0

    .line 62
    invoke-virtual {p0, p1, v0}, Lcom/gonzalezolmedo/credhub/LoginActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p1

    iput-object p1, p0, Lcom/gonzalezolmedo/credhub/LoginActivity;->sharedPreferences:Landroid/content/SharedPreferences;

    const p1, 0x7f08007a

    .line 64
    invoke-virtual {p0, p1}, Lcom/gonzalezolmedo/credhub/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    .line 65
    new-instance v0, Lcom/gonzalezolmedo/credhub/LoginActivity$1;

    invoke-direct {v0, p0}, Lcom/gonzalezolmedo/credhub/LoginActivity$1;-><init>(Lcom/gonzalezolmedo/credhub/LoginActivity;)V

    invoke-virtual {p1, v0}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method
