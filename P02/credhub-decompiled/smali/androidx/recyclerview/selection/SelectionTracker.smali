.class public abstract Landroidx/recyclerview/selection/SelectionTracker;
.super Ljava/lang/Object;
.source "SelectionTracker.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/recyclerview/selection/SelectionTracker$Builder;,
        Landroidx/recyclerview/selection/SelectionTracker$SelectionPredicate;,
        Landroidx/recyclerview/selection/SelectionTracker$SelectionObserver;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field public static final SELECTION_CHANGED_MARKER:Ljava/lang/String; = "Selection-Changed"

.field private static final TAG:Ljava/lang/String; = "SelectionTracker"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 91
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract addObserver(Landroidx/recyclerview/selection/SelectionTracker$SelectionObserver;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/recyclerview/selection/SelectionTracker$SelectionObserver<",
            "TK;>;)V"
        }
    .end annotation
.end method

.method public abstract anchorRange(I)V
.end method

.method protected abstract clearProvisionalSelection()V
.end method

.method public abstract clearSelection()Z
.end method

.method public abstract copySelection(Landroidx/recyclerview/selection/MutableSelection;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/recyclerview/selection/MutableSelection<",
            "TK;>;)V"
        }
    .end annotation
.end method

.method public abstract deselect(Ljava/lang/Object;)Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)Z"
        }
    .end annotation
.end method

.method public abstract endRange()V
.end method

.method protected abstract extendProvisionalRange(I)V
.end method

.method public abstract extendRange(I)V
.end method

.method protected abstract getAdapterDataObserver()Landroidx/recyclerview/widget/RecyclerView$AdapterDataObserver;
.end method

.method public abstract getSelection()Landroidx/recyclerview/selection/Selection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroidx/recyclerview/selection/Selection<",
            "TK;>;"
        }
    .end annotation
.end method

.method public abstract hasSelection()Z
.end method

.method public abstract isRangeActive()Z
.end method

.method public abstract isSelected(Ljava/lang/Object;)Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)Z"
        }
    .end annotation
.end method

.method protected abstract mergeProvisionalSelection()V
.end method

.method public abstract onRestoreInstanceState(Landroid/os/Bundle;)V
.end method

.method public abstract onSaveInstanceState(Landroid/os/Bundle;)V
.end method

.method protected abstract restoreSelection(Landroidx/recyclerview/selection/Selection;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/recyclerview/selection/Selection<",
            "TK;>;)V"
        }
    .end annotation
.end method

.method public abstract select(Ljava/lang/Object;)Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)Z"
        }
    .end annotation
.end method

.method public abstract setItemsSelected(Ljava/lang/Iterable;Z)Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "TK;>;Z)Z"
        }
    .end annotation
.end method

.method protected abstract setProvisionalSelection(Ljava/util/Set;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "TK;>;)V"
        }
    .end annotation
.end method

.method public abstract startRange(I)V
.end method
