# Terraform Infrastructure Modules

Implementation of https://terragrunt.gruntwork.io/docs/features/keep-your-terraform-code-dry/

* [Traefik](./traefik/README.md): [The Cloud Native Edge Router](https://containo.us/traefik/)
* [Drone](./drone/README.md): [Automate Software Testing and Delivery](https://drone.io/)
* [Swarmpit](./swarmpit/README.md): [Operate your docker infrastructure like a champ.](https://swarmpit.io)
* [Gitea](./gitea/README.md): [A painless self-hosted Git service](https://gitea.io)
* [Minio](./minio/README.md): [Open Source, S3 Compatible, Enterprise Hardened and Really, Really Fast](https://min.io/)


## Requirements
* All Swarm cluster nodes have the [glusterfs-volume-plugin](https://github.com/trajano/docker-volume-plugins/tree/master/glusterfs-volume-plugin) installed
** Modules expect glusterfs servers to be configured by the plugin
** Directories must exist on the Gluster filesystem
