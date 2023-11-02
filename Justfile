lite := 'docker run  -dti -p ' + lite_port + ':8080  -v "$(pwd):/usr/local/structurizr" structurizr/lite'
lite_port := '8881'

cli := 'docker run -it --rm -v "$(pwd):/usr/local/structurizr" structurizr/cli'
export_format := 'plantuml/structurizr'

plantuml := 'docker run -it --rm -v "$(pwd):/data" plantuml/plantuml'
plantuml_format := 'png'

diagrams_directory := 'diagrams'
images_directory := 'images'

default:
	@just --choose

# start structurizr lite on port 8881
run:
	{{lite}}

# export structurizr diagrams
export:
	{{cli}} export -w workspace.dsl -o export -f {{export_format}}

# generate diagram images using plantuml
plantuml:
	{{plantuml}} {{diagrams_directory}}/**.puml -o /data/{{images_directory}} -t{{plantuml_format}}
