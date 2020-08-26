#define MOD             XCB_MOD_MASK_4
#define CURSOR_POSITION MIDDLE
#define LOOK_INTO       "WM_NAME"
#define WORKSPACES      5

static const uint16_t movements[] = {
    10,  // move step slow
    40,  // move step fast
    15,  // mouse slow
    400  // mouse fast
};

static const bool resize_by_line = true;
static const bool inverted_colors = true;
static const float resize_keep_aspect_ratio = 1.03;

static const uint8_t offsets[] = {
    0,  // offsetx
    0,  // offsety
    0,  // maxwidth
    0   // maxheight
};

static const char *colors[] = {
    "#fffff8",  // focuscol
    "#fffff8",  // unfocuscol
    "#d3e2ff",  // fixedcol
    "#ffd3d3",  // unkilcol
    "#f2ffd3",  // fixedunkilcol
    "#edede6",  // outerbordercol
    "#000000"   // emptycol
};

static const uint8_t borders[] = {
    3,  // Outer border size
    6,  // Full borderwidth
    3,  // Magnet border size
    3   // Resize border size
};

static const char *ignore_names[] = {"bar", "xclock", "Chromium", "mpv"};

static const char *term[]  = { "alacritty", NULL };
static const char *rofidrun[]  = { "rofi", "-show", "drun", NULL };
static const char *vol_up[]    = { "/home/parelkobra/scripts/vol", "+", NULL };
static const char *vol_down[]  = { "/home/parelkobra/scripts/vol", "-", NULL };
static const char *vol_toggle[]  = { "/home/parelkobra/scripts/vol", "!", NULL };
static const char *powermenu[]  = { "/home/parelkobra/scripts/powermenu", NULL };
static const char *scrotf[]  = { "/home/parelkobra/scripts/prtscr", "-f", NULL };
static const char *scrot[]  = { "/home/parelkobra/scripts/prtscr", NULL };
static const char *popup[]  = { "/home/parelkobra/scripts/popup", NULL };

static void halfandcentered(const Arg *arg)
{
    Arg arg2 = {.i=TWOBWM_MAXHALF_VERTICAL_LEFT};
    maxhalf(&arg2);
    Arg arg3 = {.i=TWOBWM_TELEPORT_CENTER};
    teleport(&arg3);
}

static void snapright(const Arg *arg)
{
    Arg arg2 = {.i=TWOBWM_MAXHALF_VERTICAL_LEFT};
    maxhalf(&arg2);
    Arg arg3 = {.i=TWOBWM_TELEPORT_BOTTOM_RIGHT};
    teleport(&arg3);
}

static void snapleft(const Arg *arg)
{
    Arg arg2 = {.i=TWOBWM_MAXHALF_VERTICAL_LEFT};
    maxhalf(&arg2);
    Arg arg3 = {.i=TWOBWM_TELEPORT_BOTTOM_LEFT};
    teleport(&arg3);
}

static void killandfocus(const Arg *arg)
{
    deletewin(arg);
    Arg arg3 = {.i=TWOBWM_FOCUS_PREVIOUS};
    focusnext(&arg3);
}

static void changeandfocus(const Arg *arg)
{
    changeworkspace(arg);
    Arg arg2 = {.i=TWOBWM_FOCUS_PREVIOUS};
    focusnext(&arg2);
}

static void sendandfocus(const Arg *arg)
{
    sendtoworkspace(arg);
    Arg arg2 = {.i=TWOBWM_FOCUS_PREVIOUS};
    focusnext(&arg2);
}

static const char *sloppy_switch_cmd[] = { "notify-send", "sloppy toggle", NULL };
static void toggle_sloppy(const Arg *arg)
{
	is_sloppy = !is_sloppy;
	if (arg->com != NULL && LENGTH(arg->com) > 0) {
		start(arg);
	}
}

#define DESKTOPCHANGE(K,N) \
{  MOD ,             K,              changeandfocus, {.i=N}}, \
{  MOD |SHIFT,       K,              sendandfocus, {.i=N}},
static key keys[] = {
    /* modifier           key            function           argument */
    // Focus to next/previous window
    {  MOD ,              XK_Tab,        focusnext,         {.i=TWOBWM_FOCUS_NEXT}},
    {  MOD |SHIFT,        XK_Tab,        focusnext,         {.i=TWOBWM_FOCUS_PREVIOUS}},

    // Kill a window
    {  MOD ,              XK_q,          killandfocus,         {}},
   
    // Resize a window
    {  MOD |SHIFT,        XK_k,          resizestep,        {.i=TWOBWM_RESIZE_UP}},
    {  MOD |SHIFT,        XK_j,          resizestep,        {.i=TWOBWM_RESIZE_DOWN}},
    {  MOD |SHIFT,        XK_l,          resizestep,        {.i=TWOBWM_RESIZE_RIGHT}},
    {  MOD |SHIFT,        XK_h,          resizestep,        {.i=TWOBWM_RESIZE_LEFT}},

    // Resize a window slower
    {  MOD |SHIFT|CONTROL,XK_k,          resizestep,        {.i=TWOBWM_RESIZE_UP_SLOW}},
    {  MOD |SHIFT|CONTROL,XK_j,          resizestep,        {.i=TWOBWM_RESIZE_DOWN_SLOW}},
    {  MOD |SHIFT|CONTROL,XK_l,          resizestep,        {.i=TWOBWM_RESIZE_RIGHT_SLOW}},
    {  MOD |SHIFT|CONTROL,XK_h,          resizestep,        {.i=TWOBWM_RESIZE_LEFT_SLOW}},
    
    // Move a window
    {  MOD ,              XK_k,          movestep,          {.i=TWOBWM_MOVE_UP}},
    {  MOD ,              XK_j,          movestep,          {.i=TWOBWM_MOVE_DOWN}},
    {  MOD ,              XK_l,          movestep,          {.i=TWOBWM_MOVE_RIGHT}},
    {  MOD ,              XK_h,          movestep,          {.i=TWOBWM_MOVE_LEFT}},
   
    // Move a window slower
    {  MOD |CONTROL,      XK_k,          movestep,          {.i=TWOBWM_MOVE_UP_SLOW}},
    {  MOD |CONTROL,      XK_j,          movestep,          {.i=TWOBWM_MOVE_DOWN_SLOW}},
    {  MOD |CONTROL,      XK_l,          movestep,          {.i=TWOBWM_MOVE_RIGHT_SLOW}},
    {  MOD |CONTROL,      XK_h,          movestep,          {.i=TWOBWM_MOVE_LEFT_SLOW}},
  
    // Teleports
    {  MOD ,              XK_g,          teleport,          {.i=TWOBWM_TELEPORT_CENTER}},
    {  MOD |SHIFT,        XK_g,          teleport,          {.i=TWOBWM_TELEPORT_CENTER_Y}},
    {  MOD |CONTROL,      XK_g,          teleport,          {.i=TWOBWM_TELEPORT_CENTER_X}},
    {  MOD ,              XK_y,          teleport,          {.i=TWOBWM_TELEPORT_TOP_LEFT}},
    {  MOD ,              XK_u,          teleport,          {.i=TWOBWM_TELEPORT_TOP_RIGHT}},
    {  MOD ,              XK_b,          teleport,          {.i=TWOBWM_TELEPORT_BOTTOM_LEFT}},
    {  MOD ,              XK_n,          teleport,          {.i=TWOBWM_TELEPORT_BOTTOM_RIGHT}},
   
    // Resize while keeping the window aspect
    {  MOD ,              XK_Home,       resizestep_aspect, {.i=TWOBWM_RESIZE_KEEP_ASPECT_GROW}},
    {  MOD ,              XK_End,        resizestep_aspect, {.i=TWOBWM_RESIZE_KEEP_ASPECT_SHRINK}},
   
    // Maximize (ignore offset and no EWMH atom)
    {  MOD ,              XK_x,          maximize,          {}},
   
    // Full screen (disregarding offsets and adding EWMH atom)
    {  MOD |SHIFT ,       XK_x,          fullscreen,        {}},
   
    // Maximize vertically
    {  MOD ,              XK_m,          maxvert_hor,       {.i=TWOBWM_MAXIMIZE_VERTICALLY}},
    
    // Maximize horizontally
    {  MOD |SHIFT,        XK_m,          maxvert_hor,       {.i=TWOBWM_MAXIMIZE_HORIZONTALLY}},
    
    // Maximize and move
    {  MOD |SHIFT,        XK_y,          maxhalf,           {.i=TWOBWM_MAXHALF_VERTICAL_LEFT}},
    {  MOD |SHIFT,        XK_u,          maxhalf,           {.i=TWOBWM_MAXHALF_VERTICAL_RIGHT}},
    {  MOD |SHIFT,        XK_b,          maxhalf,           {.i=TWOBWM_MAXHALF_HORIZONTAL_BOTTOM}},
    {  MOD |SHIFT,        XK_n,          maxhalf,           {.i=TWOBWM_MAXHALF_HORIZONTAL_TOP}},
    {  MOD |SHIFT|CONTROL,XK_y,          maxhalf,           {.i=TWOBWM_MAXHALF_FOLD_VERTICAL}},
    {  MOD |SHIFT|CONTROL,XK_b,          maxhalf,           {.i=TWOBWM_MAXHALF_FOLD_HORIZONTAL}},
    {  MOD |SHIFT|CONTROL,XK_u,          maxhalf,           {.i=TWOBWM_MAXHALF_UNFOLD_VERTICAL}},
    {  MOD |SHIFT|CONTROL,XK_n,          maxhalf,           {.i=TWOBWM_MAXHALF_UNFOLD_HORIZONTAL}},
   
    // Next/Previous screen
    {  MOD ,              XK_comma,      changescreen,      {.i=TWOBWM_NEXT_SCREEN}},
    {  MOD ,              XK_period,     changescreen,      {.i=TWOBWM_PREVIOUS_SCREEN}},
   
    // Raise or lower a window
    {  MOD ,              XK_r,          raiseorlower,      {}},
   
    // Next/Previous workspace
    {  MOD ,              XK_v,          nextworkspace,     {}},
    {  MOD ,              XK_c,          prevworkspace,     {}},
   
    // Move to Next/Previous workspace
    {  MOD |SHIFT ,       XK_v,          sendtonextworkspace,{}},
    {  MOD |SHIFT ,       XK_c,          sendtoprevworkspace,{}},
   
    // Snap window left/right
    {  MOD ,              XK_i,          snapleft,          {}},
    {  MOD ,              XK_o,          snapright,         {}},
   
    // Make the window unkillable
    {  MOD ,              XK_a,          unkillable,        {}},
   
    // Make the window appear always on top
    {  MOD,               XK_t,          always_on_top,     {}},
   
    // Make the window stay on all workspaces
    {  MOD ,              XK_f,          fix,               {}},
   
    // Move the cursor
    {  MOD ,              XK_Up,         cursor_move,       {.i=TWOBWM_CURSOR_UP_SLOW}},
    {  MOD ,              XK_Down,       cursor_move,       {.i=TWOBWM_CURSOR_DOWN_SLOW}},
    {  MOD ,              XK_Right,      cursor_move,       {.i=TWOBWM_CURSOR_RIGHT_SLOW}},
    {  MOD ,              XK_Left,       cursor_move,       {.i=TWOBWM_CURSOR_LEFT_SLOW}},
   
    // Move the cursor faster
    {  MOD |SHIFT,        XK_Up,         cursor_move,       {.i=TWOBWM_CURSOR_UP}},
    {  MOD |SHIFT,        XK_Down,       cursor_move,       {.i=TWOBWM_CURSOR_DOWN}},
    {  MOD |SHIFT,        XK_Right,      cursor_move,       {.i=TWOBWM_CURSOR_RIGHT}},
    {  MOD |SHIFT,        XK_Left,       cursor_move,       {.i=TWOBWM_CURSOR_LEFT}},
   
    // Start programs
    {  MOD ,              XK_Return,     start,             {.com = term}},
    {  MOD ,              XK_d,          start,             {.com = rofidrun}},
    {  MOD |SHIFT,        XK_q,          start,             {.com = powermenu}},
    {  MOD |SHIFT,        XK_Print,      start,             {.com = scrotf}},
    {  MOD ,              XK_Print,      start,             {.com = scrot}},
    {  MOD ,              XK_F6,         start,             {.com = vol_down}},
    {  MOD ,              XK_F7,         start,             {.com = vol_up}},
    {  MOD ,              XK_F8,         start,             {.com = vol_toggle}},
    {  MOD ,              XK_p,          start,             {.com = popup}},
   
    // Exit or restart 2bwm
    {  MOD |CONTROL,      XK_q,          twobwm_exit,       {.i=0}},
    {  MOD |CONTROL,      XK_r,          twobwm_restart,    {.i=0}},
    {  MOD ,              XK_space,      halfandcentered,   {.i=0}},
    {  MOD ,              XK_s,          toggle_sloppy,     {.com = sloppy_switch_cmd}},
   
    // Change current workspace
    DESKTOPCHANGE(XK_1, 0)
    DESKTOPCHANGE(XK_2, 1)
    DESKTOPCHANGE(XK_3, 2)
    DESKTOPCHANGE(XK_4, 3)
    DESKTOPCHANGE(XK_5, 4)
};

// the last argument makes it a root window only event
static Button buttons[] = {
    {  MOD        ,XCB_BUTTON_INDEX_1,     mousemotion,   {.i=TWOBWM_MOVE}, false},
    {  MOD        ,XCB_BUTTON_INDEX_3,     mousemotion,   {.i=TWOBWM_RESIZE}, false},
    {  MOD|SHIFT,  XCB_BUTTON_INDEX_1,     changeworkspace, {.i=0}, false},
    {  MOD|SHIFT,  XCB_BUTTON_INDEX_3,     changeworkspace, {.i=1}, false},
    {  MOD|ALT,    XCB_BUTTON_INDEX_1,     changescreen,    {.i=1}, false},
    {  MOD|ALT,    XCB_BUTTON_INDEX_3,     changescreen,    {.i=0}, false}
};
