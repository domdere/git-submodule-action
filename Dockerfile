FROM irreverentpixelfeats/dev-base:ubuntu_xenial-20190205124619-c524a1c

LABEL repository="http://github.com/domdere/git-submodule-action"
LABEL homepage="http://github.com/domdere/git-submodule-action"
LABEL "com.github.actions.name"="Bump Git Submodules"
LABEL "com.github.actions.description"="Bump git submodules on '/submodules' comment"
LABEL "com.github.actions.icon"="git-pull-request"
LABEL "com.github.actions.color"="blue"

ADD entrypoint /entrypoint
ENTRYPOINT ["/entrypoint"]
