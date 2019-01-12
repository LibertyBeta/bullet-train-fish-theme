function __bt_prompt_dir -d "Show current directory"

  set -q BULLETTRAIN_DIR_SHOW; or set -g BULLETTRAIN_DIR_SHOW true
  set -q BULLETTRAIN_DIR_BG; or set -g BULLETTRAIN_DIR_BG blue
  set -q BULLETTRAIN_DIR_FG; or set -g BULLETTRAIN_DIR_FG white
  set -q BULLETTRAIN_DIR_CONTEXT_SHOW; or set -g BULLETTRAIN_DIR_CONTEXT_SHOW false
  set -q BULLETTRAIN_DIR_EXTENDED; or set -g BULLETTRAIN_DIR_EXTENDED 0
  set -q BULLETTRAIN_DIR_ARROW; or set -g BULLETTRAIN_DIR_ARROW false
  set -q BULLETTRAIN_DIR_ARROW_CHAR; or set -g BULLETTRAIN_DIR_ARROW_CHAR "  "

  test "$BULLETTRAIN_DIR_SHOW" = "true"; or return

  set -l _dir
  test "$BULLETTRAIN_DIR_CONTEXT_SHOW" = "true";
    and set -l _context (context);
      and test "$_context";
        and set _dir "$_context:"

  switch $BULLETTRAIN_DIR_EXTENDED
  case -1
    set _dir "$_dir$PWD"
  case "*"
    set -g fish_prompt_pwd_dir_length $BULLETTRAIN_DIR_EXTENDED
    set _dir "$_dir"(prompt_pwd)
  end

#   echo (string replace -a "/" "  " "$_dir")
#   echo (string replace "t" "l" "test")

  test "$BULLETTRAIN_DIR_ARROW" = "true"; and set -l _dir (string replace -a "/" "$BULLETTRAIN_DIR_ARROW_CHAR" "$_dir");

  __bt_prompt_segment $BULLETTRAIN_DIR_BG $BULLETTRAIN_DIR_FG "$_dir"
end