lite := 'docker run  -dti -p 8881:8080  -v "$(pwd):/usr/local/structurizr" structurizr/lite'

# start structurizr lite on port 8881
run:
	{{lite}}
	
