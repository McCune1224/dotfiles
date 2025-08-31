#!/bin/bash

if [ -f ai.env ]; then
  export $(grep -v '^#' ai.env | xargs)
fi
