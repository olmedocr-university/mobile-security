.class Landroidx/recyclerview/selection/SelectionTracker$Builder$4;
.super Ljava/lang/Object;
.source "SelectionTracker.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/recyclerview/selection/SelectionTracker$Builder;->build()Landroidx/recyclerview/selection/SelectionTracker;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/recyclerview/selection/SelectionTracker$Builder;

.field final synthetic val$gestureHelper:Landroidx/recyclerview/selection/GestureSelectionHelper;


# direct methods
.method constructor <init>(Landroidx/recyclerview/selection/SelectionTracker$Builder;Landroidx/recyclerview/selection/GestureSelectionHelper;)V
    .locals 0

    .line 814
    iput-object p1, p0, Landroidx/recyclerview/selection/SelectionTracker$Builder$4;->this$0:Landroidx/recyclerview/selection/SelectionTracker$Builder;

    iput-object p2, p0, Landroidx/recyclerview/selection/SelectionTracker$Builder$4;->val$gestureHelper:Landroidx/recyclerview/selection/GestureSelectionHelper;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 817
    iget-object v0, p0, Landroidx/recyclerview/selection/SelectionTracker$Builder$4;->this$0:Landroidx/recyclerview/selection/SelectionTracker$Builder;

    iget-object v0, v0, Landroidx/recyclerview/selection/SelectionTracker$Builder;->mSelectionPredicate:Landroidx/recyclerview/selection/SelectionTracker$SelectionPredicate;

    invoke-virtual {v0}, Landroidx/recyclerview/selection/SelectionTracker$SelectionPredicate;->canSelectMultiple()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 818
    iget-object v0, p0, Landroidx/recyclerview/selection/SelectionTracker$Builder$4;->val$gestureHelper:Landroidx/recyclerview/selection/GestureSelectionHelper;

    invoke-virtual {v0}, Landroidx/recyclerview/selection/GestureSelectionHelper;->start()V

    :cond_0
    return-void
.end method
