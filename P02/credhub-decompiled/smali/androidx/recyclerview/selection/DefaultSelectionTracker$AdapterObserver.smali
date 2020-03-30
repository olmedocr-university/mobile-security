.class final Landroidx/recyclerview/selection/DefaultSelectionTracker$AdapterObserver;
.super Landroidx/recyclerview/widget/RecyclerView$AdapterDataObserver;
.source "DefaultSelectionTracker.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/recyclerview/selection/DefaultSelectionTracker;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "AdapterObserver"
.end annotation


# instance fields
.field private final mSelectionTracker:Landroidx/recyclerview/selection/DefaultSelectionTracker;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/recyclerview/selection/DefaultSelectionTracker<",
            "*>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Landroidx/recyclerview/selection/DefaultSelectionTracker;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/recyclerview/selection/DefaultSelectionTracker<",
            "*>;)V"
        }
    .end annotation

    .line 585
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$AdapterDataObserver;-><init>()V

    if-eqz p1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 586
    :goto_0
    invoke-static {v0}, Landroidx/core/util/Preconditions;->checkArgument(Z)V

    .line 587
    iput-object p1, p0, Landroidx/recyclerview/selection/DefaultSelectionTracker$AdapterObserver;->mSelectionTracker:Landroidx/recyclerview/selection/DefaultSelectionTracker;

    return-void
.end method


# virtual methods
.method public onChanged()V
    .locals 1

    .line 592
    iget-object v0, p0, Landroidx/recyclerview/selection/DefaultSelectionTracker$AdapterObserver;->mSelectionTracker:Landroidx/recyclerview/selection/DefaultSelectionTracker;

    invoke-virtual {v0}, Landroidx/recyclerview/selection/DefaultSelectionTracker;->onDataSetChanged()V

    return-void
.end method

.method public onItemRangeChanged(IILjava/lang/Object;)V
    .locals 0

    const-string p1, "Selection-Changed"

    .line 597
    invoke-virtual {p1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_0

    .line 598
    iget-object p1, p0, Landroidx/recyclerview/selection/DefaultSelectionTracker$AdapterObserver;->mSelectionTracker:Landroidx/recyclerview/selection/DefaultSelectionTracker;

    invoke-virtual {p1}, Landroidx/recyclerview/selection/DefaultSelectionTracker;->onDataSetChanged()V

    :cond_0
    return-void
.end method

.method public onItemRangeInserted(II)V
    .locals 0

    .line 604
    iget-object p1, p0, Landroidx/recyclerview/selection/DefaultSelectionTracker$AdapterObserver;->mSelectionTracker:Landroidx/recyclerview/selection/DefaultSelectionTracker;

    invoke-virtual {p1}, Landroidx/recyclerview/selection/DefaultSelectionTracker;->endRange()V

    return-void
.end method

.method public onItemRangeMoved(III)V
    .locals 0

    .line 614
    iget-object p1, p0, Landroidx/recyclerview/selection/DefaultSelectionTracker$AdapterObserver;->mSelectionTracker:Landroidx/recyclerview/selection/DefaultSelectionTracker;

    invoke-virtual {p1}, Landroidx/recyclerview/selection/DefaultSelectionTracker;->endRange()V

    return-void
.end method

.method public onItemRangeRemoved(II)V
    .locals 0

    .line 609
    iget-object p1, p0, Landroidx/recyclerview/selection/DefaultSelectionTracker$AdapterObserver;->mSelectionTracker:Landroidx/recyclerview/selection/DefaultSelectionTracker;

    invoke-virtual {p1}, Landroidx/recyclerview/selection/DefaultSelectionTracker;->endRange()V

    return-void
.end method
