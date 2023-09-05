local cmp = require('cmp')

cmp.setup {
  mapping = {
    ['<C-g>'] = cmp.mapping.complete()
  }
}
