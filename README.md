# Push & deploy

This are tools I use to deploy sites on my personnal server.

## Configuration

```
cp src/config/current.sh{-dist,}
```

And edit `current.sh` with our configuration.

## src/hooks/post-receive

This hook makes many thinks:

* push to mirrors;
* publish public repositories to `$PUBLIC_REPOSITORIES_DIR` and:
    * link configuration from /etc/app;
    * execute `make` if a Makefile exists;
* public `gh-pages` branch to `$WEROOT_DIR`.

## src/create_depo

Easily create a new repository with mirror on gitlab and github (for public
repository only).

```
deploy/src/create_depo repo_name public
```

## src/receive

This command is used via ssh to overwrite repositories location.

In your `~/.ssh/authorized_keys`:

```
command="deploy/src/receive" ssh-rsa …
```
