.class Landroidx/recyclerview/selection/StableIdKeyProvider$1;
.super Ljava/lang/Object;
.source "StableIdKeyProvider.java"

# interfaces
.implements Landroidx/recyclerview/widget/RecyclerView$OnChildAttachStateChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/recyclerview/selection/StableIdKeyProvider;-><init>(Landroidx/recyclerview/widget/RecyclerView;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/recyclerview/selection/StableIdKeyProvider;


# direct methods
.method constructor <init>(Landroidx/recyclerview/selection/StableIdKeyProvider;)V
    .locals 0

    .line 64
    iput-object p1, p0, Landroidx/recyclerview/selection/StableIdKeyProvider$1;->this$0:Landroidx/recyclerview/selection/StableIdKeyProvider;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onChildViewAttachedToWindow(Landroid/view/View;)V
    .locals 1

    .line 67
    iget-object v0, p0, Landroidx/recyclerview/selection/StableIdKeyProvider$1;->this$0:Landroidx/recyclerview/selection/StableIdKeyProvider;

    invoke-virtual {v0, p1}, Landroidx/recyclerview/selection/StableIdKeyProvider;->onAttached(Landroid/view/View;)V

    return-void
.end method

.method public onChildViewDetachedFromWindow(Landroid/view/View;)V
    .locals 1

    .line 72
    iget-object v0, p0, Landroidx/recyclerview/selection/StableIdKeyProvider$1;->this$0:Landroidx/recyclerview/selection/StableIdKeyProvider;

    invoke-virtual {v0, p1}, Landroidx/recyclerview/selection/StableIdKeyProvider;->onDetached(Landroid/view/View;)V

    return-void
.end method
