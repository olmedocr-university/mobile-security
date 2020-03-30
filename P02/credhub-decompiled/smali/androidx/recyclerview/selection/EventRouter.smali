.class final Landroidx/recyclerview/selection/EventRouter;
.super Ljava/lang/Object;
.source "EventRouter.java"

# interfaces
.implements Landroidx/recyclerview/widget/RecyclerView$OnItemTouchListener;


# instance fields
.field private final mDelegates:Landroidx/recyclerview/selection/ToolHandlerRegistry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/recyclerview/selection/ToolHandlerRegistry<",
            "Landroidx/recyclerview/widget/RecyclerView$OnItemTouchListener;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>()V
    .locals 2

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    new-instance v0, Landroidx/recyclerview/selection/ToolHandlerRegistry;

    new-instance v1, Landroidx/recyclerview/selection/DummyOnItemTouchListener;

    invoke-direct {v1}, Landroidx/recyclerview/selection/DummyOnItemTouchListener;-><init>()V

    invoke-direct {v0, v1}, Landroidx/recyclerview/selection/ToolHandlerRegistry;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Landroidx/recyclerview/selection/EventRouter;->mDelegates:Landroidx/recyclerview/selection/ToolHandlerRegistry;

    return-void
.end method


# virtual methods
.method public onInterceptTouchEvent(Landroidx/recyclerview/widget/RecyclerView;Landroid/view/MotionEvent;)Z
    .locals 1

    .line 57
    iget-object v0, p0, Landroidx/recyclerview/selection/EventRouter;->mDelegates:Landroidx/recyclerview/selection/ToolHandlerRegistry;

    invoke-virtual {v0, p2}, Landroidx/recyclerview/selection/ToolHandlerRegistry;->get(Landroid/view/MotionEvent;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/recyclerview/widget/RecyclerView$OnItemTouchListener;

    invoke-interface {v0, p1, p2}, Landroidx/recyclerview/widget/RecyclerView$OnItemTouchListener;->onInterceptTouchEvent(Landroidx/recyclerview/widget/RecyclerView;Landroid/view/MotionEvent;)Z

    move-result p1

    return p1
.end method

.method public onRequestDisallowInterceptTouchEvent(Z)V
    .locals 0

    return-void
.end method

.method public onTouchEvent(Landroidx/recyclerview/widget/RecyclerView;Landroid/view/MotionEvent;)V
    .locals 1

    .line 62
    iget-object v0, p0, Landroidx/recyclerview/selection/EventRouter;->mDelegates:Landroidx/recyclerview/selection/ToolHandlerRegistry;

    invoke-virtual {v0, p2}, Landroidx/recyclerview/selection/ToolHandlerRegistry;->get(Landroid/view/MotionEvent;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/recyclerview/widget/RecyclerView$OnItemTouchListener;

    invoke-interface {v0, p1, p2}, Landroidx/recyclerview/widget/RecyclerView$OnItemTouchListener;->onTouchEvent(Landroidx/recyclerview/widget/RecyclerView;Landroid/view/MotionEvent;)V

    return-void
.end method

.method set(ILandroidx/recyclerview/widget/RecyclerView$OnItemTouchListener;)V
    .locals 1

    if-eqz p2, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 50
    :goto_0
    invoke-static {v0}, Landroidx/core/util/Preconditions;->checkArgument(Z)V

    .line 52
    iget-object v0, p0, Landroidx/recyclerview/selection/EventRouter;->mDelegates:Landroidx/recyclerview/selection/ToolHandlerRegistry;

    invoke-virtual {v0, p1, p2}, Landroidx/recyclerview/selection/ToolHandlerRegistry;->set(ILjava/lang/Object;)V

    return-void
.end method
