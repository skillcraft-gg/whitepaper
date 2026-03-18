## Ecosystem Architecture

Skillcraft is split into repositories to keep responsibilities narrow and testable.

### CLI Core (`skillcraft`)

The `skillcraft` repository provides command-line tooling and local hooks.
Its primary role is to capture evidence and submit claims while remaining mostly local-first.
Key commands include:

- `enable` and repository lifecycle operations,
- `skills` management (`add`, `inspect`, `search`, `publish`),
- loadout context operations (`loadout use`, `loadout clear`, `loadout share`),
- evidence progress tracking (`progress`), and
- claim submission (`claim`).

The CLI interacts with a repository-local state model in `.git/skillcraft/` and a global config in `~/.skillcraft/`.

### Skill Registry (`skills`)

The `skills` repository is the canonical source of installable capability definitions.
It contains machine-readable skill definitions (`skill.yaml`), references, and support assets.

The CLI can publish entries with `skillcraft skills publish <owner>/<slug>`.
Build and validation workflows enforce schema correctness and identifier format.
Build outputs generate search and discovery indexes consumed by tools and the site.

### Loadouts Registry (`loadouts`)

The `loadouts` repository defines reusable workflow bundles in `loadout.yaml` files.
Loadouts group skills into practical usage profiles, for example a secure development profile combining threat modeling and review-oriented checks.

The CLI can submit loadouts with `loadout share <owner>/<slug>`, and the expected data shape is validated before merge.

### Credentials Registry (`credentials`)

The `credentials` repository defines claimable credentials and requirement predicates.
A credential definition can require:

- minimum commits,
- skill constraints,
- loadout constraints,
- and logical mode (`and` or `or`) for mixed requirements.

Claims are verified by GitHub Actions, and successful results write issued artifacts under `issued/users/...`.

### Public Site (`skillcraft-gg.github.io`)

The site repository is static and serves public content for:
- `/`, `/docs`,
- `/skills`, `/skills/<owner>/<slug>`,
- `/loadouts`, `/loadouts/<owner>/<slug>`,
- `/credentials`, `/credentials/users/<github>`.

Builds are triggered from registry changes and intended to validate schema, references, and required files before publishing to GitHub Pages.

The architectural result is a distributed but tightly patterned system:
local evidence capture, central registry definitions, and public static publication.
