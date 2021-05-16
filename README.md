# <b>Elixir API</b>

## <b>Repo description</b>

This repo builds an Elixir with Phoenix docker image ready for serving an API, once a container is deployed from the image.

Once a push to this repo is done, a [Github Action](https://github.com/seavba/elixir-api/tree/main/.github/workflows) runs for building the image and push it to AWS ECR. Action workflow is:

- When a commit is pushed to this repo, it runs a job with the following steps:

  - Checkout the Repo
  - Configure AWS credentials
  - Login to AWS ECR
  - Create ECR repo if it's missing
  - Build and push image


<br/>

#### <b>Key files</b>

<b>Dockerfile:</b> Obviously, the image created is based on the instructions of the Dockerfile. It installs the packages and dependencies for Elixir and copy the files needed for the DB configuration.

<b>Entrypoint.sh:</b> Script for creating database and inserting data, once a container is deployed.

<b>Files directory:</b> Within this directory, can be found:
  - router.ex: File where the API actions are defined
  - seeds.exs: File where some rows in the DB are inserted.

<br/>

#### <b>Repo variables</b>

No vars should be modified in this repository in order to preserve the integrity related to [IAC Repo](https://github.com/seavba/iac-api)

#### <b>Webgraphy</b>
