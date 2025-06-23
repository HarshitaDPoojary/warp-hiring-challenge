#!/bin/bash

awk  -F '[[:space:]]*\\|[[:space:]]*' '
  $0 !~ /^#/ && tolower($3) == "mars" && tolower($4) == "completed" && NF == 8 {
    if (int($6) > max) {
      max = int($6)
      code = $8
    }
  }
  END { print code }
' space_missions.log