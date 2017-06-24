# Microservice Modeler

`A IDE Plugin for modeling microservice architectures.`

For Eclipse Neon:
* Clone this repository into your eclipse workspace
* Install PlantUML plugin in eclipse form update-site: http://files.idi.ntnu.no/publish/plantuml/repository/
* Install Xtext and Xtend plugins in eclipse form update-site: http://download.eclipse.org/modeling/tmf/xtext/updates/composite/releases/
* Install GEF4 plugins in eclipse form update-site: http://download.eclipse.org/tools/gef/gef4/updates/releases
* Install Graphviz: sudo apt-get install graphviz
* Run generate-artifacts.launch
* Run platform-structure.launch

A new eclipse instance will be started. In this new eclipse instance:
* Create a new Java Project
* Create a *.platform file in the src folder
* Start modeling your microservices
* Have a look at the src-gen folder and e.g. copy the *.dot file into http://www.webgraphviz.com/