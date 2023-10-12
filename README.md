# Keycloak 2FA SMS Authenticator

Keycloak Authentication Provider implementation to get a 2nd-factor authentication with a OTP/code/token send via SMS (through AWS SNS).

_Demo purposes only!_

Unfortunately, I don't have a real readme yet.
Blame on me!

But, for now, you can at least read my **blog post** about this autenticator here:  
https://www.n-k.de/2020/12/keycloak-2fa-sms-authentication.html

Or, just watch my **video** about this 2FA SMS SPI:

[![](http://img.youtube.com/vi/GQi19817fFk/maxresdefault.jpg)](http://www.youtube.com/watch?v=GQi19817fFk "")

[![](http://img.youtube.com/vi/FHJ5WOx1es0/maxresdefault.jpg)](http://www.youtube.com/watch?v=FHJ5WOx1es0 "")

# Buliding the docker image and getting the jar file
- Run the following command to build the docker image 
	docker build -t keycloak:v1 .
- Next, I'll run the container mounting my host current directoy to /tmp on the container 
	docker run -v $(pwd):/tmp -d my-java-app:latest  sleep infinity
- Attach to the container
	docker exec -it [container ID ] bash
- Now, you're inside the container
	cp /app/*.jar /tmp   ## now you copied the jar files to /tmp which is also mounted to the host
- exit from the container and now you have the jar files in your current directory on the host.

 
