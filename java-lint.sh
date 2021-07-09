#!/bin/bash

# run Java CheckStlye linter
java -jar ~/scripts/checkstyle.jar -c ~/scripts/google_checks.xml ./*.java
  
