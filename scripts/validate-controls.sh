#!/usr/bin/env bash
set -euo pipefail

required=(
  docs/SOURCE_OF_TRUTH.md
  ACCESSIBILITY_RULES.md
  APPROVAL_WORKFLOW.md
  ART_BIBLE.md
  00_master_control/DECISION_LOG.md
  00_master_control/PROJECT_RULES.md
  00_master_control/QUALITY_CONTROL_CHECKLIST.md
  00_master_control/RESEARCH_LOG.md
  00_master_control/RISK_REGISTER.md
  00_master_control/VERSION_CONTROL_RULES.md
  01_benny_bean_wakes_up/README.md
  01_benny_bean_wakes_up/BOOK_1_PROTOTYPE_RULES.md
  01_benny_bean_wakes_up/HSS-B01-PRE-REVIEW-PACKAGE-v0.1.md
  01_benny_bean_wakes_up/HSS-B01-READY-GATE-v0.1.md
)

for file in "${required[@]}"; do
  test -s "$file" || { echo "Missing required control file: $file" >&2; exit 1; }
done

for dir in   01_benny_bean_wakes_up   02_penny_pea_rooty_secret   03_sammy_stem_stands_tall   04_lola_leaf_catches_the_light   05_flora_flower_pollination_parade   06_freddy_fruit_holds_a_surprise   07_windy_seed_takes_a_trip   08_grandma_compost_hidden_feast
do
  test -d "$dir" || { echo "Missing story workspace: $dir" >&2; exit 1; }
done

grep -Fq 'Book 1 remains a controlled work' docs/SOURCE_OF_TRUTH.md
grep -Fq 'A book release requires' docs/SOURCE_OF_TRUTH.md

echo "Happy Seed Stories control integrity passed."
