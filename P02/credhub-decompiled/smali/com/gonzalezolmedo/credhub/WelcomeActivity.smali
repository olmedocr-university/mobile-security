.class public Lcom/gonzalezolmedo/credhub/WelcomeActivity;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "WelcomeActivity.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 8
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 12
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    const p1, 0x7f0b0021

    .line 13
    invoke-virtual {p0, p1}, Lcom/gonzalezolmedo/credhub/WelcomeActivity;->setContentView(I)V

    .line 15
    new-instance p1, Ljava/lang/Thread;

    new-instance v0, Lcom/gonzalezolmedo/credhub/WelcomeActivity$1;

    invoke-direct {v0, p0}, Lcom/gonzalezolmedo/credhub/WelcomeActivity$1;-><init>(Lcom/gonzalezolmedo/credhub/WelcomeActivity;)V

    invoke-direct {p1, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 30
    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    return-void
.end method
