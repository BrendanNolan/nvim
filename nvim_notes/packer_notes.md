Make a snapshot by going to packer.lua and running
`:so`
followed by
`:PackerSnapshot ~/.config/nvim/packer_snapshot`.

Apply a snapshot by running `:PackerSnapshotRollback <absolute path to snapshot_file>`. It seems
like you may then need to run `:PackerCompile`.

