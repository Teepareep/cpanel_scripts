#!/bin/bash
# shell script to remove all memory_limit directives from local php.ini files

find /home -type f -name php.ini -print -exec sed -i '/memory_limit.*/d' {} ';'
