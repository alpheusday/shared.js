const fs = require("node:fs");

const path = process.argv[2];

const content = fs.readFileSync(path, "utf-8");

if (content.includes('"root": true')) {
    fs.writeFileSync(
        path,
        content.replace(/"root"\s*:\s*true/, '"root": false'),
    );
} else {
    fs.writeFileSync(
        path,
        content.replace(/"root"\s*:\s*false/, '"root": true'),
    );
}
