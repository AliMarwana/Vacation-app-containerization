This project is about containerizing a full stack app called
 <a href="https://github.com/obusorezekiel/Dream-Vacation-App" >Dream Vacation App</a>. </br>
This project consists of a Frontend React app, a backend Node.js app and a Postgres database. No that few modifications have been made in the backend app from the original because the API call path to Rest countries API has been updated. It may be that the moment you will see this project, it will be another path that will be used by Rest countries API. So take it in consideration. <br><br>
We have created a Docker container for each app and ensured the communication among them by using Docker compose.<br><br>
To do that, we needed to create Dockerfiles, Docker compose file and other files. Here is what was added for each project:<br><br>
<ul>
<li>Frontend<br>
 In the Frontend project, we created the Dockerfile. We implemented the multi stage builds to alleviate the size of the final Docker image of the front-end. <br><br>
 Therein we installed the node 16 image, set /app as the working directory, installed dependencies from package.json and copied the whole Frontend project. Then we built the project to retrieve app/build. <br><br>
 In the second stage, we installed the Nginx image.
 Nginx is in charge of serving the Frontend. To do that,
 We previously created the nginx.conf file which is inspired from the <a href="https://docs.docker.com/guides/reactjs/">
 React.js examples for Docker</a> and copied it in the image.  We copied the app/build to the /usr/share/nginx/html in the container. We then run this command nginx -c /etc/nginx/nginx.conf -g daemon off
</li>

<li>
Backend:<br>
For the Backend project, we also created the Dockerfile. Therein, we installed Node 16, installed the dependencies and run the server. 
</li>
<li>
Docker-compose.yml<br>
In that file, we put three services: frontend, backend and database.<br><br>
 As for the frontend, it will be run on the host port 8080 and container port 8080. The Dockerfile directory has been specified therein.<br><br>
 As for the backend, we put environment variables DATABASE_URL,
 PORT, COUNTRIES_API_BASE_URL in an environment file. This file is loaded in the docker compose file. It will be run on the host port 3001 and the container port 3001.<br><br>
 As for the postgres container, its base image, namely the Postgres image, has been inserted in the Docker compose file. 
 We also put  the environment variables POSTGRES_DB, 
 POSTGRES_USER and POSTGRES_PASSWORD in an .env file and put that file in the Docker compose. We also set volumes for the data<br><br>
 Note that all the services are on the same custom bridge network which is named app-network.
</li>
</ul>
Having said this, all you have do right now is to run in the root directory of the project docker-compose up --build after having run Docker Desktop on your computer. You then need to launch http://localhost:8080/ on your browser to add/remove destinations in your database.