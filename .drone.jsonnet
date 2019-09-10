local PipelinePuslish(tag) = {
  kind: 'pipeline',
  type: 'image',
  name: 'puslish',
  steps: [
    {
      name: 'dryrun-' + tag,
      image: 'plugins/docker',
      pull: true,
      settings: {
        dry_run: true,
        repo: 'han0110/golang-testing',
        dockerfile: 'Dockerfile' + tag,
        tags: [tag],
      },
    },
    {
      name: 'publish-' + tag,
      image: 'plugins/docker',
      pull: true,
      settings: {
        repo: 'han0110/golang-testing',
        dockerfile: 'Dockerfile' + tag,
        tags: [tag],
        username: { 'from_secret': 'docker_username' },
        password: { 'from_secret': 'docker_password' },
      },
    }
  ],
};

[
  PipelinePuslish('1.12-alpine'),
]
