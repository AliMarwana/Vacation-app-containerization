This project is about automating a full stack app called
 <a href="https://github.com/obusorezekiel/Dream-Vacation-App" >Dream Vacation App</a>. </br>
We have already containerized the full stack app by using Docker compose.
Now we intend to implement automation by using CI/CD(Continous Integration/Continous Deployment). 
Practically when a push or a pull request is carried out in the main and develop branches, we are going to carry out the following actions:
<ul>
<li>Make a lint check on both frontend and backend projects</li>
<li>Build images of both frontend and backend projects</li>
<li>Push them to the Docker Hub registry</li>
<li>Deploying the app on a public IP address</li>
</ul>
The first three items are part of the CI. The last one is the CD.
In other words, CI is about integrating any changes from the local environment to the cloud by making the changes accessible through images of a registry. CD is about deploying the changes from the images of the registry.<br>
What is relevant in this is that any changes is automatically visible on production. Any bugs will be detected earlier.

Practically, the automation has been managed in two files:
<ul>
<li>.github/workflows/frontend.yml</li>
<li>.github/workflows/backend.yml</li>
</ul>
In both files, we defined workflows to be run whenever a push or pull request happens. 
In frontend.yml, we made the lint check, the frontend image build and the deployment on http://68.183.124.41:8080/.
In backend.yml, we also made the link check and the backend image build. <br>
Therefore, to test the automation, you can just clone the vacation, make some changes in the interface, and do a pull request or a push. Your changes will be available on this address. You can also check http://68.183.124.41:8080/ whether you made changes or not. The IP address has been acquired from DigitalOcean.


