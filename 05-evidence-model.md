## Evidence Model

Skillcraft treats evidence as first-class infrastructure.
Evidence is generated from ordinary development flow, not separate forms or external logging services.

The capture sequence is:

1. A skill is invoked in development flow.
2. An integration records a local skill event.
3. A commit hook materializes one or more proof objects in the proof branch.
4. The commit contains a reference trailer to the proof.
5. `skillcraft verify` parses trailer references and validates referenced proof objects.

The proof payload includes commit hash, captured skills, optional loadout context, and timestamp.

The proof branch is maintained as separate Git history rather than branching from the repository's main development branch.

**Evidence unit**: the combination of a commit trailer and a proof object that binds activity to verifiable state.

Loadout context is important because it captures process intent.
The same skill usage can have different significance depending on the active workflow bundle, and the proof object records that distinction.

Proof identifiers are derived from proof inputs (for example commit, skills, timestamp) and then shortened for compact reference use in commit trailers.

Commit trails give this model a practical property:
any reviewer can inspect repository history and directly follow the pointer to proof data.
