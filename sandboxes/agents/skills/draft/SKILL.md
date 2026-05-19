---
name: draft
description: Turn requirements into a structure plan
---

# Skill: planning

You must use this skill and provide structured plan before making any code changes.

## Purpose

Create or update a structured plan from a user requirement.

This skill turns a rough feature request into a clear implementation plan containing:

This skill does **not** implement the feature. It only plans it.

Use: `./references/plan-template.md` for the new plan

## When to Use

Use this skill when the user wants to:

- plan a new feature
- break a feature into user stories and tasks
- update an existing plan based on new information
- revise a plan after review feedback
- prepare a feature for implementation

## Before You Plan

1. **Explore the codebase.** Do not write a generic plan.
   - List the root directory and key subdirectories.
   - Read the README, package manifests, and config files.
   - Identify the main source files, frameworks, and dependencies.
   - Look at existing tests to understand coverage and conventions.
2. **Map the requirement to reality.**
   - Note which files/modules will be affected.
   - Record actual technologies in use (language, DB, framework).
   - Flag files that must stay unchanged vs. be modified.
3. **Write a concrete plan** based on what you found, not assumptions.
