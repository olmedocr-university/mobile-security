.class final Landroidx/recyclerview/selection/TouchInputHandler;
.super Landroidx/recyclerview/selection/MotionInputHandler;
.source "TouchInputHandler.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        ">",
        "Landroidx/recyclerview/selection/MotionInputHandler<",
        "TK;>;"
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "TouchInputDelegate"


# instance fields
.field private final mDetailsLookup:Landroidx/recyclerview/selection/ItemDetailsLookup;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/recyclerview/selection/ItemDetailsLookup<",
            "TK;>;"
        }
    .end annotation
.end field

.field private final mGestureStarter:Ljava/lang/Runnable;

.field private final mHapticPerformer:Ljava/lang/Runnable;

.field private final mOnDragInitiatedListener:Landroidx/recyclerview/selection/OnDragInitiatedListener;

.field private final mOnItemActivatedListener:Landroidx/recyclerview/selection/OnItemActivatedListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/recyclerview/selection/OnItemActivatedListener<",
            "TK;>;"
        }
    .end annotation
.end field

.field private final mSelectionPredicate:Landroidx/recyclerview/selection/SelectionTracker$SelectionPredicate;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/recyclerview/selection/SelectionTracker$SelectionPredicate<",
            "TK;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Landroidx/recyclerview/selection/SelectionTracker;Landroidx/recyclerview/selection/ItemKeyProvider;Landroidx/recyclerview/selection/ItemDetailsLookup;Landroidx/recyclerview/selection/SelectionTracker$SelectionPredicate;Ljava/lang/Runnable;Landroidx/recyclerview/selection/OnDragInitiatedListener;Landroidx/recyclerview/selection/OnItemActivatedListener;Landroidx/recyclerview/selection/FocusDelegate;Ljava/lang/Runnable;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/recyclerview/selection/SelectionTracker<",
            "TK;>;",
            "Landroidx/recyclerview/selection/ItemKeyProvider<",
            "TK;>;",
            "Landroidx/recyclerview/selection/ItemDetailsLookup<",
            "TK;>;",
            "Landroidx/recyclerview/selection/SelectionTracker$SelectionPredicate<",
            "TK;>;",
            "Ljava/lang/Runnable;",
            "Landroidx/recyclerview/selection/OnDragInitiatedListener;",
            "Landroidx/recyclerview/selection/OnItemActivatedListener<",
            "TK;>;",
            "Landroidx/recyclerview/selection/FocusDelegate<",
            "TK;>;",
            "Ljava/lang/Runnable;",
            ")V"
        }
    .end annotation

    .line 59
    invoke-direct {p0, p1, p2, p8}, Landroidx/recyclerview/selection/MotionInputHandler;-><init>(Landroidx/recyclerview/selection/SelectionTracker;Landroidx/recyclerview/selection/ItemKeyProvider;Landroidx/recyclerview/selection/FocusDelegate;)V

    const/4 p1, 0x1

    const/4 p2, 0x0

    if-eqz p3, :cond_0

    move p8, p1

    goto :goto_0

    :cond_0
    move p8, p2

    .line 61
    :goto_0
    invoke-static {p8}, Landroidx/core/util/Preconditions;->checkArgument(Z)V

    if-eqz p4, :cond_1

    move p8, p1

    goto :goto_1

    :cond_1
    move p8, p2

    .line 62
    :goto_1
    invoke-static {p8}, Landroidx/core/util/Preconditions;->checkArgument(Z)V

    if-eqz p5, :cond_2

    move p8, p1

    goto :goto_2

    :cond_2
    move p8, p2

    .line 63
    :goto_2
    invoke-static {p8}, Landroidx/core/util/Preconditions;->checkArgument(Z)V

    if-eqz p7, :cond_3

    move p8, p1

    goto :goto_3

    :cond_3
    move p8, p2

    .line 64
    :goto_3
    invoke-static {p8}, Landroidx/core/util/Preconditions;->checkArgument(Z)V

    if-eqz p6, :cond_4

    move p8, p1

    goto :goto_4

    :cond_4
    move p8, p2

    .line 65
    :goto_4
    invoke-static {p8}, Landroidx/core/util/Preconditions;->checkArgument(Z)V

    if-eqz p9, :cond_5

    goto :goto_5

    :cond_5
    move p1, p2

    .line 66
    :goto_5
    invoke-static {p1}, Landroidx/core/util/Preconditions;->checkArgument(Z)V

    .line 68
    iput-object p3, p0, Landroidx/recyclerview/selection/TouchInputHandler;->mDetailsLookup:Landroidx/recyclerview/selection/ItemDetailsLookup;

    .line 69
    iput-object p4, p0, Landroidx/recyclerview/selection/TouchInputHandler;->mSelectionPredicate:Landroidx/recyclerview/selection/SelectionTracker$SelectionPredicate;

    .line 70
    iput-object p5, p0, Landroidx/recyclerview/selection/TouchInputHandler;->mGestureStarter:Ljava/lang/Runnable;

    .line 71
    iput-object p7, p0, Landroidx/recyclerview/selection/TouchInputHandler;->mOnItemActivatedListener:Landroidx/recyclerview/selection/OnItemActivatedListener;

    .line 72
    iput-object p6, p0, Landroidx/recyclerview/selection/TouchInputHandler;->mOnDragInitiatedListener:Landroidx/recyclerview/selection/OnDragInitiatedListener;

    .line 73
    iput-object p9, p0, Landroidx/recyclerview/selection/TouchInputHandler;->mHapticPerformer:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public onLongPress(Landroid/view/MotionEvent;)V
    .locals 3

    .line 121
    iget-object v0, p0, Landroidx/recyclerview/selection/TouchInputHandler;->mDetailsLookup:Landroidx/recyclerview/selection/ItemDetailsLookup;

    invoke-virtual {v0, p1}, Landroidx/recyclerview/selection/ItemDetailsLookup;->overItemWithSelectionKey(Landroid/view/MotionEvent;)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 126
    :cond_0
    iget-object v0, p0, Landroidx/recyclerview/selection/TouchInputHandler;->mDetailsLookup:Landroidx/recyclerview/selection/ItemDetailsLookup;

    invoke-virtual {v0, p1}, Landroidx/recyclerview/selection/ItemDetailsLookup;->getItemDetails(Landroid/view/MotionEvent;)Landroidx/recyclerview/selection/ItemDetailsLookup$ItemDetails;

    move-result-object v0

    if-nez v0, :cond_1

    return-void

    .line 132
    :cond_1
    invoke-virtual {p0, p1}, Landroidx/recyclerview/selection/TouchInputHandler;->shouldExtendRange(Landroid/view/MotionEvent;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 133
    invoke-virtual {p0, v0}, Landroidx/recyclerview/selection/TouchInputHandler;->extendSelectionRange(Landroidx/recyclerview/selection/ItemDetailsLookup$ItemDetails;)V

    .line 134
    iget-object p1, p0, Landroidx/recyclerview/selection/TouchInputHandler;->mHapticPerformer:Ljava/lang/Runnable;

    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    goto :goto_0

    .line 136
    :cond_2
    iget-object v1, p0, Landroidx/recyclerview/selection/TouchInputHandler;->mSelectionTracker:Landroidx/recyclerview/selection/SelectionTracker;

    invoke-virtual {v0}, Landroidx/recyclerview/selection/ItemDetailsLookup$ItemDetails;->getSelectionKey()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroidx/recyclerview/selection/SelectionTracker;->isSelected(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 138
    iget-object v0, p0, Landroidx/recyclerview/selection/TouchInputHandler;->mOnDragInitiatedListener:Landroidx/recyclerview/selection/OnDragInitiatedListener;

    invoke-interface {v0, p1}, Landroidx/recyclerview/selection/OnDragInitiatedListener;->onDragInitiated(Landroid/view/MotionEvent;)Z

    .line 139
    iget-object p1, p0, Landroidx/recyclerview/selection/TouchInputHandler;->mHapticPerformer:Ljava/lang/Runnable;

    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    goto :goto_0

    .line 140
    :cond_3
    iget-object p1, p0, Landroidx/recyclerview/selection/TouchInputHandler;->mSelectionPredicate:Landroidx/recyclerview/selection/SelectionTracker$SelectionPredicate;

    invoke-virtual {v0}, Landroidx/recyclerview/selection/ItemDetailsLookup$ItemDetails;->getSelectionKey()Ljava/lang/Object;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {p1, v1, v2}, Landroidx/recyclerview/selection/SelectionTracker$SelectionPredicate;->canSetStateForKey(Ljava/lang/Object;Z)Z

    move-result p1

    if-eqz p1, :cond_5

    .line 141
    invoke-virtual {p0, v0}, Landroidx/recyclerview/selection/TouchInputHandler;->selectItem(Landroidx/recyclerview/selection/ItemDetailsLookup$ItemDetails;)Z

    move-result p1

    if-eqz p1, :cond_5

    .line 147
    iget-object p1, p0, Landroidx/recyclerview/selection/TouchInputHandler;->mSelectionPredicate:Landroidx/recyclerview/selection/SelectionTracker$SelectionPredicate;

    invoke-virtual {p1}, Landroidx/recyclerview/selection/SelectionTracker$SelectionPredicate;->canSelectMultiple()Z

    move-result p1

    if-eqz p1, :cond_4

    iget-object p1, p0, Landroidx/recyclerview/selection/TouchInputHandler;->mSelectionTracker:Landroidx/recyclerview/selection/SelectionTracker;

    invoke-virtual {p1}, Landroidx/recyclerview/selection/SelectionTracker;->isRangeActive()Z

    move-result p1

    if-eqz p1, :cond_4

    .line 148
    iget-object p1, p0, Landroidx/recyclerview/selection/TouchInputHandler;->mGestureStarter:Ljava/lang/Runnable;

    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 150
    :cond_4
    iget-object p1, p0, Landroidx/recyclerview/selection/TouchInputHandler;->mHapticPerformer:Ljava/lang/Runnable;

    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    :cond_5
    :goto_0
    return-void
.end method

.method public onSingleTapUp(Landroid/view/MotionEvent;)Z
    .locals 2

    .line 83
    iget-object v0, p0, Landroidx/recyclerview/selection/TouchInputHandler;->mDetailsLookup:Landroidx/recyclerview/selection/ItemDetailsLookup;

    invoke-virtual {v0, p1}, Landroidx/recyclerview/selection/ItemDetailsLookup;->overItemWithSelectionKey(Landroid/view/MotionEvent;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 85
    iget-object p1, p0, Landroidx/recyclerview/selection/TouchInputHandler;->mSelectionTracker:Landroidx/recyclerview/selection/SelectionTracker;

    invoke-virtual {p1}, Landroidx/recyclerview/selection/SelectionTracker;->clearSelection()Z

    return v1

    .line 89
    :cond_0
    iget-object v0, p0, Landroidx/recyclerview/selection/TouchInputHandler;->mDetailsLookup:Landroidx/recyclerview/selection/ItemDetailsLookup;

    invoke-virtual {v0, p1}, Landroidx/recyclerview/selection/ItemDetailsLookup;->getItemDetails(Landroid/view/MotionEvent;)Landroidx/recyclerview/selection/ItemDetailsLookup$ItemDetails;

    move-result-object v0

    if-nez v0, :cond_1

    return v1

    .line 95
    :cond_1
    iget-object v1, p0, Landroidx/recyclerview/selection/TouchInputHandler;->mSelectionTracker:Landroidx/recyclerview/selection/SelectionTracker;

    invoke-virtual {v1}, Landroidx/recyclerview/selection/SelectionTracker;->hasSelection()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 96
    invoke-virtual {p0, p1}, Landroidx/recyclerview/selection/TouchInputHandler;->shouldExtendRange(Landroid/view/MotionEvent;)Z

    move-result p1

    if-eqz p1, :cond_2

    .line 97
    invoke-virtual {p0, v0}, Landroidx/recyclerview/selection/TouchInputHandler;->extendSelectionRange(Landroidx/recyclerview/selection/ItemDetailsLookup$ItemDetails;)V

    goto :goto_0

    .line 98
    :cond_2
    iget-object p1, p0, Landroidx/recyclerview/selection/TouchInputHandler;->mSelectionTracker:Landroidx/recyclerview/selection/SelectionTracker;

    invoke-virtual {v0}, Landroidx/recyclerview/selection/ItemDetailsLookup$ItemDetails;->getSelectionKey()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroidx/recyclerview/selection/SelectionTracker;->isSelected(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    .line 99
    iget-object p1, p0, Landroidx/recyclerview/selection/TouchInputHandler;->mSelectionTracker:Landroidx/recyclerview/selection/SelectionTracker;

    invoke-virtual {v0}, Landroidx/recyclerview/selection/ItemDetailsLookup$ItemDetails;->getSelectionKey()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroidx/recyclerview/selection/SelectionTracker;->deselect(Ljava/lang/Object;)Z

    goto :goto_0

    .line 101
    :cond_3
    invoke-virtual {p0, v0}, Landroidx/recyclerview/selection/TouchInputHandler;->selectItem(Landroidx/recyclerview/selection/ItemDetailsLookup$ItemDetails;)Z

    :goto_0
    const/4 p1, 0x1

    return p1

    .line 109
    :cond_4
    invoke-virtual {v0, p1}, Landroidx/recyclerview/selection/ItemDetailsLookup$ItemDetails;->inSelectionHotspot(Landroid/view/MotionEvent;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 110
    invoke-virtual {p0, v0}, Landroidx/recyclerview/selection/TouchInputHandler;->selectItem(Landroidx/recyclerview/selection/ItemDetailsLookup$ItemDetails;)Z

    move-result p1

    goto :goto_1

    :cond_5
    iget-object v1, p0, Landroidx/recyclerview/selection/TouchInputHandler;->mOnItemActivatedListener:Landroidx/recyclerview/selection/OnItemActivatedListener;

    .line 111
    invoke-interface {v1, v0, p1}, Landroidx/recyclerview/selection/OnItemActivatedListener;->onItemActivated(Landroidx/recyclerview/selection/ItemDetailsLookup$ItemDetails;Landroid/view/MotionEvent;)Z

    move-result p1

    :goto_1
    return p1
.end method
