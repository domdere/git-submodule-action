# git-submodule-action

An action that bumps the submodules in a repo.

Once you have installed it, you can trigger it with a `/submodules` comment
on a PR.

Example workflow:

```
workflow "Bump Submodules" {
  on = "issue_comment"
  resolves = ["bump-submodules"]
}

action "bump-submodules" {
  uses = "domdere/git-submodule-action@master"
}
```


