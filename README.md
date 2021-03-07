# docker-stats

Poor-man docker stats recording and gnu-plotting :-)

## Get started

* Perform stats recording:
  ```bash
  ./docker-stats.sh
  ```
  > Check the script for properties you may like overriding.
  
  > Output file will be created in the same dir.
* Once recording is complete, plot:
  ```bash
  ./plot.sh cpu <file>.csv
  ```
  > Run the script without any param, to print usage.