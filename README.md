# Deploy Laravel App to ECS
===================================

Build and deploy a Laravel sample app to AWS ECS

1. Deploy infrastructure from `infrastructure` dir
2. Build Laravel app from `laravel-app` dir
3. Push to Gitlab
4. Add variables under `settings/ci_cd` inside Gitlab repo
    - AWS_ACCESS_KEY_ID
    - AWS_DEFAULT_REGION
    - AWS_SECRET_ACCESS_KEY
5. Trigger CI/CD pipeline
