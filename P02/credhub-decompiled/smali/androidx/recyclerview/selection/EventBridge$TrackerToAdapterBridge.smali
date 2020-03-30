.class final Landroidx/recyclerview/selection/EventBridge$TrackerToAdapterBridge;
.super Landroidx/recyclerview/selection/SelectionTracker$SelectionObserver;
.source "EventBridge.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/recyclerview/selection/EventBridge;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "TrackerToAdapterBridge"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        ">",
        "Landroidx/recyclerview/selection/SelectionTracker$SelectionObserver<",
        "TK;>;"
    }
.end annotation


# instance fields
.field private final mAdapter:Landroidx/recyclerview/widget/RecyclerView$Adapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/recyclerview/widget/RecyclerView$Adapter<",
            "*>;"
        }
    .end annotation
.end field

.field private final mKeyProvider:Landroidx/recyclerview/selection/ItemKeyProvider;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/recyclerview/selection/ItemKeyProvider<",
            "TK;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Landroidx/recyclerview/selection/SelectionTracker;Landroidx/recyclerview/selection/ItemKeyProvider;Landroidx/recyclerview/widget/RecyclerView$Adapter;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/recyclerview/selection/SelectionTracker<",
            "TK;>;",
            "Landroidx/recyclerview/selection/ItemKeyProvider<",
            "TK;>;",
            "Landroidx/recyclerview/widget/RecyclerView$Adapter<",
            "*>;)V"
        }
    .end annotation

    .line 75
    invoke-direct {p0}, Landroidx/recyclerview/selection/SelectionTracker$SelectionObserver;-><init>()V

    .line 77
    invoke-virtual {p1, p0}, Landroidx/recyclerview/selection/SelectionTracker;->addObserver(Landroidx/recyclerview/selection/SelectionTracker$SelectionObserver;)V

    const/4 p1, 0x1

    const/4 v0, 0x0

    if-eqz p2, :cond_0

    move v1, p1

    goto :goto_0

    :cond_0
    move v1, v0

    .line 79
    :goto_0
    invoke-static {v1}, Landroidx/core/util/Preconditions;->checkArgument(Z)V

    if-eqz p3, :cond_1

    goto :goto_1

    :cond_1
    move p1, v0

    .line 80
    :goto_1
    invoke-static {p1}, Landroidx/core/util/Preconditions;->checkArgument(Z)V

    .line 82
    iput-object p2, p0, Landroidx/recyclerview/selection/EventBridge$TrackerToAdapterBridge;->mKeyProvider:Landroidx/recyclerview/selection/ItemKeyProvider;

    .line 83
    iput-object p3, p0, Landroidx/recyclerview/selection/EventBridge$TrackerToAdapterBridge;->mAdapter:Landroidx/recyclerview/widget/RecyclerView$Adapter;

    return-void
.end method


# virtual methods
.method public onItemStateChanged(Ljava/lang/Object;Z)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;Z)V"
        }
    .end annotation

    .line 91
    iget-object p2, p0, Landroidx/recyclerview/selection/EventBridge$TrackerToAdapterBridge;->mKeyProvider:Landroidx/recyclerview/selection/ItemKeyProvider;

    invoke-virtual {p2, p1}, Landroidx/recyclerview/selection/ItemKeyProvider;->getPosition(Ljava/lang/Object;)I

    move-result p2

    if-gez p2, :cond_0

    .line 95
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Item change notification received for unknown item: "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "EventsRelays"

    invoke-static {p2, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 99
    :cond_0
    iget-object p1, p0, Landroidx/recyclerview/selection/EventBridge$TrackerToAdapterBridge;->mAdapter:Landroidx/recyclerview/widget/RecyclerView$Adapter;

    const-string v0, "Selection-Changed"

    invoke-virtual {p1, p2, v0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(ILjava/lang/Object;)V

    return-void
.end method
