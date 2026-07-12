run:asm () (
  set -e

  if [[ -z "$1" ]]; then
    return 1
  fi

  local file=$1
  shift 

  local filename=$(basename "$file" .asm)
  
  local asm_source="$file"
  local object_file="/dev/shm/${filename}.o"
  local elf_binary="/dev/shm/${filename}"

  trap 'rm -f "$object_file" "$elf_binary"' EXIT

  nasm -O0 -f elf64 "$asm_source" -o "$object_file"
  ld "$object_file" -o "$elf_binary"
  "$elf_binary" "$@"
)

debug:asm () (
  set -e

  if [[ -z "$1" ]]; then
    return 1
  fi

  local file=$1
  shift 

  local filename=$(basename "$file" .asm)
  
  local asm_source="$file"
  local object_file="/dev/shm/${filename}.o"
  local elf_binary="/dev/shm/${filename}"

  trap 'rm -f "$object_file" "$elf_binary"' EXIT

  nasm -O0 -f elf64 "$asm_source" -o "$object_file"
  ld "$object_file" -o "$elf_binary"

  gdb --quiet                          \
    -ex "set debuginfod enabled off"   \
    -ex "set disassembly-flavor intel" \
    -ex "break _start"                 \
    -ex "layout asm"                   \
    -ex "layout regs"                  \
    -ex "run"                          \
    --args                             \
    "$elf_binary" "$@"
)
