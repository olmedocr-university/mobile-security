.class public final Landroidx/recyclerview/selection/SelectionTracker$Builder;
.super Ljava/lang/Object;
.source "SelectionTracker.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/recyclerview/selection/SelectionTracker;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
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

.field private mBandOverlayId:I

.field private mBandPredicate:Landroidx/recyclerview/selection/BandPredicate;

.field private final mContext:Landroid/content/Context;

.field private mDetailsLookup:Landroidx/recyclerview/selection/ItemDetailsLookup;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/recyclerview/selection/ItemDetailsLookup<",
            "TK;>;"
        }
    .end annotation
.end field

.field private mFocusDelegate:Landroidx/recyclerview/selection/FocusDelegate;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/recyclerview/selection/FocusDelegate<",
            "TK;>;"
        }
    .end annotation
.end field

.field private mGestureToolTypes:[I

.field private mKeyProvider:Landroidx/recyclerview/selection/ItemKeyProvider;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/recyclerview/selection/ItemKeyProvider<",
            "TK;>;"
        }
    .end annotation
.end field

.field private mMonitor:Landroidx/recyclerview/selection/OperationMonitor;

.field private mOnContextClickListener:Landroidx/recyclerview/selection/OnContextClickListener;

.field private mOnDragInitiatedListener:Landroidx/recyclerview/selection/OnDragInitiatedListener;

.field private mOnItemActivatedListener:Landroidx/recyclerview/selection/OnItemActivatedListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/recyclerview/selection/OnItemActivatedListener<",
            "TK;>;"
        }
    .end annotation
.end field

.field private mPointerToolTypes:[I

.field final mRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

.field private final mSelectionId:Ljava/lang/String;

.field mSelectionPredicate:Landroidx/recyclerview/selection/SelectionTracker$SelectionPredicate;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/recyclerview/selection/SelectionTracker$SelectionPredicate<",
            "TK;>;"
        }
    .end annotation
.end field

.field private final mStorage:Landroidx/recyclerview/selection/StorageStrategy;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/recyclerview/selection/StorageStrategy<",
            "TK;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/selection/ItemKeyProvider;Landroidx/recyclerview/selection/ItemDetailsLookup;Landroidx/recyclerview/selection/StorageStrategy;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Landroidx/recyclerview/widget/RecyclerView;",
            "Landroidx/recyclerview/selection/ItemKeyProvider<",
            "TK;>;",
            "Landroidx/recyclerview/selection/ItemDetailsLookup<",
            "TK;>;",
            "Landroidx/recyclerview/selection/StorageStrategy<",
            "TK;>;)V"
        }
    .end annotation

    .line 534
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 494
    invoke-static {}, Landroidx/recyclerview/selection/SelectionPredicates;->createSelectAnything()Landroidx/recyclerview/selection/SelectionTracker$SelectionPredicate;

    move-result-object v0

    iput-object v0, p0, Landroidx/recyclerview/selection/SelectionTracker$Builder;->mSelectionPredicate:Landroidx/recyclerview/selection/SelectionTracker$SelectionPredicate;

    .line 495
    new-instance v0, Landroidx/recyclerview/selection/OperationMonitor;

    invoke-direct {v0}, Landroidx/recyclerview/selection/OperationMonitor;-><init>()V

    iput-object v0, p0, Landroidx/recyclerview/selection/SelectionTracker$Builder;->mMonitor:Landroidx/recyclerview/selection/OperationMonitor;

    .line 499
    invoke-static {}, Landroidx/recyclerview/selection/FocusDelegate;->dummy()Landroidx/recyclerview/selection/FocusDelegate;

    move-result-object v0

    iput-object v0, p0, Landroidx/recyclerview/selection/SelectionTracker$Builder;->mFocusDelegate:Landroidx/recyclerview/selection/FocusDelegate;

    .line 506
    sget v0, Landroidx/recyclerview/selection/R$drawable;->selection_band_overlay:I

    iput v0, p0, Landroidx/recyclerview/selection/SelectionTracker$Builder;->mBandOverlayId:I

    const/4 v0, 0x1

    new-array v1, v0, [I

    const/4 v2, 0x0

    aput v0, v1, v2

    .line 509
    iput-object v1, p0, Landroidx/recyclerview/selection/SelectionTracker$Builder;->mGestureToolTypes:[I

    new-array v1, v0, [I

    const/4 v3, 0x3

    aput v3, v1, v2

    .line 513
    iput-object v1, p0, Landroidx/recyclerview/selection/SelectionTracker$Builder;->mPointerToolTypes:[I

    if-eqz p1, :cond_0

    move v1, v0

    goto :goto_0

    :cond_0
    move v1, v2

    .line 536
    :goto_0
    invoke-static {v1}, Landroidx/core/util/Preconditions;->checkArgument(Z)V

    .line 537
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    xor-int/2addr v1, v0

    invoke-static {v1}, Landroidx/core/util/Preconditions;->checkArgument(Z)V

    if-eqz p2, :cond_1

    move v1, v0

    goto :goto_1

    :cond_1
    move v1, v2

    .line 538
    :goto_1
    invoke-static {v1}, Landroidx/core/util/Preconditions;->checkArgument(Z)V

    .line 540
    iput-object p1, p0, Landroidx/recyclerview/selection/SelectionTracker$Builder;->mSelectionId:Ljava/lang/String;

    .line 541
    iput-object p2, p0, Landroidx/recyclerview/selection/SelectionTracker$Builder;->mRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

    .line 542
    invoke-virtual {p2}, Landroidx/recyclerview/widget/RecyclerView;->getContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Landroidx/recyclerview/selection/SelectionTracker$Builder;->mContext:Landroid/content/Context;

    .line 543
    invoke-virtual {p2}, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;

    move-result-object p1

    iput-object p1, p0, Landroidx/recyclerview/selection/SelectionTracker$Builder;->mAdapter:Landroidx/recyclerview/widget/RecyclerView$Adapter;

    if-eqz p1, :cond_2

    move p1, v0

    goto :goto_2

    :cond_2
    move p1, v2

    .line 545
    :goto_2
    invoke-static {p1}, Landroidx/core/util/Preconditions;->checkArgument(Z)V

    if-eqz p3, :cond_3

    move p1, v0

    goto :goto_3

    :cond_3
    move p1, v2

    .line 546
    :goto_3
    invoke-static {p1}, Landroidx/core/util/Preconditions;->checkArgument(Z)V

    if-eqz p4, :cond_4

    move p1, v0

    goto :goto_4

    :cond_4
    move p1, v2

    .line 547
    :goto_4
    invoke-static {p1}, Landroidx/core/util/Preconditions;->checkArgument(Z)V

    if-eqz p5, :cond_5

    goto :goto_5

    :cond_5
    move v0, v2

    .line 548
    :goto_5
    invoke-static {v0}, Landroidx/core/util/Preconditions;->checkArgument(Z)V

    .line 550
    iput-object p4, p0, Landroidx/recyclerview/selection/SelectionTracker$Builder;->mDetailsLookup:Landroidx/recyclerview/selection/ItemDetailsLookup;

    .line 551
    iput-object p3, p0, Landroidx/recyclerview/selection/SelectionTracker$Builder;->mKeyProvider:Landroidx/recyclerview/selection/ItemKeyProvider;

    .line 552
    iput-object p5, p0, Landroidx/recyclerview/selection/SelectionTracker$Builder;->mStorage:Landroidx/recyclerview/selection/StorageStrategy;

    .line 554
    new-instance p1, Landroidx/recyclerview/selection/BandPredicate$NonDraggableArea;

    iget-object p2, p0, Landroidx/recyclerview/selection/SelectionTracker$Builder;->mRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

    invoke-direct {p1, p2, p4}, Landroidx/recyclerview/selection/BandPredicate$NonDraggableArea;-><init>(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/selection/ItemDetailsLookup;)V

    iput-object p1, p0, Landroidx/recyclerview/selection/SelectionTracker$Builder;->mBandPredicate:Landroidx/recyclerview/selection/BandPredicate;

    return-void
.end method


# virtual methods
.method public build()Landroidx/recyclerview/selection/SelectionTracker;
    .locals 21
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroidx/recyclerview/selection/SelectionTracker<",
            "TK;>;"
        }
    .end annotation

    move-object/from16 v0, p0

    .line 706
    new-instance v11, Landroidx/recyclerview/selection/DefaultSelectionTracker;

    iget-object v1, v0, Landroidx/recyclerview/selection/SelectionTracker$Builder;->mSelectionId:Ljava/lang/String;

    iget-object v2, v0, Landroidx/recyclerview/selection/SelectionTracker$Builder;->mKeyProvider:Landroidx/recyclerview/selection/ItemKeyProvider;

    iget-object v3, v0, Landroidx/recyclerview/selection/SelectionTracker$Builder;->mSelectionPredicate:Landroidx/recyclerview/selection/SelectionTracker$SelectionPredicate;

    iget-object v4, v0, Landroidx/recyclerview/selection/SelectionTracker$Builder;->mStorage:Landroidx/recyclerview/selection/StorageStrategy;

    invoke-direct {v11, v1, v2, v3, v4}, Landroidx/recyclerview/selection/DefaultSelectionTracker;-><init>(Ljava/lang/String;Landroidx/recyclerview/selection/ItemKeyProvider;Landroidx/recyclerview/selection/SelectionTracker$SelectionPredicate;Landroidx/recyclerview/selection/StorageStrategy;)V

    .line 712
    iget-object v1, v0, Landroidx/recyclerview/selection/SelectionTracker$Builder;->mAdapter:Landroidx/recyclerview/widget/RecyclerView$Adapter;

    iget-object v2, v0, Landroidx/recyclerview/selection/SelectionTracker$Builder;->mKeyProvider:Landroidx/recyclerview/selection/ItemKeyProvider;

    invoke-static {v1, v11, v2}, Landroidx/recyclerview/selection/EventBridge;->install(Landroidx/recyclerview/widget/RecyclerView$Adapter;Landroidx/recyclerview/selection/SelectionTracker;Landroidx/recyclerview/selection/ItemKeyProvider;)V

    .line 716
    new-instance v12, Landroidx/recyclerview/selection/ViewAutoScroller;

    iget-object v1, v0, Landroidx/recyclerview/selection/SelectionTracker$Builder;->mRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

    .line 717
    invoke-static {v1}, Landroidx/recyclerview/selection/ViewAutoScroller;->createScrollHost(Landroidx/recyclerview/widget/RecyclerView;)Landroidx/recyclerview/selection/ViewAutoScroller$ScrollHost;

    move-result-object v1

    invoke-direct {v12, v1}, Landroidx/recyclerview/selection/ViewAutoScroller;-><init>(Landroidx/recyclerview/selection/ViewAutoScroller$ScrollHost;)V

    .line 725
    new-instance v13, Landroidx/recyclerview/selection/GestureRouter;

    invoke-direct {v13}, Landroidx/recyclerview/selection/GestureRouter;-><init>()V

    .line 728
    new-instance v1, Landroid/view/GestureDetector;

    iget-object v2, v0, Landroidx/recyclerview/selection/SelectionTracker$Builder;->mContext:Landroid/content/Context;

    invoke-direct {v1, v2, v13}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    .line 733
    iget-object v2, v0, Landroidx/recyclerview/selection/SelectionTracker$Builder;->mSelectionPredicate:Landroidx/recyclerview/selection/SelectionTracker$SelectionPredicate;

    iget-object v3, v0, Landroidx/recyclerview/selection/SelectionTracker$Builder;->mRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v4, v0, Landroidx/recyclerview/selection/SelectionTracker$Builder;->mMonitor:Landroidx/recyclerview/selection/OperationMonitor;

    invoke-static {v11, v2, v3, v12, v4}, Landroidx/recyclerview/selection/GestureSelectionHelper;->create(Landroidx/recyclerview/selection/SelectionTracker;Landroidx/recyclerview/selection/SelectionTracker$SelectionPredicate;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/selection/AutoScroller;Landroidx/recyclerview/selection/OperationMonitor;)Landroidx/recyclerview/selection/GestureSelectionHelper;

    move-result-object v14

    .line 738
    new-instance v15, Landroidx/recyclerview/selection/EventRouter;

    invoke-direct {v15}, Landroidx/recyclerview/selection/EventRouter;-><init>()V

    .line 741
    iget-object v2, v0, Landroidx/recyclerview/selection/SelectionTracker$Builder;->mRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v2, v15}, Landroidx/recyclerview/widget/RecyclerView;->addOnItemTouchListener(Landroidx/recyclerview/widget/RecyclerView$OnItemTouchListener;)V

    .line 742
    iget-object v2, v0, Landroidx/recyclerview/selection/SelectionTracker$Builder;->mRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

    new-instance v3, Landroidx/recyclerview/selection/GestureDetectorOnItemTouchListenerAdapter;

    invoke-direct {v3, v1}, Landroidx/recyclerview/selection/GestureDetectorOnItemTouchListenerAdapter;-><init>(Landroid/view/GestureDetector;)V

    invoke-virtual {v2, v3}, Landroidx/recyclerview/widget/RecyclerView;->addOnItemTouchListener(Landroidx/recyclerview/widget/RecyclerView$OnItemTouchListener;)V

    .line 747
    new-instance v10, Landroidx/recyclerview/selection/ResetManager;

    invoke-direct {v10}, Landroidx/recyclerview/selection/ResetManager;-><init>()V

    .line 756
    invoke-virtual {v10}, Landroidx/recyclerview/selection/ResetManager;->getSelectionObserver()Landroidx/recyclerview/selection/SelectionTracker$SelectionObserver;

    move-result-object v1

    invoke-virtual {v11, v1}, Landroidx/recyclerview/selection/DefaultSelectionTracker;->addObserver(Landroidx/recyclerview/selection/SelectionTracker$SelectionObserver;)V

    .line 762
    invoke-virtual {v10}, Landroidx/recyclerview/selection/ResetManager;->getInputListener()Landroidx/recyclerview/widget/RecyclerView$OnItemTouchListener;

    move-result-object v1

    const/4 v9, 0x0

    invoke-virtual {v15, v9, v1}, Landroidx/recyclerview/selection/EventRouter;->set(ILandroidx/recyclerview/widget/RecyclerView$OnItemTouchListener;)V

    .line 764
    invoke-virtual {v10, v11}, Landroidx/recyclerview/selection/ResetManager;->addResetHandler(Landroidx/recyclerview/selection/Resettable;)V

    .line 765
    iget-object v1, v0, Landroidx/recyclerview/selection/SelectionTracker$Builder;->mMonitor:Landroidx/recyclerview/selection/OperationMonitor;

    invoke-virtual {v1}, Landroidx/recyclerview/selection/OperationMonitor;->asResettable()Landroidx/recyclerview/selection/Resettable;

    move-result-object v1

    invoke-virtual {v10, v1}, Landroidx/recyclerview/selection/ResetManager;->addResetHandler(Landroidx/recyclerview/selection/Resettable;)V

    .line 766
    invoke-virtual {v10, v14}, Landroidx/recyclerview/selection/ResetManager;->addResetHandler(Landroidx/recyclerview/selection/Resettable;)V

    .line 778
    iget-object v1, v0, Landroidx/recyclerview/selection/SelectionTracker$Builder;->mOnDragInitiatedListener:Landroidx/recyclerview/selection/OnDragInitiatedListener;

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    new-instance v1, Landroidx/recyclerview/selection/SelectionTracker$Builder$1;

    invoke-direct {v1, v0}, Landroidx/recyclerview/selection/SelectionTracker$Builder$1;-><init>(Landroidx/recyclerview/selection/SelectionTracker$Builder;)V

    :goto_0
    iput-object v1, v0, Landroidx/recyclerview/selection/SelectionTracker$Builder;->mOnDragInitiatedListener:Landroidx/recyclerview/selection/OnDragInitiatedListener;

    .line 787
    iget-object v1, v0, Landroidx/recyclerview/selection/SelectionTracker$Builder;->mOnItemActivatedListener:Landroidx/recyclerview/selection/OnItemActivatedListener;

    if-eqz v1, :cond_1

    goto :goto_1

    :cond_1
    new-instance v1, Landroidx/recyclerview/selection/SelectionTracker$Builder$2;

    invoke-direct {v1, v0}, Landroidx/recyclerview/selection/SelectionTracker$Builder$2;-><init>(Landroidx/recyclerview/selection/SelectionTracker$Builder;)V

    :goto_1
    iput-object v1, v0, Landroidx/recyclerview/selection/SelectionTracker$Builder;->mOnItemActivatedListener:Landroidx/recyclerview/selection/OnItemActivatedListener;

    .line 798
    iget-object v1, v0, Landroidx/recyclerview/selection/SelectionTracker$Builder;->mOnContextClickListener:Landroidx/recyclerview/selection/OnContextClickListener;

    if-eqz v1, :cond_2

    goto :goto_2

    :cond_2
    new-instance v1, Landroidx/recyclerview/selection/SelectionTracker$Builder$3;

    invoke-direct {v1, v0}, Landroidx/recyclerview/selection/SelectionTracker$Builder$3;-><init>(Landroidx/recyclerview/selection/SelectionTracker$Builder;)V

    :goto_2
    iput-object v1, v0, Landroidx/recyclerview/selection/SelectionTracker$Builder;->mOnContextClickListener:Landroidx/recyclerview/selection/OnContextClickListener;

    .line 809
    new-instance v8, Landroidx/recyclerview/selection/TouchInputHandler;

    iget-object v3, v0, Landroidx/recyclerview/selection/SelectionTracker$Builder;->mKeyProvider:Landroidx/recyclerview/selection/ItemKeyProvider;

    iget-object v4, v0, Landroidx/recyclerview/selection/SelectionTracker$Builder;->mDetailsLookup:Landroidx/recyclerview/selection/ItemDetailsLookup;

    iget-object v5, v0, Landroidx/recyclerview/selection/SelectionTracker$Builder;->mSelectionPredicate:Landroidx/recyclerview/selection/SelectionTracker$SelectionPredicate;

    new-instance v6, Landroidx/recyclerview/selection/SelectionTracker$Builder$4;

    invoke-direct {v6, v0, v14}, Landroidx/recyclerview/selection/SelectionTracker$Builder$4;-><init>(Landroidx/recyclerview/selection/SelectionTracker$Builder;Landroidx/recyclerview/selection/GestureSelectionHelper;)V

    iget-object v7, v0, Landroidx/recyclerview/selection/SelectionTracker$Builder;->mOnDragInitiatedListener:Landroidx/recyclerview/selection/OnDragInitiatedListener;

    iget-object v2, v0, Landroidx/recyclerview/selection/SelectionTracker$Builder;->mOnItemActivatedListener:Landroidx/recyclerview/selection/OnItemActivatedListener;

    iget-object v1, v0, Landroidx/recyclerview/selection/SelectionTracker$Builder;->mFocusDelegate:Landroidx/recyclerview/selection/FocusDelegate;

    move-object/from16 v16, v10

    new-instance v10, Landroidx/recyclerview/selection/SelectionTracker$Builder$5;

    invoke-direct {v10, v0}, Landroidx/recyclerview/selection/SelectionTracker$Builder$5;-><init>(Landroidx/recyclerview/selection/SelectionTracker$Builder;)V

    move-object/from16 v17, v1

    move-object v1, v8

    move-object/from16 v18, v2

    move-object v2, v11

    move-object/from16 v19, v12

    move-object v12, v8

    move-object/from16 v8, v18

    move-object/from16 v9, v17

    move-object/from16 v20, v16

    invoke-direct/range {v1 .. v10}, Landroidx/recyclerview/selection/TouchInputHandler;-><init>(Landroidx/recyclerview/selection/SelectionTracker;Landroidx/recyclerview/selection/ItemKeyProvider;Landroidx/recyclerview/selection/ItemDetailsLookup;Landroidx/recyclerview/selection/SelectionTracker$SelectionPredicate;Ljava/lang/Runnable;Landroidx/recyclerview/selection/OnDragInitiatedListener;Landroidx/recyclerview/selection/OnItemActivatedListener;Landroidx/recyclerview/selection/FocusDelegate;Ljava/lang/Runnable;)V

    .line 832
    iget-object v1, v0, Landroidx/recyclerview/selection/SelectionTracker$Builder;->mGestureToolTypes:[I

    array-length v2, v1

    const/4 v9, 0x0

    :goto_3
    if-ge v9, v2, :cond_3

    aget v3, v1, v9

    .line 833
    invoke-virtual {v13, v3, v12}, Landroidx/recyclerview/selection/GestureRouter;->register(ILandroid/view/GestureDetector$OnGestureListener;)V

    .line 834
    invoke-virtual {v15, v3, v14}, Landroidx/recyclerview/selection/EventRouter;->set(ILandroidx/recyclerview/widget/RecyclerView$OnItemTouchListener;)V

    add-int/lit8 v9, v9, 0x1

    goto :goto_3

    .line 839
    :cond_3
    new-instance v8, Landroidx/recyclerview/selection/MouseInputHandler;

    iget-object v3, v0, Landroidx/recyclerview/selection/SelectionTracker$Builder;->mKeyProvider:Landroidx/recyclerview/selection/ItemKeyProvider;

    iget-object v4, v0, Landroidx/recyclerview/selection/SelectionTracker$Builder;->mDetailsLookup:Landroidx/recyclerview/selection/ItemDetailsLookup;

    iget-object v5, v0, Landroidx/recyclerview/selection/SelectionTracker$Builder;->mOnContextClickListener:Landroidx/recyclerview/selection/OnContextClickListener;

    iget-object v6, v0, Landroidx/recyclerview/selection/SelectionTracker$Builder;->mOnItemActivatedListener:Landroidx/recyclerview/selection/OnItemActivatedListener;

    iget-object v7, v0, Landroidx/recyclerview/selection/SelectionTracker$Builder;->mFocusDelegate:Landroidx/recyclerview/selection/FocusDelegate;

    move-object v1, v8

    move-object v2, v11

    invoke-direct/range {v1 .. v7}, Landroidx/recyclerview/selection/MouseInputHandler;-><init>(Landroidx/recyclerview/selection/SelectionTracker;Landroidx/recyclerview/selection/ItemKeyProvider;Landroidx/recyclerview/selection/ItemDetailsLookup;Landroidx/recyclerview/selection/OnContextClickListener;Landroidx/recyclerview/selection/OnItemActivatedListener;Landroidx/recyclerview/selection/FocusDelegate;)V

    .line 847
    iget-object v1, v0, Landroidx/recyclerview/selection/SelectionTracker$Builder;->mPointerToolTypes:[I

    array-length v2, v1

    const/4 v9, 0x0

    :goto_4
    if-ge v9, v2, :cond_4

    aget v3, v1, v9

    .line 848
    invoke-virtual {v13, v3, v8}, Landroidx/recyclerview/selection/GestureRouter;->register(ILandroid/view/GestureDetector$OnGestureListener;)V

    add-int/lit8 v9, v9, 0x1

    goto :goto_4

    :cond_4
    const/4 v1, 0x0

    .line 855
    iget-object v2, v0, Landroidx/recyclerview/selection/SelectionTracker$Builder;->mKeyProvider:Landroidx/recyclerview/selection/ItemKeyProvider;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroidx/recyclerview/selection/ItemKeyProvider;->hasAccess(I)Z

    move-result v2

    if-eqz v2, :cond_5

    iget-object v2, v0, Landroidx/recyclerview/selection/SelectionTracker$Builder;->mSelectionPredicate:Landroidx/recyclerview/selection/SelectionTracker$SelectionPredicate;

    .line 856
    invoke-virtual {v2}, Landroidx/recyclerview/selection/SelectionTracker$SelectionPredicate;->canSelectMultiple()Z

    move-result v2

    if-eqz v2, :cond_5

    .line 862
    iget-object v1, v0, Landroidx/recyclerview/selection/SelectionTracker$Builder;->mRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

    iget v3, v0, Landroidx/recyclerview/selection/SelectionTracker$Builder;->mBandOverlayId:I

    iget-object v4, v0, Landroidx/recyclerview/selection/SelectionTracker$Builder;->mKeyProvider:Landroidx/recyclerview/selection/ItemKeyProvider;

    iget-object v6, v0, Landroidx/recyclerview/selection/SelectionTracker$Builder;->mSelectionPredicate:Landroidx/recyclerview/selection/SelectionTracker$SelectionPredicate;

    iget-object v7, v0, Landroidx/recyclerview/selection/SelectionTracker$Builder;->mBandPredicate:Landroidx/recyclerview/selection/BandPredicate;

    iget-object v8, v0, Landroidx/recyclerview/selection/SelectionTracker$Builder;->mFocusDelegate:Landroidx/recyclerview/selection/FocusDelegate;

    iget-object v9, v0, Landroidx/recyclerview/selection/SelectionTracker$Builder;->mMonitor:Landroidx/recyclerview/selection/OperationMonitor;

    move-object/from16 v2, v19

    move-object v5, v11

    invoke-static/range {v1 .. v9}, Landroidx/recyclerview/selection/BandSelectionHelper;->create(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/selection/AutoScroller;ILandroidx/recyclerview/selection/ItemKeyProvider;Landroidx/recyclerview/selection/SelectionTracker;Landroidx/recyclerview/selection/SelectionTracker$SelectionPredicate;Landroidx/recyclerview/selection/BandPredicate;Landroidx/recyclerview/selection/FocusDelegate;Landroidx/recyclerview/selection/OperationMonitor;)Landroidx/recyclerview/selection/BandSelectionHelper;

    move-result-object v1

    move-object/from16 v2, v20

    .line 873
    invoke-virtual {v2, v1}, Landroidx/recyclerview/selection/ResetManager;->addResetHandler(Landroidx/recyclerview/selection/Resettable;)V

    .line 876
    :cond_5
    new-instance v2, Landroidx/recyclerview/selection/PointerDragEventInterceptor;

    iget-object v3, v0, Landroidx/recyclerview/selection/SelectionTracker$Builder;->mDetailsLookup:Landroidx/recyclerview/selection/ItemDetailsLookup;

    iget-object v4, v0, Landroidx/recyclerview/selection/SelectionTracker$Builder;->mOnDragInitiatedListener:Landroidx/recyclerview/selection/OnDragInitiatedListener;

    invoke-direct {v2, v3, v4, v1}, Landroidx/recyclerview/selection/PointerDragEventInterceptor;-><init>(Landroidx/recyclerview/selection/ItemDetailsLookup;Landroidx/recyclerview/selection/OnDragInitiatedListener;Landroidx/recyclerview/widget/RecyclerView$OnItemTouchListener;)V

    const/4 v1, 0x3

    .line 879
    invoke-virtual {v15, v1, v2}, Landroidx/recyclerview/selection/EventRouter;->set(ILandroidx/recyclerview/widget/RecyclerView$OnItemTouchListener;)V

    return-object v11
.end method

.method public withBandOverlay(I)Landroidx/recyclerview/selection/SelectionTracker$Builder;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Landroidx/recyclerview/selection/SelectionTracker$Builder<",
            "TK;>;"
        }
    .end annotation

    .line 666
    iput p1, p0, Landroidx/recyclerview/selection/SelectionTracker$Builder;->mBandOverlayId:I

    return-object p0
.end method

.method public withBandPredicate(Landroidx/recyclerview/selection/BandPredicate;)Landroidx/recyclerview/selection/SelectionTracker$Builder;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/recyclerview/selection/BandPredicate;",
            ")",
            "Landroidx/recyclerview/selection/SelectionTracker$Builder<",
            "TK;>;"
        }
    .end annotation

    .line 676
    iput-object p1, p0, Landroidx/recyclerview/selection/SelectionTracker$Builder;->mBandPredicate:Landroidx/recyclerview/selection/BandPredicate;

    return-object p0
.end method

.method public withFocusDelegate(Landroidx/recyclerview/selection/FocusDelegate;)Landroidx/recyclerview/selection/SelectionTracker$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/recyclerview/selection/FocusDelegate<",
            "TK;>;)",
            "Landroidx/recyclerview/selection/SelectionTracker$Builder<",
            "TK;>;"
        }
    .end annotation

    if-eqz p1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 593
    :goto_0
    invoke-static {v0}, Landroidx/core/util/Preconditions;->checkArgument(Z)V

    .line 594
    iput-object p1, p0, Landroidx/recyclerview/selection/SelectionTracker$Builder;->mFocusDelegate:Landroidx/recyclerview/selection/FocusDelegate;

    return-object p0
.end method

.method public varargs withGestureTooltypes([I)Landroidx/recyclerview/selection/SelectionTracker$Builder;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([I)",
            "Landroidx/recyclerview/selection/SelectionTracker$Builder<",
            "TK;>;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const-string v0, "SelectionTracker"

    const-string v1, "Setting gestureTooltypes is likely to result in unexpected behavior."

    .line 655
    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 656
    iput-object p1, p0, Landroidx/recyclerview/selection/SelectionTracker$Builder;->mGestureToolTypes:[I

    return-object p0
.end method

.method public withOnContextClickListener(Landroidx/recyclerview/selection/OnContextClickListener;)Landroidx/recyclerview/selection/SelectionTracker$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/recyclerview/selection/OnContextClickListener;",
            ")",
            "Landroidx/recyclerview/selection/SelectionTracker$Builder<",
            "TK;>;"
        }
    .end annotation

    if-eqz p1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 622
    :goto_0
    invoke-static {v0}, Landroidx/core/util/Preconditions;->checkArgument(Z)V

    .line 624
    iput-object p1, p0, Landroidx/recyclerview/selection/SelectionTracker$Builder;->mOnContextClickListener:Landroidx/recyclerview/selection/OnContextClickListener;

    return-object p0
.end method

.method public withOnDragInitiatedListener(Landroidx/recyclerview/selection/OnDragInitiatedListener;)Landroidx/recyclerview/selection/SelectionTracker$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/recyclerview/selection/OnDragInitiatedListener;",
            ")",
            "Landroidx/recyclerview/selection/SelectionTracker$Builder<",
            "TK;>;"
        }
    .end annotation

    if-eqz p1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 637
    :goto_0
    invoke-static {v0}, Landroidx/core/util/Preconditions;->checkArgument(Z)V

    .line 639
    iput-object p1, p0, Landroidx/recyclerview/selection/SelectionTracker$Builder;->mOnDragInitiatedListener:Landroidx/recyclerview/selection/OnDragInitiatedListener;

    return-object p0
.end method

.method public withOnItemActivatedListener(Landroidx/recyclerview/selection/OnItemActivatedListener;)Landroidx/recyclerview/selection/SelectionTracker$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/recyclerview/selection/OnItemActivatedListener<",
            "TK;>;)",
            "Landroidx/recyclerview/selection/SelectionTracker$Builder<",
            "TK;>;"
        }
    .end annotation

    if-eqz p1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 607
    :goto_0
    invoke-static {v0}, Landroidx/core/util/Preconditions;->checkArgument(Z)V

    .line 609
    iput-object p1, p0, Landroidx/recyclerview/selection/SelectionTracker$Builder;->mOnItemActivatedListener:Landroidx/recyclerview/selection/OnItemActivatedListener;

    return-object p0
.end method

.method public withOperationMonitor(Landroidx/recyclerview/selection/OperationMonitor;)Landroidx/recyclerview/selection/SelectionTracker$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/recyclerview/selection/OperationMonitor;",
            ")",
            "Landroidx/recyclerview/selection/SelectionTracker$Builder<",
            "TK;>;"
        }
    .end annotation

    if-eqz p1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 581
    :goto_0
    invoke-static {v0}, Landroidx/core/util/Preconditions;->checkArgument(Z)V

    .line 582
    iput-object p1, p0, Landroidx/recyclerview/selection/SelectionTracker$Builder;->mMonitor:Landroidx/recyclerview/selection/OperationMonitor;

    return-object p0
.end method

.method public varargs withPointerTooltypes([I)Landroidx/recyclerview/selection/SelectionTracker$Builder;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([I)",
            "Landroidx/recyclerview/selection/SelectionTracker$Builder<",
            "TK;>;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const-string v0, "SelectionTracker"

    const-string v1, "Setting pointerTooltypes is likely to result in unexpected behavior."

    .line 694
    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 695
    iput-object p1, p0, Landroidx/recyclerview/selection/SelectionTracker$Builder;->mPointerToolTypes:[I

    return-object p0
.end method

.method public withSelectionPredicate(Landroidx/recyclerview/selection/SelectionTracker$SelectionPredicate;)Landroidx/recyclerview/selection/SelectionTracker$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/recyclerview/selection/SelectionTracker$SelectionPredicate<",
            "TK;>;)",
            "Landroidx/recyclerview/selection/SelectionTracker$Builder<",
            "TK;>;"
        }
    .end annotation

    if-eqz p1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 566
    :goto_0
    invoke-static {v0}, Landroidx/core/util/Preconditions;->checkArgument(Z)V

    .line 567
    iput-object p1, p0, Landroidx/recyclerview/selection/SelectionTracker$Builder;->mSelectionPredicate:Landroidx/recyclerview/selection/SelectionTracker$SelectionPredicate;

    return-object p0
.end method
