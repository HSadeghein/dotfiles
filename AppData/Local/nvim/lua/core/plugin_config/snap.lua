local snap = require('snap')
snap.maps {
  {"<Leader><Leader>", snap.config.file {producer = "ripgrep.file"}},
  {"<Leader>fb", snap.config.file {producer = "vim.buffer"}},
  {"<Leader>fo", snap.config.file {producer = "vim.oldfile"}},
  {"<Leader>ff", snap.run {
  producer = snap.get'producer.ripgrep.vimgrep',
  steps = {{
    consumer = snap.get'consumer.fzf',
    config = {prompt = "FZF>"}
  }},
  select = snap.get'select.file'.select,
  multiselect = snap.get'select.file'.multiselect,
  views = {snap.get'preview.file'}
}},
}
