## Introduction

The skill economy is changing quickly.
AI coding agents have reduced development cost and increased output, which is good for speed but noisy for hiring,
reliability, and trust decisions. A polished repository can hide weak process.

Skillcraft starts from a simple premise: trustworthy claims must be reproducible.
If a claim can be traced from a commit context, to proof artifacts, to a publicly defined credential policy,
then capability becomes auditable rather than anecdotal.

The landing page message captures this directly:
output is no longer enough, so we need proof of work patterns.

Skillcraft supports this through a small set of public repos and explicit data contracts.

1. The `skillcraft` CLI captures behavior and drives claim submission.
2. The `skills` registry defines what capabilities exist.
3. The `loadouts` registry defines reusable capability bundles.
4. The `credentials` registry defines what counts as validated proof.
5. The `skillcraft-gg.github.io` site renders implemented public registry artifacts.

This whitepaper intentionally stays practical.
It emphasizes not only architecture intent, but also what currently runs, what remains partial, and where verification quality is strongest.
