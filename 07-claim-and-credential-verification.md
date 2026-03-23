## Claim and Credential Verification

The claim layer is where the ecosystem’s trust model becomes operational.

### Claim Submission

A claim is typically submitted by the CLI with:

`skillcraft claim <credential-id>`

The command creates an issue in `skillcraft-gg/credentials` using structured payload data:
- claimant identity,
- target credential id,
- source repositories,
- list of commit hashes used as evidence anchors.

### Credential Pipeline

GitHub Actions in the credentials repository validate the claim in deterministic steps:

1. parse claim payload,
2. load target credential definition,
3. verify source repository access,
4. verify claimed commits and proof availability,
5. evaluate requirements (`min_commits`, `min_repositories`, `skill`, `loadout`, `agent`, `model`, and nested `and`/`or` expressions).

Requirements are expressed as expression trees:

- top-level shorthand fields are implicit `and` clauses,
- `and` requires every child node,
- `or` requires at least one child node,
- `agent` requires matching `agent.provider` in proven proofs,
- `model` requires matching `model.provider` and/or `model.name` in proven proofs,
- `min_repositories` enforces unique proof repository count.

On success, the claim state transitions and issuance artifacts are written into
`issued/users/<github>/<owner>/<slug>/credential.yaml`, and registry indexes are refreshed.
On failure, state is marked rejected and the issue contains diagnostics.

### Trust Consequence

This creates two classes of signal:
- traceable local artifacts, which are useful and inspectable,
- credential-issued artifacts, which represent higher trust because they have passed policy checks.

The public index model allows verification outcomes to remain discoverable without exposing private repository internals.

**Issuance rule**: an issued credential is a policy-verified assertion composed of evidence, requirements, and deterministic verification output.
