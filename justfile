set shell := ["bash", "-cu"]
set windows-shell := ["powershell"]

node_bin := "./node_modules/.bin/"
biome := node_bin + "biome"

biome_config := "./packages/biome/biome.jsonc"

# Default action
_:
    just lint
    just fmt

# Install
i:
    pnpm install

# Setup the project
setup:
    brew install ls-lint typos-cli
    just i

# Lint code
lint:
    ls-lint
    typos

# Format code
fmt:
    node ./scripts/set-root.js {{biome_config}}
    ./{{biome}} check --write .
    node ./scripts/set-root.js {{biome_config}}

# Clean up
clean:
    rm -rf ./node_modules
    rm -rf ./packages/biome/node_modules
