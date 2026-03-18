## Identifiers and Cross-Repository Contracts

The ecosystem depends on shared identifier shape.
The common form is `owner/slug`, with optional external source forms in search contexts.
This compact convention supports registry integrity and discoverability.

Contracts are enforced at multiple layers:

- skill identifiers in skill manifests and proofs,
- loadout identifiers in context and share flows,
- credential identifiers in claim targets and issued receipts,
- repository routes that map to `owner/slug` definitions.

Because registries are separate, these identifiers are the glue between independent systems.
When one repository changes, others consume the new shape only through declared artifacts and indexes.
**Contract discipline**: the system is strongest when identity, schema, and reference validation are applied at every boundary, including local command flow, CI build, and credential policy.

Validation workflows in the registry repos already test identifier format and schema validity.
The remaining implementation priority is deeper consistency checks during integration and CLI verification paths.
