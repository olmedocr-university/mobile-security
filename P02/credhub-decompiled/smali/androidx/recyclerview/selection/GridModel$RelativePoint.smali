.class Landroidx/recyclerview/selection/GridModel$RelativePoint;
.super Ljava/lang/Object;
.source "GridModel.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/recyclerview/selection/GridModel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "RelativePoint"
.end annotation


# instance fields
.field final mX:Landroidx/recyclerview/selection/GridModel$RelativeCoordinate;

.field final mY:Landroidx/recyclerview/selection/GridModel$RelativeCoordinate;


# direct methods
.method constructor <init>(Landroidx/recyclerview/selection/GridModel$RelativeCoordinate;Landroidx/recyclerview/selection/GridModel$RelativeCoordinate;)V
    .locals 0

    .line 615
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 616
    iput-object p1, p0, Landroidx/recyclerview/selection/GridModel$RelativePoint;->mX:Landroidx/recyclerview/selection/GridModel$RelativeCoordinate;

    .line 617
    iput-object p2, p0, Landroidx/recyclerview/selection/GridModel$RelativePoint;->mY:Landroidx/recyclerview/selection/GridModel$RelativeCoordinate;

    return-void
.end method

.method constructor <init>(Ljava/util/List;Ljava/util/List;Landroid/graphics/Point;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/recyclerview/selection/GridModel$Limits;",
            ">;",
            "Ljava/util/List<",
            "Landroidx/recyclerview/selection/GridModel$Limits;",
            ">;",
            "Landroid/graphics/Point;",
            ")V"
        }
    .end annotation

    .line 609
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 611
    new-instance v0, Landroidx/recyclerview/selection/GridModel$RelativeCoordinate;

    iget v1, p3, Landroid/graphics/Point;->x:I

    invoke-direct {v0, p1, v1}, Landroidx/recyclerview/selection/GridModel$RelativeCoordinate;-><init>(Ljava/util/List;I)V

    iput-object v0, p0, Landroidx/recyclerview/selection/GridModel$RelativePoint;->mX:Landroidx/recyclerview/selection/GridModel$RelativeCoordinate;

    .line 612
    new-instance p1, Landroidx/recyclerview/selection/GridModel$RelativeCoordinate;

    iget p3, p3, Landroid/graphics/Point;->y:I

    invoke-direct {p1, p2, p3}, Landroidx/recyclerview/selection/GridModel$RelativeCoordinate;-><init>(Ljava/util/List;I)V

    iput-object p1, p0, Landroidx/recyclerview/selection/GridModel$RelativePoint;->mY:Landroidx/recyclerview/selection/GridModel$RelativeCoordinate;

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 3

    .line 627
    instance-of v0, p1, Landroidx/recyclerview/selection/GridModel$RelativePoint;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 631
    :cond_0
    check-cast p1, Landroidx/recyclerview/selection/GridModel$RelativePoint;

    .line 632
    iget-object v0, p0, Landroidx/recyclerview/selection/GridModel$RelativePoint;->mX:Landroidx/recyclerview/selection/GridModel$RelativeCoordinate;

    iget-object v2, p1, Landroidx/recyclerview/selection/GridModel$RelativePoint;->mX:Landroidx/recyclerview/selection/GridModel$RelativeCoordinate;

    invoke-virtual {v0, v2}, Landroidx/recyclerview/selection/GridModel$RelativeCoordinate;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Landroidx/recyclerview/selection/GridModel$RelativePoint;->mY:Landroidx/recyclerview/selection/GridModel$RelativeCoordinate;

    iget-object p1, p1, Landroidx/recyclerview/selection/GridModel$RelativePoint;->mY:Landroidx/recyclerview/selection/GridModel$RelativeCoordinate;

    invoke-virtual {v0, p1}, Landroidx/recyclerview/selection/GridModel$RelativeCoordinate;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    const/4 v1, 0x1

    :cond_1
    return v1
.end method

.method public hashCode()I
    .locals 2

    .line 622
    iget-object v0, p0, Landroidx/recyclerview/selection/GridModel$RelativePoint;->mX:Landroidx/recyclerview/selection/GridModel$RelativeCoordinate;

    invoke-virtual {v0}, Landroidx/recyclerview/selection/GridModel$RelativeCoordinate;->toComparisonValue()I

    move-result v0

    iget-object v1, p0, Landroidx/recyclerview/selection/GridModel$RelativePoint;->mY:Landroidx/recyclerview/selection/GridModel$RelativeCoordinate;

    invoke-virtual {v1}, Landroidx/recyclerview/selection/GridModel$RelativeCoordinate;->toComparisonValue()I

    move-result v1

    xor-int/2addr v0, v1

    return v0
.end method
