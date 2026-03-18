## Loadouts and Skill Composition

Skills define atomic capabilities.
Loadouts define operational workflows.

This distinction supports reuse. A single skill like threat modeling can be reused across projects.
A loadout groups threat modeling with code review and dependency analysis and provides a stronger story about a team workflow.

When developers run `skillcraft loadout use <id>`, the loadout id is stored in
`.git/skillcraft/context.json`.
Commit proofs can then include active loadouts and provide better signal than standalone skill events.

The design does not require loadouts for every use case.
Loadouts are optional, yet intended as the practical path from isolated capabilities to role-level evidence.

At present, this layer is partially implemented:
- CLI loadout context operations are present,
- publish flow for loadouts exists,
- but the public loadout registry dataset is still incomplete.

That gap matters because it keeps the model theoretically sound but not fully discoverable for all users yet.
