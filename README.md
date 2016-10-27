# Configuration for Semmle Analysis of JPL's open-source projects

## 1) Environment per [Split deployment](https://semmle.com/wiki/display/SD/Large-scale+deployments#Large-scaledeployments-Splitdeployment):

- `SEMMLE_DIST`: Semmle's distribution
- `SEMMLE_HOME`: This project's location
- `SEMMLE_LICENSE_DIR = $SEMMLE_DIST/license/license.dat`
- `SEMMLE_DATA = $SEMMLE_HOME/target/semmle`

In this project's directory, execute: `. setup.sh <SEMMLE_DIST>` 
where `<SEMMLE_DIST>` is the location of Semmle's distribution.

## 2) Configure [Scala projects](https://semmle.com/wiki/pages/viewpage.action?pageId=11048350)

Execute `odasa bootstrap` for each Scala project per the instructions.
