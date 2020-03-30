.class abstract Landroidx/recyclerview/selection/BandSelectionHelper$BandHost;
.super Ljava/lang/Object;
.source "BandSelectionHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/recyclerview/selection/BandSelectionHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x408
    name = "BandHost"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 338
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method abstract addOnScrollListener(Landroidx/recyclerview/widget/RecyclerView$OnScrollListener;)V
.end method

.method abstract createGridModel()Landroidx/recyclerview/selection/GridModel;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroidx/recyclerview/selection/GridModel<",
            "TK;>;"
        }
    .end annotation
.end method

.method abstract hideBand()V
.end method

.method abstract showBand(Landroid/graphics/Rect;)V
.end method
