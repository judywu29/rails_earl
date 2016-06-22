#!/bin/bash

set -eu

KNAPSACK_TEST_DIR=spec KNAPSACK_TEST_FILE_PATTERN="{spec}/**{,/*/**}/*_spec.rb" bundle exec rake knapsack:rspec
