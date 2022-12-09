" Color scheme
set background=dark
let g:solarized_termcolors=256

" Fallback to builtin colorscheme if solarized8 is not installed
try
  colorscheme solarized8_flat
catch
  try
    colorscheme solarized8
  catch
    colorscheme desert
  endtry
endtry
