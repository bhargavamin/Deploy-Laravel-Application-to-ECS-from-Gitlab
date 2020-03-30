# Setup ECS app and cluster
===================================

Deploy ECS (EC2 Backed) infrastructure.

### Pre-req

- Gitlab, Github, AWS account
- Admin access to AWS account
- VPC with 3 subnet already exist
    - Add vpc id in `ecs-cluster.yaml` and `ecs-service.yaml`
    - Add subnet id in `ecs-cluster.yaml`


### Setup infra

Upload/Deploy `infrastructure/pipeline.yaml` to Cloudformation
    - Update *Repo Owner* and *Repo Name* in `pipeline.yaml` file
    - Add Github oauth token as `github/oauth-token` to Secrets Manager in your AWS account


Note: 
- The load balancer created as a part of `ecs-cluster.yaml` is referred in `ecs-service.yaml`.
- EC2 backed ECS setup is only usefully for production-level/high load systems. If its a small application and I would recommend using FARGATE.