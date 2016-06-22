#!/bin/bash

set -eu
bundle install
KNAPSACK_GENERATE_REPORT=true bundle exec rake spec
