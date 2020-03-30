.class Lcom/gonzalezolmedo/credhub/MainActivity$1;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/gonzalezolmedo/credhub/MainActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/gonzalezolmedo/credhub/MainActivity;


# direct methods
.method constructor <init>(Lcom/gonzalezolmedo/credhub/MainActivity;)V
    .locals 0

    .line 68
    iput-object p1, p0, Lcom/gonzalezolmedo/credhub/MainActivity$1;->this$0:Lcom/gonzalezolmedo/credhub/MainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 71
    new-instance v0, Landroid/content/Intent;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    const-class v1, Lcom/gonzalezolmedo/credhub/NewRecordActivity;

    invoke-direct {v0, p1, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 72
    iget-object p1, p0, Lcom/gonzalezolmedo/credhub/MainActivity$1;->this$0:Lcom/gonzalezolmedo/credhub/MainActivity;

    const/16 v1, 0x64

    invoke-virtual {p1, v0, v1}, Lcom/gonzalezolmedo/credhub/MainActivity;->startActivityForResult(Landroid/content/Intent;I)V

    return-void
.end method
