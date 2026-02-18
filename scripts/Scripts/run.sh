run() {
  javaf() {
    local file="${1:-$(fd -t f -e java | fzf)}" || return 1
    [ ! -f "$file" ] && echo "File not found: $file" >&2 && return 1
    print -s "java \"$file\""
    java "$file"
  }

  cppf() {
    local cpp="${1:-$(fd -t f -e cpp -e cxx -e cc -e c | fzf)}" || return 1
    [ ! -f "$cpp" ] && echo "File not found: $cpp" >&2 && return 1
    local out_dir="${cpp:h}/output"
    mkdir -p "$out_dir"
    local out="$out_dir/${cpp:t:r}"
    local cmd="g++ -std=c++17 -Wall \"$cpp\" -o \"$out\" && \"$out\""
    print -s "$cmd"
    eval "$cmd"
  }

  pyf() {
    local py="${1:-$(fd -t f -e py | fzf)}" || return 1
    [ ! -f "$py" ] && echo "File not found: $py" >&2 && return 1
    print -s "python3 \"$py\""
    python3 "$py"
  }

  jsf() {
    local js="${1:-$(fd -t f -e js | fzf)}" || return 1
    [ ! -f "$js" ] && echo "File not found: $js" >&2 && return 1
    print -s "node \"$js\""
    node "$js"
  }

  tsf() {
    local ts="${1:-$(fd -t f -e ts | fzf)}" || return 1
    [ ! -f "$ts" ] && echo "File not found: $ts" >&2 && return 1
    local out="${ts:r}.js"
    local cmd="tsc \"$ts\" && node \"$out\""
    print -s "$cmd"
    eval "$cmd"
  }

  local file="${1:-$(fd -t f -e java -e cpp -e cxx -e cc -e c -e py -e js -e ts | fzf)}" || return 1
  [ ! -f "$file" ] && echo "File not found: $file" >&2 && return 1

  case "$file" in
    *.java) javaf "$file" ;;
    *.cpp|*.cxx|*.cc|*.c) cppf "$file" ;;
    *.py) pyf "$file" ;;
    *.js) jsf "$file" ;;
    *.ts) tsf "$file" ;;
    *) echo "Unsupported file type: $file" >&2 && return 1 ;;
  esac
}
