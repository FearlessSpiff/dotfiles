#ifndef config_h_INCLUDED
#define config_h_INCLUDED

#define DEFAULT_FONT "Sans 18"
#define DEFAULT_ROUNDING 5
static const int transparency = 255;

struct clr_scheme schemes[] = {
{
  /* colors */
  .bg = {.bgra = {54, 42, 40, transparency}},
  .fg = {.bgra = {90, 71, 68, transparency}},
  .high = {.bgra = {164, 114, 98, transparency}},
  .swipe = {.bgra = {123, 250, 80, 64}},
  .text = {.color = 0xFFF8F8F2},
  .text_press = {.color = 0xFFBD93F9},
  .text_swipe = {.color = 0xFF50FA7B},
  .font = DEFAULT_FONT,
  .rounding = DEFAULT_ROUNDING,
},
{
  /* colors */
  .bg = {.bgra = {54, 42, 40, transparency}},
  .fg = {.bgra = {75, 58, 55, transparency}},
  .high = {.bgra = {164, 114, 98, transparency}},
  .swipe = {.bgra = {123, 250, 80, 64}},
  .text_press = {.color = 0xFFBD93F9},
  .text_swipe = {.color = 0xFF50FA7B},
  .text = {.color = 0xFFF8F8F2},
  .font = DEFAULT_FONT,
  .rounding = DEFAULT_ROUNDING,
}
};

/* layers is an ordered list of layouts, used to cycle through */
static enum layout_id layers[] = {
  Full, // First layout is the default layout on startup
  Special,
  NumLayouts // signals the last item, may not be omitted
};

/* layers is an ordered list of layouts, used to cycle through */
static enum layout_id landscape_layers[] = {
  Full, // First layout is the default layout on startup
  Special,
  NumLayouts // signals the last item, may not be omitted
};

#endif // config_h_INCLUDED
