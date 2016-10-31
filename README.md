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

## 3) Running an analysis

```shell
. setup.sh <SEMMLE_DIST>
export ENCRYPTION_PASSWORD=<password>
odasa addLatestSnapshot --project projects/<project name>
(cd target/semmle/projects/<project name>/revision*/src; . ./scripts/travis-decode.sh)
odasa buildSnapshot --project projects/<project name> --latest
```

TODO: the travis-decode.sh script produces an error that needs to be fixed...

```
[ ${TRAVIS_SECURE_ENV_VARS} == false ] && exit -1;
bash: [: ==: unary operator expected
```

TODO: check if we can run the script as a build step in the odasa project configuration instead.

## To see a particular dashboard:

Assuming that `<project name>` has been configured using `odasa bootstrap`, resulting in:
 - `./dashboards/<project name>`
 - `./projects/<project name>`
 
Then execute:

```shell
. setup.sh <SEMMLE_DIST>
odasa serve --port <port> --dashboard dashboards/<project name>
```

## Analysis Projects & Dashboards

- [projects/org.omg.oti.mof.schema](projects/org.omg.oti.mof.schema)
- [projects/org.omg.oti.uml.json.schema](projects/org.omg.oti.uml.json.schema)
- [projects/org.omg.oti.uml.core](projects/org.omg.oti.uml.core) 

- [projects/jpl.omf.schema.tables](projects/jpl.omf.schema.tables)
- [projects/gov.nasa.jpl.omf.scala.core](projects/gov.nasa.jpl.omf.scala.core)
- [projects/gov.nasa.jpl.omf.scala.binding.owlapi](projects/gov.nasa.jpl.omf.scala.binding.owlapi)

## Analysis Dependencies (due to inter-project dependencies on Maven artifacts)

- [projects/org.omg.oti.mof.schema](projects/org.omg.oti.mof.schema)

- [projects/org.omg.oti.uml.json.schema](projects/org.omg.oti.uml.json.schema)
  - [projects/org.omg.oti.uml.core](projects/org.omg.oti.uml.core)
 
- [projects/jpl.omf.schema.tables](projects/jpl.omf.schema.tables)
  - [projects/gov.nasa.jpl.omf.scala.core](projects/gov.nasa.jpl.omf.scala.core)
    - [projects/gov.nasa.jpl.omf.scala.binding.owlapi](projects/gov.nasa.jpl.omf.scala.binding.owlapi)


