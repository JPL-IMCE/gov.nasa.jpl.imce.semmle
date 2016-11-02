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
export $SEMMLE_CREDENTIALS=<user>:<password>
./ci.sh <project name>
```

## To see a particular dashboard:

Assuming that `<project name>` has been configured using `odasa bootstrap`, resulting in:
 - `./dashboards/<project name>`
 - `./projects/<project name>`
 
Then execute:

```shell
. setup.sh <SEMMLE_DIST>
odasa serve --port <port> --dashboard dashboards/<project name>
```

## 20 Analysis Projects & Dashboards

- [projects/org.omg.oti.mof.schema](projects/org.omg.oti.mof.schema)
- [projects/org.omg.oti.uml.json.schema](projects/org.omg.oti.uml.json.schema)
- [projects/org.omg.oti.uml.json.serialization](projects/org.omg.oti.uml.json.serialization)
- [projects/org.omg.oti.uml.core](projects/org.omg.oti.uml.core) 
- [projects/org.omg.oti.uml.change_migration](projects/org.omg.oti.uml.change_migration)
- [projects/org.omg.uml.composite_structure_tree_analysis](projects/org.omg.uml.composite_structure_tree_analysis)
- [projects/org.omg.uml.canonical_xmi.serialization](projects/org.omg.uml.canonical_xmi.serialization)
- [projects/org.omg.uml.canonical_xmi.loader](projects/org.omg.uml.canonical_xmi.loader)
- [projects/org.omg.uml.magicdraw.adapter](projects/org.omg.uml.magicdraw.adapter)

- [projects/imce.dynamic_scripts.generic_dsl](projects/imce.dynamic_scripts.generic_dsl)
- [projects/imce.magicdraw.library.enhanced_api](projects/imce.magicdraw.library.enhanced_api)
- [projects/imce.dynamic_scripts.magicdraw.plugin](projects/imce.dynamic_scripts.magicdraw.plugin)
- [projects/imce.oti.uml.magicdraw.dynamicscripts](projects/imce.oti.uml.magicdraw.dynamicscripts)
- [projects/imce.oti.mof.magicdraw.dynamicscripts](projects/imce.oti.mof.magicdraw.dynamicscripts)
- [projects/imce.magicdraw.dynamicscripts.batch](projects/imce.magicdraw.dynamicscripts.batch)

- [projects/jpl.omf.schema.tables](projects/jpl.omf.schema.tables)
- [projects/gov.nasa.jpl.omf.scala.core](projects/gov.nasa.jpl.omf.scala.core)
- [projects/gov.nasa.jpl.omf.scala.binding.owlapi](projects/gov.nasa.jpl.omf.scala.binding.owlapi)
- [projects/gov.nasa.jpl.omf.scala.mapping.oti](projects/gov.nasa.jpl.omf.scala.mapping.oti)
- [projects/gov.nasa.jpl.omf.scala.magicdraw.exporter](projects/gov.nasa.jpl.omf.scala.magicdraw.exporter)

## Analysis Dependencies (due to inter-project dependencies on Maven artifacts)

- [projects/org.omg.oti.mof.schema](projects/org.omg.oti.mof.schema)
  - [projects/imce.oti.mof.magicdraw.dynamicscripts](projects/imce.oti.mof.magicdraw.dynamicscripts)
    - [projects/imce.magicdraw.dynamicscripts.batch](projects/imce.magicdraw.dynamicscripts.batch)

- [projects/org.omg.oti.uml.json.schema](projects/org.omg.oti.uml.json.schema)
  - [projects/org.omg.oti.uml.json.serialization](projects/org.omg.oti.uml.json.serialization)
    - [projects/org.omg.uml.magicdraw.adapter](projects/org.omg.uml.magicdraw.adapter)
  - [projects/org.omg.oti.uml.core](projects/org.omg.oti.uml.core)
    - [projects/org.omg.oti.uml.change_migration](projects/org.omg.oti.uml.change_migration)
    - [projects/org.omg.uml.composite_structure_tree_analysis](projects/org.omg.uml.composite_structure_tree_analysis)
      - [projects/org.omg.uml.magicdraw.adapter](projects/org.omg.uml.magicdraw.adapter)
      - [projects/gov.nasa.jpl.omf.scala.mapping.oti](projects/gov.nasa.jpl.omf.scala.mapping.oti)
    - [projects/org.omg.uml.canonical_xmi.serialization](projects/org.omg.uml.canonical_xmi.serialization)
      - [projects/org.omg.uml.canonical_xmi.loader](projects/org.omg.uml.canonical_xmi.loader)
        - [projects/org.omg.uml.magicdraw.adapter](projects/org.omg.uml.magicdraw.adapter)
      - [projects/gov.nasa.jpl.omf.scala.mapping.oti](projects/gov.nasa.jpl.omf.scala.mapping.oti)
 
- [projects/imce.dynamic_scripts.generic_dsl](projects/imce.dynamic_scripts.generic_dsl)
  - [projects/imce.dynamic_scripts.magicdraw.plugin](projects/imce.dynamic_scripts.magicdraw.plugin)
- [projects/imce.magicdraw.library.enhanced_api](projects/imce.magicdraw.library.enhanced_api)
  - [projects/imce.dynamic_scripts.magicdraw.plugin](projects/imce.dynamic_scripts.magicdraw.plugin)
    - [projects/org.omg.uml.magicdraw.adapter](projects/org.omg.uml.magicdraw.adapter)

- [projects/jpl.omf.schema.tables](projects/jpl.omf.schema.tables)
  - [projects/gov.nasa.jpl.omf.scala.core](projects/gov.nasa.jpl.omf.scala.core)
    - [projects/gov.nasa.jpl.omf.scala.binding.owlapi](projects/gov.nasa.jpl.omf.scala.binding.owlapi)
    - [projects/gov.nasa.jpl.omf.scala.mapping.oti](projects/gov.nasa.jpl.omf.scala.mapping.oti)

- [projects/org.omg.uml.magicdraw.adapter](projects/org.omg.uml.magicdraw.adapter)
  - [projects/imce.oti.uml.magicdraw.dynamicscripts](projects/imce.oti.uml.magicdraw.dynamicscripts)
    - [projects/imce.oti.mof.magicdraw.dynamicscripts](projects/imce.oti.mof.magicdraw.dynamicscripts)

- [projects/gov.nasa.jpl.omf.scala.mapping.oti](projects/gov.nasa.jpl.omf.scala.mapping.oti)
  - [projects/gov.nasa.jpl.omf.scala.magicdraw.exporter](projects/gov.nasa.jpl.omf.scala.magicdraw.exporter)
  
- [projects/imce.magicdraw.dynamicscripts.batch](projects/imce.magicdraw.dynamicscripts.batch)
  - [projects/gov.nasa.jpl.omf.scala.magicdraw.exporter](projects/gov.nasa.jpl.omf.scala.magicdraw.exporter)
  
- [projects/gov.nasa.jpl.omf.scala.binding.owlapi](projects/gov.nasa.jpl.omf.scala.binding.owlapi)
  - [projects/gov.nasa.jpl.omf.scala.magicdraw.exporter](projects/gov.nasa.jpl.omf.scala.magicdraw.exporter)