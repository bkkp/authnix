# authnix
`authnix.sh` is script that setup netrc file for nix. This allows you to use private/internal github repos as sources for nix. 

## Use
To use this script you need a [GitHub personal access token](https://docs.github.com/en/github/authenticating-to-github/creating-a-personal-access-token) with access to the repos you want
to use. 

Then you run then following command in you terminal:
```
bash <(curl -sL https://raw.githubusercontent.com/bkkp/authnix/main/authnix.sh) <your-github-token>
```
where you subsitue `<your-github-token>` with your GitHub token. If nix's netrc file is protected you will be ask for sudo password.

## In Github Action
To use is in Github Actions you can use the following step:
```
- name: Setup nix netrc file with authnix
  run: bash <(curl -sL https://raw.githubusercontent.com/bkkp/authnix/main/authnix.sh)
  env:
    GITHUB_TOKEN: ${{ secrets.PAT_GITHUB }}
```
where is a sercret in your repo with your github access token.

### Alternativ
1. Set GITHUB_TOKEN as env.
```
export GITHUB_TOKEN=<your-github-token>
bash <(curl -sL https://raw.githubusercontent.com/bkkp/authnix/main/authnix.sh) <your-github-token>
```

2. Temp variable
```
GITHUB_TOKEN=<your-github-token> bash <(curl -sL https://raw.githubusercontent.com/bkkp/authnix/main/authnix.sh) <your-github-token>
```
