#!/bin/bash

# run Java CheckStlye linter
java -jar ~/scripts/checkstyle.jar -c ~/scripts/sun_checks.xml ./*.java
  
