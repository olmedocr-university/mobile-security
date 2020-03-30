.class final Landroidx/recyclerview/selection/MotionEvents;
.super Ljava/lang/Object;
.source "MotionEvents.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static getOrigin(Landroid/view/MotionEvent;)Landroid/graphics/Point;
    .locals 2

    .line 66
    new-instance v0, Landroid/graphics/Point;

    invoke-virtual {p0}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    float-to-int v1, v1

    invoke-virtual {p0}, Landroid/view/MotionEvent;->getY()F

    move-result p0

    float-to-int p0, p0

    invoke-direct {v0, v1, p0}, Landroid/graphics/Point;-><init>(II)V

    return-object v0
.end method

.method private static hasBit(II)Z
    .locals 0

    and-int/2addr p0, p1

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method static isActionCancel(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 62
    invoke-virtual {p0}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result p0

    const/4 v0, 0x3

    if-ne p0, v0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method static isActionDown(Landroid/view/MotionEvent;)Z
    .locals 0

    .line 41
    invoke-virtual {p0}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result p0

    if-nez p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method static isActionMove(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 45
    invoke-virtual {p0}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result p0

    const/4 v0, 0x2

    if-ne p0, v0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method static isActionPointerDown(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 58
    invoke-virtual {p0}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result p0

    const/4 v0, 0x5

    if-ne p0, v0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method static isActionPointerUp(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 53
    invoke-virtual {p0}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result p0

    const/4 v0, 0x6

    if-ne p0, v0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method static isActionUp(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 49
    invoke-virtual {p0}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result p0

    const/4 v0, 0x1

    if-ne p0, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method static isAltKeyPressed(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 98
    invoke-virtual {p0}, Landroid/view/MotionEvent;->getMetaState()I

    move-result p0

    const/4 v0, 0x2

    invoke-static {p0, v0}, Landroidx/recyclerview/selection/MotionEvents;->hasBit(II)Z

    move-result p0

    return p0
.end method

.method private static isButtonPressed(Landroid/view/MotionEvent;I)Z
    .locals 1

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    .line 86
    :cond_0
    invoke-virtual {p0}, Landroid/view/MotionEvent;->getButtonState()I

    move-result p0

    and-int/2addr p0, p1

    if-ne p0, p1, :cond_1

    const/4 v0, 0x1

    :cond_1
    return v0
.end method

.method static isCtrlKeyPressed(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 94
    invoke-virtual {p0}, Landroid/view/MotionEvent;->getMetaState()I

    move-result p0

    const/16 v0, 0x1000

    invoke-static {p0, v0}, Landroidx/recyclerview/selection/MotionEvents;->hasBit(II)Z

    move-result p0

    return p0
.end method

.method static isFingerEvent(Landroid/view/MotionEvent;)Z
    .locals 2

    const/4 v0, 0x0

    .line 37
    invoke-virtual {p0, v0}, Landroid/view/MotionEvent;->getToolType(I)I

    move-result p0

    const/4 v1, 0x1

    if-ne p0, v1, :cond_0

    move v0, v1

    :cond_0
    return v0
.end method

.method static isMouseEvent(Landroid/view/MotionEvent;)Z
    .locals 2

    const/4 v0, 0x0

    .line 33
    invoke-virtual {p0, v0}, Landroid/view/MotionEvent;->getToolType(I)I

    move-result p0

    const/4 v1, 0x3

    if-ne p0, v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method static isPointerDragEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 113
    invoke-static {p0}, Landroidx/recyclerview/selection/MotionEvents;->isPrimaryMouseButtonPressed(Landroid/view/MotionEvent;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 114
    invoke-static {p0}, Landroidx/recyclerview/selection/MotionEvents;->isActionMove(Landroid/view/MotionEvent;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method static isPrimaryMouseButtonPressed(Landroid/view/MotionEvent;)Z
    .locals 1

    const/4 v0, 0x1

    .line 70
    invoke-static {p0, v0}, Landroidx/recyclerview/selection/MotionEvents;->isButtonPressed(Landroid/view/MotionEvent;I)Z

    move-result p0

    return p0
.end method

.method static isSecondaryMouseButtonPressed(Landroid/view/MotionEvent;)Z
    .locals 1

    const/4 v0, 0x2

    .line 74
    invoke-static {p0, v0}, Landroidx/recyclerview/selection/MotionEvents;->isButtonPressed(Landroid/view/MotionEvent;I)Z

    move-result p0

    return p0
.end method

.method static isShiftKeyPressed(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 90
    invoke-virtual {p0}, Landroid/view/MotionEvent;->getMetaState()I

    move-result p0

    const/4 v0, 0x1

    invoke-static {p0, v0}, Landroidx/recyclerview/selection/MotionEvents;->hasBit(II)Z

    move-result p0

    return p0
.end method

.method static isTertiaryMouseButtonPressed(Landroid/view/MotionEvent;)Z
    .locals 1

    const/4 v0, 0x4

    .line 78
    invoke-static {p0, v0}, Landroidx/recyclerview/selection/MotionEvents;->isButtonPressed(Landroid/view/MotionEvent;I)Z

    move-result p0

    return p0
.end method

.method static isTouchpadScroll(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 104
    invoke-static {p0}, Landroidx/recyclerview/selection/MotionEvents;->isMouseEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {p0}, Landroidx/recyclerview/selection/MotionEvents;->isActionMove(Landroid/view/MotionEvent;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Landroid/view/MotionEvent;->getButtonState()I

    move-result p0

    if-nez p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method
