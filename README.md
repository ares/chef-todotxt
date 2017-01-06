Description
===========

Cookbook for managing todo.txt client

Requirements
============

desktop cookbook to create directories where we store todo.txt
users cookbook to set the user account
zsh cookbook which configures zsh which we hook into

Attributes
==========

Usage
=====

Just include `todotxt` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[todotxt]"
  ]
}
```


