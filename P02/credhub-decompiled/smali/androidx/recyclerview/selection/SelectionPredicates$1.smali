.class final Landroidx/recyclerview/selection/SelectionPredicates$1;
.super Landroidx/recyclerview/selection/SelectionTracker$SelectionPredicate;
.source "SelectionPredicates.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/recyclerview/selection/SelectionPredicates;->createSelectAnything()Landroidx/recyclerview/selection/SelectionTracker$SelectionPredicate;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/recyclerview/selection/SelectionTracker$SelectionPredicate<",
        "TK;>;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 38
    invoke-direct {p0}, Landroidx/recyclerview/selection/SelectionTracker$SelectionPredicate;-><init>()V

    return-void
.end method


# virtual methods
.method public canSelectMultiple()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public canSetStateAtPosition(IZ)Z
    .locals 0

    const/4 p1, 0x1

    return p1
.end method

.method public canSetStateForKey(Ljava/lang/Object;Z)Z
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;Z)Z"
        }
    .end annotation

    const/4 p1, 0x1

    return p1
.end method
