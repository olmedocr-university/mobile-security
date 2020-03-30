.class Landroidx/recyclerview/selection/StorageStrategy$LongStorageStrategy;
.super Landroidx/recyclerview/selection/StorageStrategy;
.source "StorageStrategy.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/recyclerview/selection/StorageStrategy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "LongStorageStrategy"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/recyclerview/selection/StorageStrategy<",
        "Ljava/lang/Long;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 1

    .line 151
    const-class v0, Ljava/lang/Long;

    invoke-direct {p0, v0}, Landroidx/recyclerview/selection/StorageStrategy;-><init>(Ljava/lang/Class;)V

    return-void
.end method


# virtual methods
.method public asBundle(Landroidx/recyclerview/selection/Selection;)Landroid/os/Bundle;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/recyclerview/selection/Selection<",
            "Ljava/lang/Long;",
            ">;)",
            "Landroid/os/Bundle;"
        }
    .end annotation

    .line 176
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 177
    invoke-virtual {p0}, Landroidx/recyclerview/selection/StorageStrategy$LongStorageStrategy;->getKeyTypeName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "androidx.recyclerview.selection.type"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 179
    invoke-virtual {p1}, Landroidx/recyclerview/selection/Selection;->size()I

    move-result v1

    new-array v1, v1, [J

    .line 181
    invoke-virtual {p1}, Landroidx/recyclerview/selection/Selection;->iterator()Ljava/util/Iterator;

    move-result-object p1

    const/4 v2, 0x0

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Long;

    add-int/lit8 v4, v2, 0x1

    .line 182
    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v5

    aput-wide v5, v1, v2

    move v2, v4

    goto :goto_0

    :cond_0
    const-string p1, "androidx.recyclerview.selection.entries"

    .line 184
    invoke-virtual {v0, p1, v1}, Landroid/os/Bundle;->putLongArray(Ljava/lang/String;[J)V

    return-object v0
.end method

.method public asSelection(Landroid/os/Bundle;)Landroidx/recyclerview/selection/Selection;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/os/Bundle;",
            ")",
            "Landroidx/recyclerview/selection/Selection<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    const/4 v0, 0x0

    const-string v1, "androidx.recyclerview.selection.type"

    .line 156
    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 157
    invoke-virtual {p0}, Landroidx/recyclerview/selection/StorageStrategy$LongStorageStrategy;->getKeyTypeName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_1

    :cond_0
    const-string v1, "androidx.recyclerview.selection.entries"

    .line 161
    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getLongArray(Ljava/lang/String;)[J

    move-result-object p1

    if-nez p1, :cond_1

    return-object v0

    .line 166
    :cond_1
    new-instance v0, Landroidx/recyclerview/selection/Selection;

    invoke-direct {v0}, Landroidx/recyclerview/selection/Selection;-><init>()V

    .line 167
    array-length v1, p1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_2

    aget-wide v3, p1, v2

    .line 168
    iget-object v5, v0, Landroidx/recyclerview/selection/Selection;->mSelection:Ljava/util/Set;

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-interface {v5, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    :goto_1
    return-object v0
.end method
