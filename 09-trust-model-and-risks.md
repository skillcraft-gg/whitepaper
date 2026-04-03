## Trust Model and Risk Surface

Skillcraft’s trust model is explicit and layered.
The chain from claim input to issued credential is separated into verifiable phases.

### Trust Layers

1. **Capture Layer**
Local evidence is generated from repository activity and committed in a traceable form.

2. **Registry Layer**
Skills, loadouts, and credentials are validated through CI checks before publication artifacts are produced.

3. **Policy Layer**
Claims are evaluated by credential workflows that enforce defined requirements.

4. **Publication Layer**
Generated indexes and site pages expose public output for discovery and inspection.

### Current Risks

- Proof verification is implemented in CLI paths; remaining work is stricter schema enforcement and cross-boundary identifier consistency checks.

### Mitigation Principles

The mitigations remain aligned with the existing architecture:
- fail fast on invalid registry payloads,
- keep commit and proof references inspectable,
- preserve static publish pipelines,
- keep requirement policies explicit and versionable.

This yields a practical trust boundary: the system improves as each layer becomes stricter, without requiring rewrites.
