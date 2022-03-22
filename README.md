# diff-therapy.nvim

resolve those conflicts and have a happy relationship with git

## Goals

Re-use as much as possible of `:help diff`, but also add new ways of looking
at the conflicts and shortcuts for resolving them (that we can add locally
to the buffer)

- [ ] 3-way merge of branches (shows you context of base branch)
  - [ ] Use virtual text and virtual lines to provide additional context to the user
- [ ] Keyboard shortcut to choose left, choose right, choose base or modify
- [ ] Folding for diff (probably using builtin `diff` stuff)
- [ ] Move to next diff (but probably can just be ]c and [c ?)

## Possible Extensions

- Easy git log viewer / git tree visualization for a buffer, so you can figure out how this happened

## Recommended settings

Seems like default diff algo doesn't like this kind of merge, so maybe you need:

```lua
vim.opt.diffopt = { "internal", "filler", "closeoff", "hiddenoff", "algorithm:minimal" }
```
