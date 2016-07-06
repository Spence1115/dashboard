Pa11y Dashboard Docker Container
================================
This is an instance of the [pa11y-dashboard](https://github.com/pa11y/dashboard) running within a Docker instance for easy deployment, designed to run against a MongoDB instance running within another Docker container.

Pa11y Dashboard is a web interface to the [Pa11y][pa11y] accessibility reporter; allowing you to focus on *fixing* issues rather than hunting them down.


![dashboard](https://f.cloud.github.com/assets/1225142/1549567/f0361e72-4de8-11e3-8d14-3fe6900cc15d.jpg)
![results-page](https://f.cloud.github.com/assets/1225142/1549568/f225aa54-4de8-11e3-8b25-ef2f405997a3.jpg)


### Requirements
- Docker

### Setup
1. Launch a Docker container of MongoDB, and give it a name.
```
$ docker run --name mongodb -d mongo
```
2. Build a container from the pa11y Dockerfile
```
$ docker build -t pa11y-docker .
```
3. Launch a Docker container of pa11y dashboard, linking it to the MongoDB instance you launched earlier, mapping port 4000, and specifying an environment from 'production', 'development' and test'. These are purely different databases and have no functional difference.
```
$ docker run -it --link mongodb:mongo -p 4000:4000 -e "NODE_ENV=production" pa11y-docker
```
4. Access the dashboard by navigating to http://docker:4000

Note: If you shut down the MongoDB container, all the information you have gathered will be lost. If you would rather point to a fixed installation of MongoDB, change the 'database' address in one of the /config json files and rebuild the pa11y-docker container.

License
-------

Pa11y Dashboard is licensed under the [GNU General Public License 3.0][info-license].  
Copyright &copy; 2013–2016, Springer Nature



[gpl]: http://www.gnu.org/licenses/gpl-3.0.html
[mongo]: http://www.mongodb.org/
[mongo-install]: https://docs.mongodb.org/manual/installation/
[node]: http://nodejs.org/
[pa11y]: https://github.com/pa11y/pa11y
[pa11y-webservice-config]: https://github.com/pa11y/webservice#configurations
[phantom]: http://phantomjs.org/
[resource-una-k]: https://una.im/pa11y-dash/
[sidekick-proposal]: https://github.com/pa11y/sidekick/blob/master/PROPOSAL.md
[travis]: https://travis-ci.org/pa11y/dashboard
[travis-img]: https://travis-ci.org/pa11y/dashboard.png?branch=master

[info-license]: LICENSE
[info-node]: package.json
[info-build]: https://travis-ci.org/pa11y/dashboard
[shield-license]: https://img.shields.io/badge/license-GPL%203.0-blue.svg
[shield-node]: https://img.shields.io/badge/node.js%20support-4–6-brightgreen.svg
[shield-version]: https://img.shields.io/badge/version-2.0.0-blue.svg
[shield-build]: https://img.shields.io/travis/pa11y/dashboard/master.svg
