## prerequisites

(_pardon the OS X bias_)

Install `docker` and cohorts:

  1. `brew install docker docker-machine docker-compose`

(Optional) Install `virtualbox` to host local VMs.

  > (`docker-machine` has drivers for `vmwarefusion`, `vmwarevsphere`,
  `amazonec2`, `virtualbox`, and other interesting providers, but `virtualbox`
  is free so we'll use it here)

  1. `brew install caskroom/cask/brew-cask`
  2. `brew cask install virtualbox`

## get started

We can create a Linux host VM and point our local `docker` client at it with:

  1. `docker-machine create --driver virtualbox dev`
  2. `eval "$(docker-machine env dev)"`

Then boot our `consul` cluster by running:

  1. `docker-compose up`

And lastly, we can view the `consul ui` by running:

  1. `docker-compose ip` to get the address of our VM host
  2. `open http://x.x.x.x:8500/ui/`
