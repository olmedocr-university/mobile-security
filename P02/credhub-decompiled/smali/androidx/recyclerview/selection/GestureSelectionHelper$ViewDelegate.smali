.class abstract Landroidx/recyclerview/selection/GestureSelectionHelper$ViewDelegate;
.super Ljava/lang/Object;
.source "GestureSelectionHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/recyclerview/selection/GestureSelectionHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x408
    name = "ViewDelegate"
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 238
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method abstract getHeight()I
.end method

.method abstract getItemUnder(Landroid/view/MotionEvent;)I
.end method

.method abstract getLastGlidedItemPosition(Landroid/view/MotionEvent;)I
.end method
