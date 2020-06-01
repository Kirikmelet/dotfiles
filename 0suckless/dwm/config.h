/* See LICENSE file for copyright and license details. */
#include <X11/XF86keysym.h>

/* appearance */
static const unsigned int borderpx  = 1;        /* border pixel of windows */
static const unsigned int gappx     = 1;        /* gap pixel between windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const char *fonts[]          = { "Fira Code:size=10" };
static const char dmenufont[]       = "Fira Code:size=10";
static const char col_gray1[]       = "#282828";
static const char col_gray2[]       = "#3c3836";
static const char col_gray3[]       = "#ebdbb2";
static const char col_gray4[]       = "#d5c4a1";
static const char col_cyan[]        = "#282828";
static const char *colors[][3]      = {
	/*               fg         bg         border   */
	[SchemeNorm] = { col_gray3, col_gray1, col_gray2 },
	[SchemeSel]  = { col_gray4, col_cyan,  col_cyan  },
};


static char* const autostart[][4] = { /* please replace 2 with maximum number of arguments from autostart array */
    { "st", NULL },
    {"dunst", NULL},
    {"picom", NULL},
    {"nitrogen", "--restore", NULL},
    {"exec", "/home/troyd/.config/dwm/bar.sh", NULL},
};

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance    title       tags mask     isfloating   monitor */
	{ "Gimp",     NULL,       NULL,       0,            1,           -1 },
	//{ "Firefox",  NULL,       NULL,       1 << 8,       0,           -1 },
};

/* layout(s) */
static const float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "T!",      tile },    /* first entry is default */
	{ "F!",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *chillmen[] = {"/home/troyd/.local/bin/main_menu", NULL};
static const char *dmenucmd[] = {"dmenu_run", NULL};
static const char *termcmd[]  = { "st", NULL };
static const char *termcmdtab[]  = { "tabbed", "-c", "st", "-w", NULL };
static const char *browser[] = {"firefox", NULL};
static const char *filemanager[] = {"st", "-e", "nnn", NULL};
static const char *systemmanager[] = {"st", "-e", "htop", NULL};
static const char *musicplayer[] = {"st", "-e", "ncmpcpp", NULL};
static const char *nmtui[] = {"st", "-e", "connmanctl", NULL};
static const char *audioup[] = {"amixer", "sset", "Master", "15%+", NULL};
static const char *audiodown[] = {"amixer", "sset", "Master", "15%-", NULL};
static const char *audiooff[] = {"amixer", "sset", "Master", "toggle", NULL};
static const char *lockscreen[] = {"/home/troyd/.local/bin/locker.sh", NULL};
static const char *screenup[] = {"light", "-A", "15", NULL};
static const char *screendown[] = {"light", "-U", "15", NULL};


static Key keys[] = {
	/* modifier                     key        function        argument */
	{ MODKEY,                       XK_F1,      spawn,          {.v = dmenucmd } },
	{ MODKEY,             XK_Return, spawn,          {.v = termcmd } },
	{ MODKEY|ShiftMask,             XK_Return, spawn,          {.v = termcmdtab } },
	{ MODKEY, XK_F2, spawn, {.v = browser} },
	{ MODKEY, XK_F3, spawn, {.v = filemanager} },
	{ MODKEY, XK_F4, spawn, {.v = systemmanager} },
	{ MODKEY, XK_F5, spawn, {.v = musicplayer} },
	{ MODKEY, XK_F6, spawn, {.v = nmtui} },
	{ MODKEY, XK_F10, spawn, {.v = lockscreen} },
	{ 0, XF86XK_AudioMute, spawn, {.v = audiooff} },
	{ 0, XF86XK_AudioRaiseVolume, spawn, {.v = audioup} },
	{ 0, XF86XK_AudioLowerVolume, spawn, {.v = audiodown} },
	{ 0, XF86XK_MonBrightnessUp, spawn, {.v = screenup} },
	{ 0, XF86XK_MonBrightnessDown, spawn, {.v = screendown} },
	{ MODKEY, XK_Escape, spawn, {.v = chillmen} },

	{ MODKEY,                       XK_b,      togglebar,      {0} },
	{ MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_i,      incnmaster,     {.i = +1 } },
	{ MODKEY,                       XK_d,      incnmaster,     {.i = -1 } },
	{ MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },
	{ MODKEY,                       XK_z, zoom,           {0} },
	{ MODKEY,                       XK_Tab,    view,           {0} },
	{ MODKEY,             XK_q,      killclient,     {0} },
	{ MODKEY,                       XK_t,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_f,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_m,      setlayout,      {.v = &layouts[2]} },
	{ MODKEY,                       XK_space,  setlayout,      {0} },
	{ MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },
	{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)
	{ MODKEY|ShiftMask,             XK_q,      quit,           {0} },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

